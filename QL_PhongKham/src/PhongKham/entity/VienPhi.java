/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PhongKham.entity;

/**
 *
 * @author Admin
 */
public class VienPhi {
    float tienthuoc ;
    float tienKham;
    float tienDV;

    public VienPhi() {
    }

    public VienPhi(float tienthuoc, float tienKham, float tienDV) {
        this.tienthuoc = tienthuoc;
        this.tienKham = tienKham;
        this.tienDV = tienDV;
    }

    public float getTienthuoc() {
        return tienthuoc;
    }

    public void setTienthuoc(float tienthuoc) {
        this.tienthuoc = tienthuoc;
    }

    public float getTienKham() {
        return tienKham;
    }

    public void setTienKham(float tienKham) {
        this.tienKham = tienKham;
    }

    public float getTienDV() {
        return tienDV;
    }

    public void setTienDV(float tienDV) {
        this.tienDV = tienDV;
    }

   

    

    
    
    
    
    
}
