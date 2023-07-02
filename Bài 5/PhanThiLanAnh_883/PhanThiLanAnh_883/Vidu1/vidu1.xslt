<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/GOC">
		<html></html>
		<body>
			<!--<xsl:variable name="So_1" select="/GOC/SO[1]"/>
			<xsl:variable name="So_2" select="/GOC/SO[2]"/>
				Số lớn nhất giữa 2 số
			<xsl:value-of select="$So_1"/> và <xsl:value-of select="$So_2"/> là:
			<xsl:if test="$So_1>$So_2">
			<xsl:value-of select="$So_1"/>
		</xsl:if>
			<xsl:if test="$So_1&lt;=$So_2">
				<xsl:value-of select="$So_2"/>
			</xsl:if>-->
			<xsl:variable name="So_1" select="/GOC/SO[1]"/>
			<xsl:variable name="So_2" select="/GOC/SO[2]"/>
			Số lớn nhất giữa 2 số <xsl:value-of select="$So_1"/> và <xsl:value-of select="$So_2"/> là:
			<xsl:choose>
				<xsl:when test="$So_1>$So_2">
					<xsl:value-of select="$So_1"/>
				</xsl:when>
				<xsl:when test="$So_1>$So_2">
					<xsl:value-of select="$So_2"/>
				</xsl:when>
			</xsl:choose>
		</body>
    </xsl:template>
</xsl:stylesheet>
