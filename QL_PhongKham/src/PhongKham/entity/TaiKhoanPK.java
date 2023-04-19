/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PhongKham.entity;

/**
 *
 * @author Nghia
 */
public class TaiKhoanPK {
    private int ID;
    private String MaNV;
    private String MatKhau;
    private String ChucVu;
    private String GhiNhoMK;
    private String QRCode;

    public TaiKhoanPK() {
    }

    public TaiKhoanPK(int ID, String MaNV, String MatKhau, String ChucVu, String GhiNhoMK, String QRCode) {
        this.ID = ID;
        this.MaNV = MaNV;
        this.MatKhau = MatKhau;
        this.ChucVu = ChucVu;
        this.GhiNhoMK = GhiNhoMK;
        this.QRCode = QRCode;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getMaNV() {
        return MaNV;
    }

    public void setMaNV(String MaNV) {
        this.MaNV = MaNV;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public void setMatKhau(String MatKhau) {
        this.MatKhau = MatKhau;
    }

    public String getChucVu() {
        return ChucVu;
    }

    public void setChucVu(String ChucVu) {
        this.ChucVu = ChucVu;
    }

    public String getGhiNhoMK() {
        return GhiNhoMK;
    }

    public void setGhiNhoMK(String GhiNhoMK) {
        this.GhiNhoMK = GhiNhoMK;
    }

    public String getQRCode() {
        return QRCode;
    }

    public void setQRCode(String QRCode) {
        this.QRCode = QRCode;
    }

    
}
