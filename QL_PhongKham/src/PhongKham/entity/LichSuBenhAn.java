package PhongKham.entity;

import java.util.Date;

public class LichSuBenhAn {
	    
	    private Date NgayKham;
	    private String DauHieuBenh;
	    private String XetNghiem;
	    private String ChuanDoan;
	    private String HoTenNV;
	    private String GhiChu;
	    
	    
		public LichSuBenhAn() {
			super();
		}
		public LichSuBenhAn(Date ngayKham, String dauHieuBenh, String xetNghiem, String chuanDoan, String hoTenNV,
				String ghiChu) {
			super();
			NgayKham = ngayKham;
			DauHieuBenh = dauHieuBenh;
			XetNghiem = xetNghiem;
			ChuanDoan = chuanDoan;
			HoTenNV = hoTenNV;
			GhiChu = ghiChu;
		}
		public Date getNgayKham() {
			return NgayKham;
		}
		public void setNgayKham(Date ngayKham) {
			NgayKham = ngayKham;
		}
		public String getDauHieuBenh() {
			return DauHieuBenh;
		}
		public void setDauHieuBenh(String dauHieuBenh) {
			DauHieuBenh = dauHieuBenh;
		}
		public String getXetNghiem() {
			return XetNghiem;
		}
		public void setXetNghiem(String xetNghiem) {
			XetNghiem = xetNghiem;
		}
		public String getChuanDoan() {
			return ChuanDoan;
		}
		public void setChuanDoan(String chuanDoan) {
			ChuanDoan = chuanDoan;
		}
		public String getHoTenNV() {
			return HoTenNV;
		}
		public void setHoTenNV(String hoTenNV) {
			HoTenNV = hoTenNV;
		}
		public String getGhiChu() {
			return GhiChu;
		}
		public void setGhiChu(String ghiChu) {
			GhiChu = ghiChu;
		}
	    
	    
}
