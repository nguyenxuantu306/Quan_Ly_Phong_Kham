/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PhongKham.entity;

import PhongKham.utils.XDate;
import java.util.Date;

/**
 *
 * @author Nghia
 */
public class PhieuKhamPK {
    private String MaPK;
    private Date NgayKham;
    private String DauHieuBenh;
    private String GioKham;
    private String HoTenBN;
    private String HoTenNV;
    private String MaPhong;
    private String MaBN;
    private String MaNV;

    public PhieuKhamPK() {
    }

    public PhieuKhamPK(String MaPK, Date NgayKham, String DauHieuBenh, String GioKham, String HoTenBN, String HoTenNV, String MaPhong, String MaBN, String MaNV) {
        this.MaPK = MaPK;
        this.NgayKham = NgayKham;
        this.DauHieuBenh = DauHieuBenh;
        this.GioKham = GioKham;
        this.HoTenBN = HoTenBN;
        this.HoTenNV = HoTenNV;
        this.MaPhong = MaPhong;
        this.MaBN = MaBN;
        this.MaNV = MaNV;
    }

    public String getMaPK() {
        return MaPK;
    }

    public void setMaPK(String MaPK) {
        this.MaPK = MaPK;
    }

    public Date getNgayKham() {
        return NgayKham;
    }

    public void setNgayKham(Date NgayKham) {
        this.NgayKham = NgayKham;
    }

    public String getDauHieuBenh() {
        return DauHieuBenh;
    }

    public void setDauHieuBenh(String DauHieuBenh) {
        this.DauHieuBenh = DauHieuBenh;
    }

    public String getGioKham() {
        return GioKham;
    }

    public void setGioKham(String GioKham) {
        this.GioKham = GioKham;
    }

    public String getHoTenBN() {
        return HoTenBN;
    }

    public void setHoTenBN(String HoTenBN) {
        this.HoTenBN = HoTenBN;
    }

    public String getHoTenNV() {
        return HoTenNV;
    }

    public void setHoTenNV(String HoTenNV) {
        this.HoTenNV = HoTenNV;
    }

    public String getMaPhong() {
        return MaPhong;
    }

    public void setMaPhong(String MaPhong) {
        this.MaPhong = MaPhong;
    }

    public String getMaBN() {
        return MaBN;
    }

    public void setMaBN(String MaBN) {
        this.MaBN = MaBN;
    }

    public String getMaNV() {
        return MaNV;
    }

    public void setMaNV(String MaNV) {
        this.MaNV = MaNV;
    }

    

    
}
