<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
				xmlns:a="http://tempuri.org/Bai1.xsd"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<head>
				<title>Bai 6</title>
			</head>
			<body>
				<xsl:for-each select="a:KQHT/a:SV">
					<h1>Bảng kết quả học tập</h1>
					<h3>
						MaSV: <xsl:value-of select="a:MaSV"/> <br></br>
						Họ Tên: <xsl:value-of select="a:HoTen"/> <br></br>
						Ngày Sinh: <xsl:value-of select="a:NgaySinh"/> <br></br>
						Lớp: <xsl:value-of select="a:Lop"/> <br></br>
						<table>
							<tr>
								<th>STT</th>
								<th>Môn Học</th>
								<th>Lần 1</th>
								<th>Lần 2</th>
								<th>Cả năm</th>
							</tr>
							<xsl:for-each select="a:BangDiem/a:Mon">
								<tr>
									<td>
										<xsl:value-of select="a:STT"/>
									</td>
									<td>
										<xsl:value-of select="a:TenMon"/>
									</td>
									<td>
										<xsl:value-of select="a:Lan1"/>
									</td>
									<td>
										<xsl:value-of select="a:Lan2"/>
									</td>
									<td>
										<xsl:value-of select="a:CaNam"/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="a:BangDiem/a:TK">
								<tr>
									<td>
										<xsl:value-of select="a:STT"/>
									</td>
									<td>
										<xsl:value-of select="a:TenMon"/>
									</td>
									<td>
										<xsl:value-of select="a:Lan1"/>
									</td>
									<td>
										<xsl:value-of select="a:Lan2"/>
									</td>
									<td>
										<xsl:value-of select="a:CaNam"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						Xếp loại học lực: <xsl:value-of select="a:XepLoaiHocLuc"/> <br></br>
						Xếp loại hạnh kiểm: <xsl:value-of select="a:XepLoaiHanhKiem"/> <br></br>
						GVCN: <br></br> <xsl:value-of select="a:GVCN"/>
					</h3>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
