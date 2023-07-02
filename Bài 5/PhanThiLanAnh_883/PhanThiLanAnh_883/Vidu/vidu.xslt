<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/GOC">
		<html>
			<head>
				<title>Vidu</title>
			</head>
			<body>
				<!--<b>Tổng 2 số là:</b>
				<xsl:value-of select="/GOC/SO[1]"/>+
				<xsl:value-of select="/GOC/SO[2]"/>=
				<xsl:value-of select="/GOC/SO[1]+/GOC/SO[2]"/>-->
				<b>Tổng 2 số  là:</b>
				<xsl:variable name="a" select="/GOC/SO[1]"/>
				<xsl:variable name="b" select="/GOC/SO[2]"/>
				<xsl:value-of select="$a"/> + <xsl:value-of select="$b"/>=
				<xsl:value-of select="$a+$b"/>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
