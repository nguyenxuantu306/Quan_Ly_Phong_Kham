package PhongKham.ui;



import static org.testng.Assert.assertTrue;

import org.junit.BeforeClass;
import org.junit.Test;

public class NhanVienGDTest {
	
NhanVienGD nhanVienGD;

	@BeforeClass
	public void init() {
		nhanVienGD = new NhanVienGD("bsi08","bsi008","Nam");
	}


	@Test
	public void testFillTable() throws Exception {
		boolean result = true ;
		nhanVienGD.txtTimKiem.setText("Mạc Vương Phi");
		nhanVienGD.fillTable();
		int count = nhanVienGD.tblDanhSachNV.getRowCount();
		if(count<=0) {
			result = false;
		}
		
		assertTrue(result);
		
		
	}
}