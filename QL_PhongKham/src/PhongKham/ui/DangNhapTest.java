/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PhongKham.ui;

import static org.junit.Assert.fail;
import static org.testng.Assert.assertEquals;

import java.util.ArrayList;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import PhongKham.dao.TaiKhoanDao;
import PhongKham.entity.TaiKhoanPK;
import PhongKham.utils.Auth;

/**
 *
 * @author Admin
 */
public class DangNhapTest {
		DangNhap dangnhaps;
		TaiKhoanDao dao = new TaiKhoanDao();
		String tk;
		String mk;
	public DangNhapTest() {
	}

	@BeforeClass
	public static void setUpClass() {
	String	tk = "yta01";
	String	mk = "yta001";
	}

	@AfterClass
	public static void tearDownClass() {
	}

	@Before
	public void setUp() {
	}

	@After
	public void tearDown() {
	}

	
	/**
	 * Test of dangNhap method, of class DangNhap.
	 */
	@Test
	public void testDangNhap() {
		String	tk = "bsi08";
		String	mk = "bsi008";
		System.out.println("dangNhap");
		boolean mess ;
		boolean kqmm = true;
		TaiKhoanPK TaiKhoanPK = dao.selectById(tk);
		if (TaiKhoanPK == null) {
        	System.out.println("Sai tên đăng nhập!");
            mess = false;
        } else if (!mk.equals(TaiKhoanPK.getMatKhau())) {
        	mess = false;
            System.out.println("Sai mật khẩu!");
            
        } else {
        	mess = true;
//            new ClinicPK().setVisible(true);
        }
		
		assertEquals(true, mess);
		System.out.println("daidi");
		// TODO review the generated test code and remove the default call to fail.
		
	}

	/**
	 * Test of ketThuc method, of class DangNhap.
	 */
	

}
