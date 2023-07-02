using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using _2020602883_PhanThiLanAnh_Tao.Models;

namespace _2020602883_PhanThiLanAnh_Tao.Controllers
{
    public class NhanVienController : ApiController
    {
       QLNVEntities db = new QLNVEntities();
       public List<Nhanvien> LayNV()
        {
            return db.Nhanviens.ToList();
        }

        [HttpGet]
        public Nhanvien TimTheoMaNV(string manv)
        {
            return db.Nhanviens.FirstOrDefault(x => x.MaNV == manv);
        }

        [HttpPost]
        public bool ThemNV(string manv, string hoten, string trinhdo, int luong)
        {
            Nhanvien nv = db.Nhanviens.FirstOrDefault(x => x.MaNV == manv);
            if (nv == null)
            {
                Nhanvien nv1 = new Nhanvien();
                nv1.MaNV = manv;
                nv1.HoTen = hoten;
                nv1.TrinhDo = trinhdo;
                nv1.Luong = luong;
                db.Nhanviens.Add(nv1);
                db.SaveChanges();
                return true;
            }
            return false;
        }

        [HttpPut]
        public bool Sua(string manv, string hoten, string trinhdo, int luong)
        {
            Nhanvien nv = db.Nhanviens.FirstOrDefault(x => x.MaNV == manv);
            if(nv != null)
            {
                nv.MaNV = manv;
                nv.HoTen = hoten;
                nv.TrinhDo = trinhdo;
                nv.Luong = luong;
                db.SaveChanges();
                return true;
            }  
            return false;
        }

        [HttpDelete]
        public bool Xoa(string id)
        {
            Nhanvien nv = db.Nhanviens.FirstOrDefault(x => x.MaNV == id);
            if(nv!= null)
            {
                db.Nhanviens.Remove(nv);
                db.SaveChanges();
                return true;
            }    
            return false;
        }
    }
}
