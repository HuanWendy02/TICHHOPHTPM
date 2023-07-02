<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<body>
				<h1>THÔNG TIN SINH VIÊN</h1>
				<table border="2" width="50%">
					<tr>
						<th>STT</th>
						<th>MaSv</th>
						<th>TenSv</th>
						<th>GioiTinh</th>
						<th>NgaySinh</th>
						<th>MaLop</th>
					</tr>
					<xsl:for-each select="DS/SV"><xsl:sort select="TenSV"/
						>
						<tr>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<xsl:value-of select="MaSV"/>
							</td>
							<td>
								<xsl:value-of select="TenSV"/>
							</td>
							<td>
								<xsl:value-of select="GioiTinh"/>
							</td>
							<td>
								<xsl:value-of select="NgaySinh"/>
							</td>
							<td>
								<xsl:value-of select="@MaLop"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
