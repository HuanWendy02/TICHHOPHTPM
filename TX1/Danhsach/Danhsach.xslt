<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
				xmlns:a="http://tempuri.org/Danhsach.xsd"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="style.css"/>
			</head>
			<body>
				<h1>BẢNG LƯƠNG THÁNG 11</h1>
				<xsl:for-each select="a:DS/a:congty">
					<h3>Tên công ty: <xsl:value-of select="@tenCT"/>
				</h3>
					<h3>Tên phòng: <xsl:value-of select="a:donvi/a:tendv"/>
				</h3>
					<table border="1" width="100%" cellspacing="0">
						<tr>
							<th>STT</th>
							<th>Họ tên</th>
							<th>Ngày sinh</th>
							<th>Ngày công</th>
							<th>Lương</th>
						</tr>
						<xsl:for-each select="a:donvi/a:nhanvien">
							<tr>
								<td>
									<xsl:value-of select="position()"/>
								</td>
								<td>
									<xsl:value-of select="a:hoten"/>
								</td>
								<td>
									<xsl:value-of select="a:ngaysinh"/>
								</td>
								<td>
									<xsl:value-of select="a:ngaycong"/>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="a:ngaycong&gt;0 and a:ngaycong&lt;=20">
											<xsl:value-of select="a:ngaycong * 150000"/>
										</xsl:when>
										<xsl:when test="a:ngaycong&gt;20 and a:ngaycong&lt;=25">
											<xsl:value-of select="20 * 150000 + (a:ngaycong - 20) * 200000"/>
										</xsl:when>
										<xsl:when test="a:ngaycong&gt;25">
											<xsl:value-of select="20 * 150000 + 5*200000 + (a:ngaycong - 25) * 250000"/>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
