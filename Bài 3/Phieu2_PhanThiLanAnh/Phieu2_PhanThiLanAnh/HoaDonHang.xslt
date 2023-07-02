<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
				xmlns:a="http://tempuri.org/HoaDonHang.xsd"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<head>
				<title>List</title>
			</head>
			<body>
				<table>
					<tr>
						<td>BỆNH VIỆN ĐA KHOA</td>
						<br></br>
						<td style="font-weight:bold">DANH SÁCH BỆNH NHÂN</td>
					</tr>
					<tr>
						<td>Khoa: <xsl:value-of select="a:BVDK/a:Khoa/a:TenKhoa"/>
					</td>
					</tr>
				</table>
				<table border="1">
					<tr>
						<th>STT</th>
						<th>Họ tên</th>
						<th>Ngày nhập viện</th>
						<th>Số ngày điều trị</th>
						<th>Số tiền phải trả</th>
					</tr>
					<xsl:for-each select="a:BVDK/a:Khoa/a:BenhNhan">
						<tr>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<xsl:value-of select="a:HoTen"/>
							</td>
							<td>
								<xsl:value-of select="a:NgayNhapVien"/>
							</td>
							<td>
								<xsl:value-of select="a:SoNgayNamVien"/>
							</td>
							<td>
								<xsl:value-of select="a:SoNgayNamVien*15000"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
