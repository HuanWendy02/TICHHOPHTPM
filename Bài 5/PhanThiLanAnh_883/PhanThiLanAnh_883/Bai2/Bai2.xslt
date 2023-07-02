<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/TienDien">
		<html>
			<body>
				<xsl:variable name="a" select="/TienDien/DauThang"/>
				<xsl:variable name="b" select="/TienDien/CuoiThang"/>
				Tiền điện phải trả là:
				<xsl:choose>
					<xsl:when test="($b - $a)&gt;0 and ($b - $a)&lt;=100">
						<xsl:value-of select="($b - $a)*3000"/> Đồng
					</xsl:when>
					<xsl:when test="($b - $a)&gt;100 and ($b - $a)&lt;=150">
						<xsl:value-of select="($b - $a - 100)*4000 + 300000"/> Đồng
					</xsl:when>
					<xsl:when test="($b - $a)&gt;150 and ($b - $a)&lt;=200">
						<xsl:value-of select="($b - $a - 100)*4500 + 300000 + 200000"/> Đồng
					</xsl:when>
					<xsl:when test="($b - $a)&gt;200">
						<xsl:value-of select="($b - $a - 100)*5000 + 300000 + 200000 + 225000"/> Đồng
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
