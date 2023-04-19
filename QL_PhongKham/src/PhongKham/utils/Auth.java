package PhongKham.utils;

import PhongKham.entity.TaiKhoanPK;
import PhongKham.ui.ClinicPK;

public class Auth {
    /**
     * Đối tượng này chứa thông tin người sử dụng sau khi đăng nhập
     */
    public static TaiKhoanPK user = null;
    /**
     * Xóa thông tin của người sử dụng khi có yêu cầu đăng xuất
     */
    public static void clear() {
        Auth.user = null;
    }
    /**
     * Kiểm tra xem đăng nhập hay chưa
     */
    public static boolean isLogin() {
        return Auth.user != null;
    }
    
     /**
     * Kiểm tra xem có phải là trưởng phòng hay không
     */
    
    public static void isManager() {
        ClinicPK f = new  ClinicPK();
        if (Auth.isLogin()) {
            String chucvu = user.getChucVu();
               switch (chucvu) {
            case "Bác sĩ":
               
                    f.setVisible(true); 
                break;
                
            case "Y tá":
               
                    f.setVisible(true); 
                break;
             
//            case "Ban quản lý":
//                
//                    f.setVisible(true); 
//                break;
            
//            case "Thu Ngân":
//                
//                    f.setVisible(true); 
//                break;
                
            default:
                throw new AssertionError();
        }
        }
    } 
}
