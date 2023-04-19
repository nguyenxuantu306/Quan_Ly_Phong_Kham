package PhongKham.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class XJdbc {
    static Connection con = null;
    private static String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static String dburl="jdbc:sqlserver:// localhost :1433; databaseName = QUANLYPHONGKHAM_NHOM3; encrypt = true; trustServerCertificate= true;";
    private static String username="sa";
    private static String password=""; 
    /*
     * Nạp driver
     */
    static{
        try {            
            Class.forName(driver);
        } 
        catch (ClassNotFoundException ex) {
            throw new RuntimeException(ex);
        }
    }

    

  public static Connection consql() {
      

        try {
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(dburl, username, password);
            System.out.println("thành công");
            Statement st = con.createStatement();
        } catch (Exception e) {
            System.out.println(" LỖI DO KẾT NỐI SQL" + e);
            return null;
        }
        return (Connection) con;
    }
    
    /**
     * 
     * 
     * 
     * 
     * Xây dựng PreparedStatement
     * @param sql là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu lệnh sql
     * @return PreparedStatement tạo được
     * @throws java.sql.SQLException lỗi sai cú pháp
     */
    public static PreparedStatement getStmt(String sql, Object...args) throws SQLException{
        Connection connection = DriverManager.getConnection(dburl, username, password);
        PreparedStatement pstmt = null;
        if(sql.trim().startsWith("{")){
            pstmt = connection.prepareCall(sql);
        }
        else{

            pstmt = connection.prepareStatement(sql);
    }
        for(int i=0;i<args.length;i++)
            try {
                   pstmt.setObject(i+1, args[i]);
            } catch (Exception e) {
            
        }
        return pstmt;
    }
    /**
     * Thực hiện câu lệnh SQL thao tác (INSERT, UPDATE, DELETE) hoặc thủ tục lưu thao tác dữ liệu
     * @param sql là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu lệnh sql     * 
     */
    public static void update(String sql, Object...args) {
        try {
            System.out.println("update : ");
            PreparedStatement stmt = XJdbc.getStmt(sql, args);
            try {
                System.out.println("stmt update ; "+ stmt);
                stmt.executeUpdate();
            } 
            finally{
                stmt.getConnection().close();
            }
        } 
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Thực hiện câu lệnh SQL truy vấn (SELECT) hoặc thủ tục lưu truy vấn dữ liệu
     * @param sql là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu lệnh sql
     */    
    public static ResultSet query(String sql, Object...args) {
        try {
            PreparedStatement stmt = XJdbc.getStmt(sql, args);
            System.out.println("in ra stms :"+ stmt);
            return stmt.executeQuery();
        } 
        catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    
    public static Object value(String sql, Object...args) {
        try {
            ResultSet rs = XJdbc.query(sql, args);
            if(rs.next()){
                return rs.getObject(0);
            }
            rs.getStatement().getConnection().close();
            return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
