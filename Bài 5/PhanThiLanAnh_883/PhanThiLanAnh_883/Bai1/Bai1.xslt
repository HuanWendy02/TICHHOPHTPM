<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/goc">
		<html>
			<xsl:variable name="a" select="/goc/hsa"/>
			<xsl:variable name="b" select="/goc/hsb"/>
			<xsl:if test="$b=0 and $a!=0">
				Phương trình vô nghiệm
			</xsl:if>
			<xsl:if test="$a!=0 and $b!=0">
				Phương trình có nghiệm là:
				<xsl:value-of select="-$b div $a"/>
			</xsl:if>
		</html>
    </xsl:template>
</xsl:stylesheet>
