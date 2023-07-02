using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace Bai1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        XmlDocument doc = new XmlDocument();
        string tentep = @"D:\Tích hợp hệ thống phần mềm\TX2\Bai1\Bai1\dsnhanvien.xml";
        int d;

        private void HienThi()
        {
            dataNhanVien.Rows.Clear();
            doc.Load(tentep);
            XmlNodeList DS = doc.SelectNodes("/ds/nhanvien");
            int sd = 0;
            dataNhanVien.ColumnCount = 3;
            dataNhanVien.Rows.Add();
            foreach (XmlNode nhan_vien in DS)
            {
                XmlNode ma_nv = nhan_vien.SelectSingleNode("@manv");
                dataNhanVien.Rows[sd].Cells[0].Value = ma_nv.InnerText.ToString();
                XmlNode ho_ten = nhan_vien.SelectSingleNode("hoten");
                dataNhanVien.Rows[sd].Cells[1].Value = ho_ten.InnerText.ToString();
                XmlNode dia_chi = nhan_vien.SelectSingleNode("diachi");
                dataNhanVien.Rows[sd].Cells[2].Value = dia_chi.InnerText.ToString();
                dataNhanVien.Rows.Add();
                sd++;
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            HienThi();
        }

        private void bt_Them_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;
            XmlNode nhan_vien = doc.CreateElement("nhanvien");
            XmlAttribute ma_nv = doc.CreateAttribute("manv");
            ma_nv.InnerText = txtMa.Text;
            nhan_vien.Attributes.Append(ma_nv);
            XmlNode ho_ten = doc.CreateElement("hoten");
            ho_ten.InnerText = txtHoTen.Text;
            nhan_vien.AppendChild(ho_ten);
            XmlNode dia_chi = doc.CreateElement("diachi");
            dia_chi.InnerText = txtDiaChi.Text;
            nhan_vien.AppendChild(dia_chi);
            goc.AppendChild(nhan_vien);
            doc.Save(tentep);
            HienThi();
        }

        private void bt_Xoa_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;
            XmlNode nhan_vien_xoa = goc.SelectSingleNode("/ds/nhanvien[@manv='" + txtMa.Text + "']");
            goc.RemoveChild(nhan_vien_xoa);
            doc.Save(tentep);
            HienThi();
        }

        private void bt_Sua_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;
            XmlNode nhan_vien_cu = goc.SelectSingleNode("/ds/nhanvien[@manv='" + txtMa.Text + "']");
            XmlNode nhan_vien_moi = doc.CreateElement("nhanvien");
            XmlAttribute ma_nv = doc.CreateAttribute("manv");
            ma_nv.InnerText = txtMa.Text;
            nhan_vien_moi.Attributes.Append(ma_nv);
            XmlNode ho_ten = doc.CreateElement("hoten");
            ho_ten.InnerText = txtHoTen.Text;
            nhan_vien_moi.AppendChild(ho_ten);
            XmlNode dia_chi = doc.CreateElement("diachi");
            dia_chi.InnerText = txtDiaChi.Text;
            nhan_vien_moi.AppendChild(dia_chi);
            goc.ReplaceChild(nhan_vien_moi, nhan_vien_cu);
            doc.Save(tentep);
            HienThi();
        }

        private void dataNhanVien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            d = e.RowIndex;
            txtMa.Text = dataNhanVien.Rows[d].Cells[0].Value.ToString();
            txtHoTen.Text = dataNhanVien.Rows[d].Cells[1].Value.ToString();
            txtDiaChi.Text = dataNhanVien.Rows[d].Cells[2].Value.ToString();
        }

        private void bt_Tim_Click(object sender, EventArgs e)
        {
            dataNhanVien.Rows.Clear();
            doc.Load(tentep);

            // Tìm đối tượng nhanvien theo manv
            XmlElement goc = doc.DocumentElement;
            XmlNode tim_ma_nv = goc.SelectSingleNode("/ds/nhanvien[@manv='" + txtMa.Text + "']");

            if (tim_ma_nv != null)
            {
                int sd = 0;
                dataNhanVien.ColumnCount = 3;
                dataNhanVien.Rows.Add();

                XmlNode ma_nv = tim_ma_nv.SelectSingleNode("@manv");
                dataNhanVien.Rows[sd].Cells[0].Value = ma_nv.InnerText;

                XmlNode ho_ten = tim_ma_nv.SelectSingleNode("hoten");
                dataNhanVien.Rows[sd].Cells[1].Value = ho_ten.InnerText;

                XmlNode dia_chi = tim_ma_nv.SelectSingleNode("diachi");
                dataNhanVien.Rows[sd].Cells[2].Value = dia_chi.InnerText;
            }


        }

        private void bt_Pr_Click(object sender, EventArgs e)
        {
            string path = @"D:\Tích hợp hệ thống phần mềm\TX2\Bai1\Bai1\dsnhanvien.xml";
            System.Diagnostics.Process.Start("Explorer.exe", path);
        }
    }
}
