<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
				xmlns:a="http://tempuri.org/HoaDon.xsd"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<head>
				<title>Hóa đơn</title>
			<link rel="stylesheet" type="text/css" href="style.css"/>
			</head>
			<body>
				<xsl:for-each select="a:DS/a:HoaDon">
					<h1>PHIẾU MUA HÀNG</h1>
					<table border="0">
						<tr>
							<th>Hóa đơn: <xsl:value-of select="a:MaHD"/>
						</th>
							<th>Ngày bán: <xsl:value-of select="a:NgayBan"/>
						</th>
						</tr>
					</table>
					<h4>Loại hàng: <xsl:value-of select="a:LoaiHang/@TenLoai"/>
				</h4>
					<table border="1" width="100%" class="hihi">
						<tr>
							<th>Mã hàng</th>
							<th>Tên hàng</th>
							<th>Số lượng</th>
							<th>Đơn giá</th>
							<th>Thành tiền</th>
						</tr>
						<xsl:for-each select="a:LoaiHang/a:Hang">
							<tr>
								<td class="so">
									<xsl:value-of select="@MaHang"/>
								</td>
								<td class="chuoi">
									<xsl:value-of select="a:TenHang"/>
								</td>
								<td class="so">
									<xsl:value-of select="a:SoLuong"/>
								</td>
								<td class="so">
									<xsl:value-of select="a:DonGia"/>
								</td>
								<td class="so">
									<xsl:value-of select="a:SoLuong*a:DonGia"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<p>Người giao</p>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
