
package PhongKham.dao;

import PhongKham.entity.VienPhiPK;
import PhongKham.dao.VienPhiDao;
import PhongKham.utils.XJdbc;
import static java.nio.file.Files.list;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class VienPhiDao  extends ClinicDao<VienPhiPK, String>{

    @Override
    public void insert(VienPhiPK model) {
          String sql = "INSERT INTO VienPhi (MaVP , GiaTien , MaDT , MaNV , MaBN) VALUES(?,?,?,?,?)";
        XJdbc.update(sql, 
                model.getMaVP(),
                model.getGiaTien(),
                model.getMaDT(),
                model.getMaNV(),
                model.getMaBN()
                );    }

    @Override
    public void update(VienPhiPK model) {
         String sql = "UPDATE VienPhi set GiaTien = ? , MaDT = ?, MaNV = ? , MaBN = ? WHERE MaVP = ?";
         XJdbc.update(sql,                                         
                model.getGiaTien(),
                model.getMaDT(),
                model.getMaNV(),
                model.getMaBN(),
                model.getMaVP()
                );
    }

    @Override
    public void delete(String MaVP) {
        String sql = "Delete FROM VienPhi WHERE MaVP = ?";
        XJdbc.update(sql, MaVP);
    }

    @Override
    public VienPhiPK selectById(String MaVP) {
         String sql="SELECT * FROM VienPhi WHERE MaVP = ?";
        List<VienPhiPK> list = this.selectBySql(sql, MaVP);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<VienPhiPK> selectAll() {
          String sql="SELECT * FROM VienPhi";
        return this.selectBySql(sql);
    }

    @Override
    protected List<VienPhiPK> selectBySql(String sql, Object... args) {
         List<VienPhiPK> list=new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while(rs.next()){
                    VienPhiPK entity =new VienPhiPK ();
                    entity.setMaVP(rs.getString("MaVP"));
                    entity.setGiaTien(rs.getFloat("GiaTien"));
                     entity.setMaDT(rs.getString("MaDT"));
                    entity.setMaNV(rs.getString("MaNV"));
                    entity.setMaBN(rs.getString("MaBN"));            
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
    
    public String getTienTh(String MaDT) {
         String sql="select Sum(HDCT.Soluong*THUOC.DonGia)  from HOADONCHITIET HDCT JOIN THUOC ON  HDCT.MaThuoc = "
                 + "THUOC.MaThuoc where MaDT = ?  group by MaDT";              
        return String.valueOf(XJdbc.value(sql, MaDT)); 
    }
      
        public String selectByMaDT1(String maDT) {
                String sql="select Sum(HDCT.Soluong*THUOC.DonGia)  from HOADONCHITIET HDCT JOIN THUOC ON  HDCT.MaThuoc = "
                 + "THUOC.MaThuoc where MaDT = ?  group by MaDT";  
        
        return String.valueOf(XJdbc.value(sql, maDT)); 
    }
}
