<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<head>
				<title>Danh sách hàng hóa</title>
			</head>
			<body>
				<xsl:for-each select="DS/HoaDon">
				<h1>PHIẾU MUA HÀNG</h1>
				<br></br>
				<table border="0">
					<tr>
						<td>Hóa đơn: <xsl:value-of select="MaHD"/>
					</td>
						<td>Ngày bán: <xsl:value-of select="NgayBan"/>
					</td>
					</tr>
					<tr>
						<td>Loại hàng: <xsl:value-of select="LoaiHang/@TenLoai"/>
					</td>
					</tr>
				</table>
				<table border="2">
					<tr bgcolor="green">
						<td>STT</td>
						<td>Mã hàng</td>
						<td>Tên hàng</td>
						<td>Số lượng</td>
						<td>Đơn giá</td>
						<td>Thành tiền</td>
					</tr>
					<xsl:for-each select="LoaiHang/Hang">
						<tr>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<xsl:value-of select="@MaHang"/>
							</td>
							<td>
								<xsl:value-of select="TenHang"/>
							</td>
							<td>
								<xsl:value-of select="SoLuong"/>
							</td>
							<td>
								<xsl:value-of select="DonGia"/>
							</td>
							<td>
								<xsl:value-of select="SoLuong*DonGia"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
