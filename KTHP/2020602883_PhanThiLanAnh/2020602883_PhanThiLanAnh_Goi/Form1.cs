using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.IO;
using System.Runtime.Serialization.Json;

namespace _2020602883_PhanThiLanAnh_Goi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public void HienThi()
        {
            string link = "http://localhost/hocrestful/api/nhanvien";
            HttpWebRequest request = WebRequest.CreateHttp(link);
            WebResponse response = request.GetResponse();
            DataContractJsonSerializer js = new DataContractJsonSerializer(typeof(NhanVien[]));
            object data = js.ReadObject(response.GetResponseStream());
            NhanVien[] arr = data as NhanVien[];
            dataNhanVien.DataSource = arr;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            HienThi();
        }

        private void dataNhanVien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int d = e.RowIndex;
            txtMa.Text = dataNhanVien.Rows[d].Cells[0].Value.ToString();
            txtHoTen.Text = dataNhanVien.Rows[d].Cells[1].Value.ToString();
            txtTrinhDo.Text = dataNhanVien.Rows[d].Cells[2].Value.ToString();
            txtLuong.Text = dataNhanVien.Rows[d].Cells[3].Value.ToString();
        }

        private void bt_Them_Click(object sender, EventArgs e)
        {
            string post = string.Format("?manv={0}&hoten={1}&trinhdo={2}&luong={3}", txtMa.Text, txtHoTen.Text, txtTrinhDo.Text, txtLuong.Text);
            string link = "http://localhost/hocrestful/api/nhanvien" + post;
            HttpWebRequest request = WebRequest.CreateHttp(link);
            request.Method = "POST";
            request.ContentType = "application/json;charset=UTF-8";
            byte[] byteArr = Encoding.UTF8.GetBytes(post);
            request.ContentLength = byteArr.Length;
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArr, 0, byteArr.Length);
            dataStream.Close();
            DataContractJsonSerializer js = new DataContractJsonSerializer(typeof(bool));
            object data = js.ReadObject(request.GetResponse().GetResponseStream());
            bool kq = (bool)data;
            if (kq)
            {
                HienThi();
                MessageBox.Show("Thêm thành công");
            }
            else MessageBox.Show("Thêm thất bại");
        }

        private void bt_Xoa_Click(object sender, EventArgs e)
        {
            if (dataNhanVien.SelectedRows.Count == 0) return;
            DataGridViewRow row = dataNhanVien.SelectedRows[0];
            string manv = row.Cells[0].Value.ToString();
            string post = string.Format("?id={0}", manv);
            string link = "http://localhost/hocrestful/api/nhanvien";
            HttpWebRequest request = WebRequest.CreateHttp(link + post);
            request.Method = "DELETE";
            request.ContentType = "application/json;charset=UTF-8";
            byte[] byteArr = Encoding.UTF8.GetBytes(post);
            request.ContentLength = byteArr.Length;
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArr, 0, byteArr.Length);
            dataStream.Close();
            DataContractJsonSerializer js = new DataContractJsonSerializer(typeof(bool));
            object data = js.ReadObject(request.GetResponse().GetResponseStream());
            bool kq = (bool)data;
            if(kq)
            {
                HienThi();
                MessageBox.Show("Xoá thành công");
            }    
        }

        private void bt_Tim_Click(object sender, EventArgs e)
        {
            string manv = string.Format("?manv={0}", txtMa.Text);
            string link = "http://localhost/hocrestful/api/nhanvien" + manv;
            HttpWebRequest request = WebRequest.CreateHttp(link);
            WebResponse response = request.GetResponse();
            DataContractJsonSerializer js = new DataContractJsonSerializer(typeof(NhanVien));
            object data = js.ReadObject(response.GetResponseStream());
            NhanVien nv = (NhanVien)data;
            if (nv != null)
            {
                txtMa.Text = nv.MaNV;
                txtHoTen.Text = nv.HoTen;
                txtTrinhDo.Text = nv.TrinhDo;
                txtLuong.Text = nv.Luong.ToString();
            }
            else MessageBox.Show("Không có nhân viên nào cả");
        }

        private void bt_Sua_Click(object sender, EventArgs e)
        {
            string put = string.Format("?manv={0}&hoten={1}&trinhdo={2}&luong={3}", txtMa.Text, txtHoTen.Text, txtTrinhDo.Text, txtLuong.Text);
            string link = "http://localhost/hocrestful/api/nhanvien" + put;
            HttpWebRequest request = WebRequest.CreateHttp(link);
            request.Method = "PUT";
            request.ContentType = "application/json;charset=UTF-8";
            byte[] byteArr = Encoding.UTF8.GetBytes(put);
            request.ContentLength = byteArr.Length;
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArr, 0, byteArr.Length);
            dataStream.Close();
            DataContractJsonSerializer js = new DataContractJsonSerializer(typeof(bool));
            object data = js.ReadObject(request.GetResponse().GetResponseStream());
            bool kq = (bool)data;
            if (kq)
            {
                HienThi();
                MessageBox.Show("Sửa thành công");
            }
            else MessageBox.Show("Sửa thất bại");
        }
    }
}
