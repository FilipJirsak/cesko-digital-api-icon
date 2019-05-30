package cesko.digital.api.icon;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
import net.sf.saxon.s9api.*;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.DocumentSource;

import javax.xml.transform.stream.StreamSource;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.Collections;
import java.util.Map;

public class IconHandler implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {
  private final Processor processor;
  private final ThreadLocal<XsltTransformer> xslt;

  public IconHandler() throws IOException, SaxonApiException {
    this.processor = new Processor(false);
    XsltCompiler xsltCompiler = processor.newXsltCompiler();
    try (InputStream xltStream = IconHandler.class.getResourceAsStream("icon.xslt")) {
      final XsltExecutable xsltExecutable = xsltCompiler.compile(new StreamSource(xltStream));
      this.xslt = ThreadLocal.withInitial(xsltExecutable::load);
    }
  }

  @Override
  public APIGatewayProxyResponseEvent handleRequest(APIGatewayProxyRequestEvent request, Context context) {
    try {
      Document source = createSource(request.getQueryStringParameters());
      String output = transform(source);

      return new APIGatewayProxyResponseEvent()
              .withStatusCode(200)
              .withHeaders(Collections.singletonMap("Content-Type", "image/svg+xml"))
              .withBody(output);
    } catch (SaxonApiException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  private Document createSource(Map<String, String> params) {
    Element root = DocumentHelper.createElement("icon");
    if (params != null) {
      for (Map.Entry<String, String> param : params.entrySet()) {
        root.addElement(param.getKey()).setText(param.getValue());
      }
    }
    return DocumentHelper.createDocument(root);
  }

  private String transform(Document source) throws SaxonApiException, IOException {
    XsltTransformer transformer = xslt.get();
    Serializer serializer = null;
    try (StringWriter writer = new StringWriter()) {
      serializer = processor.newSerializer(writer);
      transformer.setSource(new DocumentSource(source));
      transformer.setDestination(serializer);
      transformer.transform();
      return writer.toString();
    } finally {
      if (serializer != null) {
        serializer.close();
      }
    }
  }
}