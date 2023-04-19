/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PhongKham.dao;

import PhongKham.entity.VienPhi;
import PhongKham.utils.XJdbc;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Nghia
 */
public class ThongKePKDao {

    private List<Object[]> getListOfArray(String sql, String[] cols, Object... args) {
        try {
            List<Object[]> list = new ArrayList<>();
            ResultSet rs = XJdbc.query(sql, args);
            while (rs.next()) {
                Object[] vals = new Object[cols.length];
                for (int i = 0; i < cols.length; i++) {
                    vals[i] = rs.getObject(cols[i]);
                }
                list.add(vals);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<Object[]> getSoLuongTB() {
        String sql = "EXEC SP_ThongKe_ThietBi_LoaiTB";
        String[] cols = {"MaLoaiTB", "TenLoaiThietBi", "SoLuong"};
        return this.getListOfArray(sql, cols);
    }

    public List<Object[]> getSoLuongTBNV(String TenTB) {
        String sql = "exec SP_TK_TB '" + TenTB + "'";
        String[] cols = {"MaTB", "TenTB", "NgayNhap", "TenLoaiThietBi"};
        return this.getListOfArray(sql, cols);
    }
    //them 2 method
        public List<Object[]> getSoLuongTBtheothangnam(String thang, String nam) {
        String sql = "exec  SP_ThongKe_ThietBi_LoaiTB_theothangnam "+thang+","+nam+" ";
        String[] cols = {"MaTB", "TenTB", "NgayNhap", "TenLoaiThietBi"};
        return this.getListOfArray(sql, cols);
    }
        public List<Object[]> getSoLuongTBtheonam(String nam) {
        String sql = "exec  SP_ThongKe_ThietBi_LoaiTB_theonam "+nam+"";
        String[] cols = {"MaTB", "TenTB", "NgayNhap", "TenLoaiThietBi"};
        return this.getListOfArray(sql, cols);
    }
    

    public List<Object[]> getSoLuongThuocDB(String thang, String nam) {
        System.out.println("thang la :" + thang);
        System.out.println("Namla : "+ nam);
        String sql = "EXEC SP_ThongKe_LuongThuoc_DaBan "+thang+" , "+nam+"";
        String[] cols = {"MaThuoc", "TenThuoc", "SL", "NgayXuat"};
        return this.getListOfArray(sql, cols);
    }
    public List<Object[]> getSLThuocTheonam(String nam){ 
        String sql = "exec SP_ThongKe_LuongThuoc_DaBantheonam "+nam+"";
        String col[] = {"MaThuoc", "TenThuoc", "SL", "NgayXuat"};
        return this.getListOfArray(sql, col);
    }

    public List<Object[]> getSoLuongThuocDB_khongtheothang() {
        String sql = "EXEC SP_ThongKe_LuongThuoc_DaBan_khongtheothang ";
        String[] cols = {"MaThuoc", "TenThuoc", "SL", "NgayXuat"};
        return this.getListOfArray(sql, cols);
    }

    public List<Object[]> getLuongThuocConLai() {
        String sql = "exec SP_ThongKe_LuongThuoc_ConLai";
        String[] cols = {"MaThuoc", "TenThuoc", "SoLuong", "DonVi"};
        return this.getListOfArray(sql, cols);
    }

    public List<Object[]> getTKChiTieu(Date Ngay) {
        String sql = "{CALL SP_ThongKe_ChiTieu (?)}";
        String[] cols = {"LoaiChi", "SoTien", "NgayChi"};
        return this.getListOfArray(sql, cols, Ngay);
    }

    public List<Object[]> getTKDoanhThu(Date Ngay) {
        String sql = "{CALL SP_ThongKe_Doanh Thu (?)}";
        String[] cols = {"LoaiThu", "TienThu", "NgayThu"};
        return this.getListOfArray(sql, cols, Ngay);
    }

    public List<Object[]> getTKDangKyDV() {
        String sql = "exec SP_ThongKe_DangKyDichVu ";
        String[] cols = {"MaDV", "TenDV", "SL"};
        return this.getListOfArray(sql, cols);
    }
        public List<Object[]> getTKDangKyDVtheothangnam(String thang, String nam) {
        String sql = "EXEC SP_ThongKe_DangKyDichVu_Theothangnam "+thang+","+nam+"";
        String[] cols = {"MaDV", "TenDV", "SL"};
        return this.getListOfArray(sql, cols);
    }
            public List<Object[]> getTKDangKyDVtheonam(String nam) {
        String sql = "exec SP_ThongKe_DangKyDichVu_Theonam "+nam+" ";
        String[] cols = {"MaDV", "TenDV", "SL"};
        return this.getListOfArray(sql, cols);
    }

    public List<Object[]> getTKNVChucVu() {
        String sql = "exec SP_ThongKe_NhanVien_ChucVu";
        String[] cols = {"ChucVu", "SỐ LƯỢNG"};
        return this.getListOfArray(sql, cols);
    }

    public List<Object[]> getTKNVKhoa(String chucvu) {
        String sql = "EXEC SP_ThongKe_NhanVien_ChuyenKhoa  N'" + chucvu + "'";
        String[] cols = {"ChucVu", "TenKhoa", "SỐ LƯỢNG"};
        return this.getListOfArray(sql, cols);
    }
    
    public List<Object[]> getTKBNTheoThang(String thang) {
        String sql = "EXEC SP_ThongKe_BenhNhan_theothanggg "+thang+"";
        String[] cols = {"HoTenBN", "DiaChi","ChuanDoan","HoTenNV","TienKham","NgayKham"};
        return this.getListOfArray(sql, cols);
    }
    
    
    public List<Object[]> getTKBN() {
        String sql = "EXEC SP_ThongKe_BenhNhannnnn";
        String[] cols = {"HoTenBN","DiaChi","ChuanDoan","HoTenNV","TienKham","NgayKham"};
        return this.getListOfArray(sql, cols);
    }
    
    public List<Object[]> getTKBenhNhan_TheoThangNam(String thang,String nam) {
        String sql = "EXEC SP_ThongKe_BenhNhan_TheoThangNam "+thang+","+nam+"";
        String[] cols = {"MABN", "HoTenBN", "Số lần khám"};
        return this.getListOfArray(sql, cols);
    }
    
    
    public List<Object[]> getTKBenhNhan_TheoThang(String nam) {
        String sql = "EXEC SP_ThongKe_BenhNhan_TheoNam "+nam+"";
       String[] cols = {"MABN", "HoTenBN", "Số lần khám"};
        return this.getListOfArray(sql, cols);
    }
        public List<Object[]> getTKBenhNhan() {
        String sql = "EXEC SP_ThongKe_BenhNhan";
       String[] cols = {"MABN", "HoTenBN", "Số lần khám"};
        return this.getListOfArray(sql, cols);
    }
        
            public List<Object[]> getTKBenhNhan_TheoMA(String MA) {
        String sql = "EXEC SP_ThongKe_BenhNhan_TheoMa "+MA+"";
       String[] cols = {"MABN", "HoTenBN", "NgayKham" ,"MaNV","HoTenNV","TenKhoa"};
        return this.getListOfArray(sql, cols);
    }
    
    public VienPhi selectBySqlTienThuoc(String sql, Object... args) {
        List<VienPhi> list = new ArrayList<>();
        try {
            ResultSet rs = PhongKham.utils.XJdbc.query(sql, args);
            while (rs.next()) {
                VienPhi entity = new VienPhi();
                entity.setTienthuoc(rs.getFloat("GIA"));
                
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list.get(0);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    public VienPhi selectBySqlTienKham(String sql, Object... args) {
        List<VienPhi> list = new ArrayList<>();
        try {
            ResultSet rs = PhongKham.utils.XJdbc.query(sql, args);
            while (rs.next()) {
                VienPhi entity = new VienPhi();
                entity.setTienKham(rs.getFloat("GiaPhong"));
                
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list.get(0);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    
    public VienPhi selectBySqlTienDV(String sql, Object... args) {
        List<VienPhi> list = new ArrayList<>();
        try {
            ResultSet rs = PhongKham.utils.XJdbc.query(sql, args);
            while (rs.next()) {
                VienPhi entity = new VienPhi();
                entity.setTienDV(rs.getFloat("GIADV"));
                
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list.get(0);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    
   public VienPhi gettienthuoc(String MaDT){
        String sql = "{CALL TIENTHUOC(?)}";      
        return selectBySqlTienThuoc(sql, MaDT);
    }
    public VienPhi gettienKham(String MaBN){
        String sql = "{CALL TIENKHAM(?)}";      
        return selectBySqlTienKham(sql, MaBN);
    }
    
     public VienPhi gettienDV(String MaBN){
        String sql = "{CALL TIENDICHVU(?)}";      
        return selectBySqlTienDV(sql, MaBN);
    }
   
}
