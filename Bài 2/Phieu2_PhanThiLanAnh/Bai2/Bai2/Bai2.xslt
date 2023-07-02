<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <xsl:copy>
			<body>
				<H2>Phiếu mua hàng</H2>
				<!--<h3>Hóa đơn: </h3>
				<h3>Ngày bán: </h3>
				<h3>Loại hàng</h3>-->
				<table border="1">
					<tr>
						<th>Mã HD</th>
						<th>Ngày bán</th>
						<th>Mã loại</th>
						<th>Tên loại</th>
						<th>Mã hàng</th>
						<th>Tên hàng</th>
						<th>Số lượng</th>
						<th>Đơn giá</th>
						
					</tr>
					<xsl:for-each select="DS/Hoadon/LoaiHang/Hang">
						<tr>
							<td>
								<xsl:value-of select="../../MaHD"/>
							</td>
							<td>
								<xsl:value-of select="../../NgayBan"/>
							</td>
							<td>
								<xsl:value-of select="../../LoaiHang/@MaLoai"/>
							</td>
							<td>
								<xsl:value-of select="../../LoaiHang/@TenLoai"/>
							</td>
							<td>
								<xsl:value-of select="@TenHang"/>
							</td>
							<td>
								<xsl:value-of select="@SoLuong"/>
							</td>
							<td>
								<xsl:value-of select="@DonViTinh"/>
							</td>
							<td>
								<xsl:value-of select="@DonGia"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3>Người giao</h3>
			</body>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
