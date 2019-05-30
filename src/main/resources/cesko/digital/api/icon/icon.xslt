<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/icon">
        <svg version="1.0" viewBox="440 430 220 220">
            <xsl:apply-templates select="size"/>
            <xsl:apply-templates select="type"/>
            <path
                d="M549.26,624.4c34.1,0,72.73-10.93,89.05-21.49c1.28-0.83,2.53-1.96,2.53-4.63c0-4.28-2.01-14.42-4.65-20.95
                c-3.41-8.45-7.28-12.09-14.33-15.02c-15.02-6.25-37.43-11.36-43.18-14.06c-6.92-3.26-7.81-7.88-7.81-13.57
                c0-0.78,0.42-1.41,0.81-1.92c5.56-7.37,9.29-16.23,11.27-25.61c0.43,0,3.53-3.39,5.29-8.14c1.97-5.33,3.87-13.47,0.12-13.47
                c0.29-1.31,0.64-5.47,0.65-7.89c0.07-17.51-10.96-38.62-39.75-38.62s-39.82,21.11-39.75,38.62c0.01,2.42,0.35,6.58,0.65,7.89
                c-3.75,0-1.85,8.14,0.12,13.47c1.76,4.75,4.86,8.14,5.29,8.14c1.98,9.38,5.71,18.24,11.27,25.61c0.39,0.51,0.81,1.14,0.81,1.92
                c0,5.69-0.06,10.31-6.99,13.57c-5.75,2.71-28.98,7.82-44,14.06c-7.05,2.93-10.92,6.57-14.33,15.02c-2.63,6.53-4.65,16.67-4.65,20.95
                c0,2.67,1.25,3.8,2.53,4.63C476.53,613.47,515.16,624.4,549.26,624.4z">
                <xsl:call-template name="silhouette"/>
            </path>
            <xsl:apply-templates select="input"/>
        </svg>
    </xsl:template>
    
    <xsl:template match="/icon/input[number(.) ge 0 and number(.) lt 10]">
        <circle cx="578.96" cy="605.65" r="33.32">
            <xsl:call-template name="circle"/>
        </circle>
        <text transform="translate(564.8187 623.4655)">
            <xsl:call-template name="text"/>
            <xsl:value-of select="."/>
        </text>
    </xsl:template>
    
    <xsl:template match="/icon/input[number(.) ge 10 and number(.) lt 100]">
        <g transform="translate(-279.5 0)">
            <path
                d="M871.98,638.97h-26.95c-18.33,0-33.32-14.99-33.32-33.32v0c0-18.33,14.99-33.32,33.32-33.32h26.95
                c18.33,0,33.32,14.99,33.32,33.32v0C905.3,623.97,890.3,638.97,871.98,638.97z">
                <xsl:call-template name="circle"/>
            </path>
            <text transform="translate(830.5719 623.4655)">
                <xsl:call-template name="text"/>
                <xsl:value-of select="."/>
            </text>
        </g>
    </xsl:template>
    
    <xsl:template match="/icon/input[number(.) ge 100 and number(.) lt 1000]">
        <g transform="translate(-554.4 0)">
            <path
                d="M1153.13,638.97h-55.25c-18.33,0-33.32-14.99-33.32-33.32v0c0-18.33,14.99-33.32,33.32-33.32h55.25
                c18.33,0,33.32,14.99,33.32,33.32v0C1186.46,623.97,1171.46,638.97,1153.13,638.97z">
                <xsl:call-template name="circle"/>
            </path>
            <text transform="translate(1083.4027 623.4655)">
                <xsl:call-template name="text"/>
                <xsl:value-of select="."/>                
            </text>
        </g>
    </xsl:template>
    
    <xsl:template match="/icon/input[number(.) ge 1000 and number(.) lt 10000]">
        <g transform="translate(-829.5 0)">
            <path
                d="M1442.21,638.97h-83.55c-18.33,0-33.32-14.99-33.32-33.32v0c0-18.33,14.99-33.32,33.32-33.32h83.55
                c18.33,0,33.32,14.99,33.32,33.32v0C1475.53,623.97,1460.54,638.97,1442.21,638.97z">
                <xsl:call-template name="circle"/>
            </path>
            <text transform="translate(1344.1857 623.4655)">
                <xsl:call-template name="text"/>
                <xsl:value-of select="."/>                
            </text>
        </g>
    </xsl:template>
    
    <xsl:template match="/icon/type['full']">
        <rect x="440" y="430" width="220" height="220">
            <xsl:apply-templates select="../background" />
        </rect>
    </xsl:template>
    
    <xsl:template match="/icon/type['circle']">
        <circle cx="550" cy="540" r="110">
            <xsl:apply-templates select="../background" />
        </circle>
    </xsl:template>
    
    <xsl:template match="/icon/background">
        <xsl:attribute name="fill"><xsl:value-of select="."/></xsl:attribute>
    </xsl:template>

    <xsl:template match="/icon/size">
        <xsl:attribute name="width"><xsl:value-of select="."/></xsl:attribute>
        <xsl:attribute name="height"><xsl:value-of select="."/></xsl:attribute>
    </xsl:template>
    
    <xsl:template name="silhouette">
        <xsl:choose>
            <xsl:when test="/icon/theme = 'bw'">
                <xsl:attribute name="fill">black</xsl:attribute>
            </xsl:when>
            <xsl:when test="/icon/theme = ('grey', 'gray')">
                <xsl:attribute name="fill">gray</xsl:attribute>
            </xsl:when>
            <xsl:when test="/icon/theme = 'negative'">
                <xsl:attribute name="fill">white</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="fill">#1428C8</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="text">
        <xsl:attribute name="font-size">50px</xsl:attribute>
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:choose>
            <xsl:when test="/icon/theme = 'bw'">
                <xsl:attribute name="fill">black</xsl:attribute>
            </xsl:when>
            <xsl:when test="/icon/theme = 'negative'">
                <xsl:attribute name="fill">black</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="fill">white</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="circle">
        <xsl:attribute name="stroke-width">2.8993</xsl:attribute>
        <xsl:attribute name="stroke-miterlimit">10</xsl:attribute>
        <xsl:choose>
            <xsl:when test="/icon/theme = 'bw'">
                <xsl:attribute name="stroke">black</xsl:attribute>
                <xsl:attribute name="fill">white</xsl:attribute>
            </xsl:when>
            <xsl:when test="/icon/theme = ('grey', 'gray')">
                <xsl:attribute name="stroke">white</xsl:attribute>
                <xsl:attribute name="fill">black</xsl:attribute>
            </xsl:when>
            <xsl:when test="/icon/theme = 'negative'">
                <xsl:attribute name="stroke">black</xsl:attribute>
                <xsl:attribute name="fill">white</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="stroke">white</xsl:attribute>
                <xsl:attribute name="fill">#FF2341</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
