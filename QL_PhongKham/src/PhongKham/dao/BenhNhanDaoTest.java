package PhongKham.dao;

import static org.testng.Assert.assertEquals;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.junit.Test;

import PhongKham.entity.BenhAnPK;
import PhongKham.entity.BenhNhanPK;
import PhongKham.entity.LichSuBenhAn;
import entity.Product;
;


public class BenhNhanDaoTest {
	BenhNhanDao dao = new BenhNhanDao();
	
	
	
	private BenhNhanDao createTestSubject() {
		return new BenhNhanDao();
	}

	
	@Test
	public void testDelete() throws Exception {
		BenhNhanDao dao = new BenhNhanDao();
		boolean mess;
		String MaBN ="BN95";
		 dao.delete(MaBN);
		BenhNhanPK BenhNhanDAO1 = dao.selectById(MaBN);
		if (BenhNhanDAO1 == null) {
        	System.out.println("Thanhcong!");
            mess = true;
        } else {
        	mess = false;            
        }
		assertEquals(mess, true);
	}

	@Test
	public void testGetLichSuBA() throws Exception {
		BenhNhanDao dao = new BenhNhanDao();
		BenhNhanDao testSubject;
		boolean mess;
		String MaBN = "BN01";
		List<String> list = new ArrayList<>();
		LichSuBenhAn lsba = new LichSuBenhAn();
		lsba [] = ("2022-06-12","Gãy chân",	"Xét nghiệm chụp XQuang "	,"Gãy xương Chân",	"Đinh Thị Thùy Dương",null);
		List<Object[]> BenhNhanDAO1 =  dao.getLichSuBA(MaBN);
		System.out.println(BenhNhanDAO1.get(0).toString());}
//		if (BenhNhanDAO1.get(0)) == arr) {
//        	System.out.println("Thanhcong!");
//            mess = false;
//        } else {
//        	mess = true;
////            new ClinicPK().setVisible(true);
//        }
//		assertEquals(mess, true);	}

	@Test
	public void testGetLichSuThuoc() throws Exception {
		BenhNhanDao testSubject;
		String MaBN = "";
		List<Object[]> result;

		// default test 1
		testSubject = createTestSubject();
		result = testSubject.getLichSuThuoc(MaBN);
	}

//	@Test
//	public void testGetListOfArray() throws Exception {
//		BenhNhanDao testSubject;
//		String sql = "";
//		String[] cols = new String[] { "" };
//		Object[] args = new Object[] { null };
//		List<Object[]> result;
//
//		// default test 1
//		testSubject = createTestSubject();
//		result = Whitebox.invokeMethod(testSubject, "getListOfArray", new Object[] { sql, cols, Object[].class });
//	}
//
	@Test
	public void testInsert() throws Exception {
	
	//	BenhNhanPK bn = new BenhNhanPK("BN01","Lương Thị Huế",0,"Chưprông - Gia Lai","027812342318","2003-09-28","0465731274","Có","Sinh viên","Tày","Đau bụng phải","2021-09-12","hue.png","0932012782");
		BenhNhanPK bn = new BenhNhanPK("BN99","Lương Thị Huế",0,"Chưprông - Gia Lai","027812342318","2003-09-28","0465731274","Có","Sinh viên","Tày","Đau bụng phải","2021-09-12","hue.png","0932012782");
		dao.insert(bn); 
		boolean mess;
		String mabn = "BN99";
		BenhNhanPK bn98 =dao.selectById(mabn);
		if (bn98==null) {
			System.out.println("Insert Fail");
			mess = false;
		}else {
			mess = true;
		}
		
        assertEquals(true, mess);
        
	}
//
//	@Test
//	public void testUpdate() throws Exception {
//		BenhNhanDao testSubject;
//		BenhNhanPK model = null;
//
//		// default test
//		testSubject = createTestSubject();
//		testSubject.update(model);
//	}
//
//	@Test
//	public void testDelete_1() throws Exception {
//		BenhNhanDao testSubject;
//		String MaBN = "";
//
//		// default test 1
//		testSubject = createTestSubject();
//		testSubject.delete(MaBN);
//	}
//
//	@Test
//	public void testSelectById() throws Exception {
//		BenhNhanDao testSubject;
//		String MaBN = "";
//		BenhNhanPK result;
//
//		// default test
//		testSubject = createTestSubject();
//		result = testSubject.selectById(MaBN);
//	}
//
//	@Test
//	public void testSelectAll() throws Exception {
//		BenhNhanDao testSubject;
//		List<BenhNhanPK> result;
//
//		// default test
//		testSubject = createTestSubject();
//		result = testSubject.selectAll();
//	}
//
//	@Test
//	public void testSelectBySql() throws Exception {
//		BenhNhanDao testSubject;
//		String sql = "";
//		Object[] args = new Object[] { null };
//		List<BenhNhanPK> result;
//
//		// default test
//		testSubject = createTestSubject();
//		result = Whitebox.invokeMethod(testSubject, "selectBySql", new Object[] { sql, Object[].class });
//	}
//
//	@Test
//	public void testSelectByKeyword() throws Exception {
//		BenhNhanDao testSubject;
//		String keyword = "";
//		List<BenhNhanPK> result;
//
//		// default test
//		testSubject = createTestSubject();
//		result = testSubject.selectByKeyword(keyword);
//	}
//
//	@Test
//	public void testGetListOfArray_1() throws Exception {
//		BenhNhanDao testSubject;
//		String sql = "";
//		String[] cols = new String[] { "" };
//		Object[] args = new Object[] { null };
//		List<Object[]> result;
//
//		// default test 1
//		testSubject = createTestSubject();
//		result = Whitebox.invokeMethod(testSubject, "getListOfArray", new Object[] { sql, cols, Object[].class });
//	}
//
//	@Test
//	public void testGetLichSuBA_1() throws Exception {
//		BenhNhanDao testSubject;
//		String MaBN = "";
//		List<Object[]> result;
//
//		// default test 1
//		testSubject = createTestSubject();
//		result = testSubject.getLichSuBA(MaBN);
//	}
//
//	@Test
//	public void testGetLichSuThuoc_1() throws Exception {
//		BenhNhanDao testSubject;
//		String MaBN = "";
//		List<Object[]> result;
//
//		// default test 1
//		testSubject = createTestSubject();
//		result = testSubject.getLichSuThuoc(MaBN);
//	}
}