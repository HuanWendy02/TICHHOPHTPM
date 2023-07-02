<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
		<body>
		<h1>THÔNG TIN MÔN HỌC</h1>
		<table border="1" width="100%">
			<tr>
				<th>MaSv</th>
				<th>MaMh</th>
				<th>DiemThi</th>
			</tr>
			<xsl:for-each select="DS/MonHoc">
				<xsl:sort select="DiemThi"/>
				<tr>
					<td>
						<xsl:value-of select="@MaSV"/>
					</td>
					<td>
						<xsl:value-of select="MaMH"/>
					</td>
					<td>
						<xsl:choose> <xsl:when test="DiemThi&gt;=0">
							<xsl:value-of select="DiemThi"/>
						</xsl:when>
									 <xsl:when test="DiemThi&lt;=10">
							<xsl:value-of select="DiemThi"/>
						</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
