<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:output method="xml" encoding="UTF-8"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:byline[following-sibling::tei:div[position() = 1]]"/>
    
    <xsl:template match="tei:div[preceding-sibling::tei:byline[position() = 1]]">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <xsl:copy-of select="preceding-sibling::tei:byline[position() = 1]"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>