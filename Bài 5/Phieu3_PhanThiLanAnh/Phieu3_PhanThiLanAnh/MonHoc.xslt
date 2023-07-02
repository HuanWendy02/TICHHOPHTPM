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
						<th>MaMh</th>
						<th>TenMh</th>
						<th>SoGio</th>
					</tr>
					<xsl:for-each select="DS/MonHoc">
						<tr>
							<td>
								<xsl:value-of select="MaMH"/>
							</td>
							<td>
								<xsl:value-of select="TenMH"/>
							</td>
							<td>
								<xsl:value-of select="SoGio"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
