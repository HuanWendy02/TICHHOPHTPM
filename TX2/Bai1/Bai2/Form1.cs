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

namespace Bai2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        XmlDocument doc = new XmlDocument();
        string tentep = @"D:\Tích hợp hệ thống phần mềm\TX2\Bai1\Bai2\khachhang.xml";
        int d;

        private void HienThi()
        {
            dataKhachHang.Rows.Clear();
            doc.Load(tentep);

            XmlNodeList DS = doc.SelectNodes("/ds/khachhang");
            int sd = 0;
            dataKhachHang.ColumnCount = 4;
            dataKhachHang.Rows.Add();

            foreach (XmlNode kh in DS)
            {
                XmlNode ma_kh = kh.SelectSingleNode("@makh");
                dataKhachHang.Rows[sd].Cells[0].Value = ma_kh.InnerText.ToString();

                XmlNode ho_ten = kh.SelectSingleNode("hoten");
                dataKhachHang.Rows[sd].Cells[1].Value = ho_ten.InnerText.ToString();

                XmlNode dia_chi = kh.SelectSingleNode("diachi");
                dataKhachHang.Rows[sd].Cells[2].Value = dia_chi.InnerText.ToString();

                XmlNode Sdt = kh.SelectSingleNode("sdt");
                dataKhachHang.Rows[sd].Cells[3].Value = Sdt.InnerText.ToString();

                dataKhachHang.Rows.Add();
                sd++;
            }    

        }
        private void Form1_Load(object sender, EventArgs e)
        {
            HienThi();
        }

        private void dataKhachHang_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            d = e.RowIndex;
            txtMa.Text = dataKhachHang.Rows[d].Cells[0].Value.ToString();
            txtHoTen.Text = dataKhachHang.Rows[d].Cells[1].Value.ToString();
            txtDiaChi.Text = dataKhachHang.Rows[d].Cells[2].Value.ToString();
            txtSDT.Text = dataKhachHang.Rows[d].Cells[2].Value.ToString();
        }

        private void bt_Them_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;
            XmlNode kh = doc.CreateElement("khachhang");

            XmlAttribute ma = doc.CreateAttribute("makh");
            ma.InnerText = txtMa.Text;
            kh.Attributes.Append(ma);

            XmlNode ten = doc.CreateElement("hoten");
            ten.InnerText = txtHoTen.Text;
            kh.AppendChild(ten);

            XmlNode dc = doc.CreateElement("diachi");
            dc.InnerText = txtDiaChi.Text;
            kh.AppendChild(dc);

            XmlNode s = doc.CreateElement("sdt");
            s.InnerText = txtSDT.Text;
            kh.AppendChild(s);

            goc.AppendChild(kh);
            doc.Save(tentep);
            HienThi();

        }

        private void bt_Xoa_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;
            XmlNode xoa_kh = goc.SelectSingleNode("/ds/khachhang[@makh='" + txtMa.Text + "']");
            goc.RemoveChild(xoa_kh);
            doc.Save(tentep);
            HienThi();
        }

        private void bt_Sua_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;
            XmlNode kh_cu = goc.SelectSingleNode("/ds/khachhang[@makh='" + txtMa.Text + "']");
            XmlNode kh_moi = doc.CreateElement("khachhang");

            XmlAttribute ma = doc.CreateAttribute("makh");
            ma.InnerText = txtMa.Text;
            kh_moi.Attributes.Append(ma);

            XmlNode ten = doc.CreateElement("hoten");
            ten.InnerText = txtHoTen.Text;
            kh_moi.AppendChild(ten);

            XmlNode dc = doc.CreateElement("diachi");
            dc.InnerText = txtDiaChi.Text;
            kh_moi.AppendChild(dc);

            XmlNode s = doc.CreateElement("sdt");
            s.InnerText = txtSDT.Text;
            kh_moi.AppendChild(s);

            goc.ReplaceChild(kh_moi, kh_cu);
            doc.Save(tentep);
            HienThi();
        }

        private void bt_Tim_Click(object sender, EventArgs e)
        {
            dataKhachHang.Rows.Clear();
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;

            XmlNode tim = goc.SelectSingleNode("/ds/khachhang[@makh='" + txtMa.Text + "']");

            if (tim != null)
            {
                int d = 0;
                dataKhachHang.ColumnCount = 4;
                dataKhachHang.Rows.Add();

                XmlNode ma_kh = tim.SelectSingleNode("@makh");
                dataKhachHang.Rows[d].Cells[0].Value = ma_kh.InnerText.ToString();

                XmlNode ho_ten = tim.SelectSingleNode("hoten");
                dataKhachHang.Rows[d].Cells[1].Value = ho_ten.InnerText.ToString();

                XmlNode dia_chi = tim.SelectSingleNode("diachi");
                dataKhachHang.Rows[d].Cells[2].Value = dia_chi.InnerText.ToString();

                XmlNode Sdt = tim.SelectSingleNode("sdt");
                dataKhachHang.Rows[d].Cells[3].Value = Sdt.InnerText.ToString();

            }
        }
    }
}
