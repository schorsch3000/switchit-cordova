<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:param name="version" select="version"/>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <widget>
            <xsl:copy-of select="/*/@*" />
            <xsl:attribute name="android-versionCode">
                <xsl:value-of select="$version"/>
            </xsl:attribute>
        <xsl:apply-templates/>
        </widget>

    </xsl:template>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>