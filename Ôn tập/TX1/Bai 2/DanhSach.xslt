<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
				xmlns:a="http://tempuri.org/DanhSach.xsd"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<head>
				<title>lương</title>
				<link rel="stylesheet" type="text/css" href="Style.css"></link>
			</head>
			<body>
				<h1>BẢNG LƯƠNG THÁNG 11</h1>
				<h3>
					Tên công ty: <xsl:value-of select="a:DS/a:congty/@tenCT"/>
				</h3>
				<xsl:for-each select="a:DS/a:congty/a:donvi">
					<h3>
						Tên phòng: <xsl:value-of select="a:tendv"/>
					</h3>
					<table border="2" width="100%">
						<tr class="tieude">
							<th>STT</th>
							<th>Họ tên</th>
							<th>Ngày sinh</th>
							<th>Hệ số lương</th>
							<th>Lương</th>
						</tr>
						<xsl:for-each select="a:nhanvien">
							<tr class="hihi">
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
									<xsl:value-of select="a:hsluong"/>
								</td>
								<td>
									<xsl:value-of select="a:hsluong*730000"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
			</xsl:for-each>
			<h2>THỦ TRƯỞNG ĐƠN VỊ</h2>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
