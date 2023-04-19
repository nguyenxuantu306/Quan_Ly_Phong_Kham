/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PhongKham.dao;

import PhongKham.entity.TaiKhoanPK;
import PhongKham.utils.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Nghia
 */
public class TaiKhoanDao extends ClinicDao<TaiKhoanPK, String>{

  
    
    @Override
    public void insert(TaiKhoanPK model) {
          String sql = "INSERT INTO TaiKhoan ( ID ,MaNV ,MatKhau ,ChucVu ,GhiNhoMK,QRCode) VALUES(?,?,?,?,?,?)";
        XJdbc.update(sql, 
                model.getID(),
                model.getMaNV(),
                model.getMatKhau(),
                model.getChucVu(),
                model.getGhiNhoMK(),
                model.getQRCode()
                );
    }

    @Override
    public void update(TaiKhoanPK model) {
        String sql = "UPDATE TaiKhoan set ID = ? , MatKhau = ?, ChucVu =?  ,GhiNhoMK = ? , QRCode = ? WHERE MaNV = ?";
         XJdbc.update(sql,                                                     
                model.getID(),
                model.getMatKhau(),
                model.getChucVu(),
                model.getGhiNhoMK(),
                model.getQRCode(),
                model.getMaNV()
                );
    }

    @Override
    public void delete(String ID) {
        String sql = "Delete FROM TaiKhoan WHERE MaNV = ?";
        XJdbc.update(sql, ID); 
    }

    @Override
    public TaiKhoanPK selectById(String ID) {
       String sql="SELECT * FROM TaiKhoan WHERE MaNV=?";
        List<TaiKhoanPK> list = this.selectBySql(sql, ID);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<TaiKhoanPK> selectAll() {
         String sql="SELECT * FROM TaiKhoan";
        return this.selectBySql(sql); 
    }

    @Override
    protected List<TaiKhoanPK> selectBySql(String sql, Object... args) {
           List<TaiKhoanPK> list=new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while(rs.next()){
                    TaiKhoanPK entity =new TaiKhoanPK();
                    entity.setID(rs.getInt("ID"));
                    entity.setMaNV(rs.getString("MaNV"));
                    entity.setMatKhau(rs.getString("MatKhau"));
                    entity.setChucVu(rs.getString("ChucVu"));
                    entity.setGhiNhoMK(rs.getString("GhiNhoMK"));
                    entity.setQRCode(rs.getString("QRCode"));            
                    list.add(entity);
                }
            } 
            finally{
                rs.getStatement().getConnection().close();
            }
        } 
        catch (SQLException ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
        return list;   
    }
}