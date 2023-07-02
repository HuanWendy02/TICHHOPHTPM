<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
				xmlns:a="http://tempuri.org/Bai1.xsd"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<title>Bảng kết quả</title>
			<link rel="stylesheet" type="text/css" href="Bai1.css"/>
		</html>
		<body>
			<h2 align="center">BẢNG KẾT QUẢ HỌC TẬP</h2>
			<p align="center">(Năm học 2009)</p>
			<xsl:for-each select="a:DS/a:KQHT">
				<h3>
					Mã SV: <xsl:value-of select="a:SV/@MaSV"/>
				</h3>
				<h3>
					Họ tên: <xsl:value-of select="a:SV/a:HoTen"/>
				</h3>
				<h3>
					Ngày sinh: <xsl:value-of select="a:SV/a:NgaySinh"/>
				</h3>
				<h3>
					Lớp: <xsl:value-of select="a:SV/a:Lop"/>
				</h3>
				<table border="1" cellspacing="0" class="bang">
					<tr class="tieude">
						<th>STT</th>
						<th>Môn học</th>
						<th>Lần 1</th>
						<th>Lần 2</th>
						<th>Cả năm</th>
					</tr>
					<xsl:for-each select="a:MH">
						<!--<xsl:sort select="a:Lan1" data-type="number" order="descending"/>-->
						<tr class="hihi">
							<td class="so">
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<xsl:value-of select="a:MonHoc"/>
							</td>
							<td class="so">
								<xsl:value-of select="a:Lan1"/>
							</td>
							<td class="so">
								<xsl:value-of select="a:Lan2"/>
							</td>
							<td class="so">
								<xsl:value-of select="a:CaNam"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3>
					Xếp loại học lực: <xsl:value-of select="a:KQ/a:XepLoaiHL"/>
				</h3>
				<h3>
					Xếp loại hạnh kiểm: <xsl:value-of select="a:KQ/a:XepLoaiHK"/>
				</h3>
				<h3 align="right">
					Giáo viên chủ nhiệm
					<p>
						<xsl:value-of select="a:GVCN"/>
					</p>
				</h3>
			</xsl:for-each>
		</body>
    </xsl:template>
</xsl:stylesheet>
