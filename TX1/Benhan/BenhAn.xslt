<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
			<head>
				<titel>List</titel>
			</head>
			<body>
				<h2>DANH SÁCH BỆNH NHÂN</h2>
					<h3>
						Tên khoa: <xsl:value-of select="QLBA/Khoa/TenKhoa"/>
					</h3>
					<h3>
						Trưởng khoa: <xsl:value-of select="QLBA/Khoa/@TruongKhoa"/>
					</h3>
					<table border="2" width="100%" cellspacing="0">
						<tr>
							<th>Mã số</th>
							<th>Họ tên</th>
							<th>Giới tính</th>
							<th>Số ngày nằm viện</th>
							<th>Tiền</th>
						</tr>
						<xsl:for-each select="QLBA/Khoa/BenhNhan">
							<tr>
								<td>
									<xsl:value-of select="@MaSo"/>
								</td>
								<td>
									<xsl:value-of select="HoTen"/>
								</td>
								<td>
									<xsl:value-of select="GioiTinh"/>
								</td>
								<td>
									<xsl:value-of select="SoNgayNamVien"/>
								</td>
								<td>
									<xsl:value-of select="SoNgayNamVien*6000"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<h3>Tổng tiền phải trả: <xsl:value-of select="SoNgayNamVien*6000"/>
					</h3>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
