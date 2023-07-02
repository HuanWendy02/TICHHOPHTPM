<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<body>
				<xsl:for-each select="BVDK/Khoa">
					<table border="0">
						<tr>
							<th>BỆNH VIỆN ĐA KHOA</th>
							<th font-weight="bold">DANH SÁCH BỆNH NHÂN</th>
						</tr>
						<tr>
							<th>
								Khoa: <xsl:value-of select="TenKhoa"/>
							</th>
							<th>
								Phòng: <xsl:value-of select="Phong"/>
							</th>
						</tr>
					</table>
						<table border="2" width="100%">
							<tr>
								<th>Mã số BN</th>
								<th>Họ tên</th>
								<th>Ngày nhập viện</th>
								<th>Số ngày điều trị</th>
								<th>Số tiền phải trả</th>
							</tr>
							<xsl:for-each select="BenhNhan">
							<tr>
								<td>
									<xsl:value-of select="@MaSoBN"/>
								</td>
								<td>
									<xsl:value-of select="HoTen"/>
								</td>
								<td>
									<xsl:value-of select="NgayNhapVien"/>
								</td>
								<td>
									<xsl:value-of select="NgayDieuTri"/>
								</td>
								<td>
									<xsl:value-of select="NgayDieuTri*15000"/>
								</td>
							</tr>
							</xsl:for-each>
						</table>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
