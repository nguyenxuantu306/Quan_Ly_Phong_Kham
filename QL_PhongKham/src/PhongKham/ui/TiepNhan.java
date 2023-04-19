package PhongKham.ui;

import PhongKham.dao.BenhNhanDao;
import PhongKham.dao.PhieuKhamDao;
import PhongKham.entity.BenhNhanPK;
import PhongKham.entity.PhieuKhamPK;
import PhongKham.utils.MsgBox;
import PhongKham.utils.XDate;
import PhongKham.utils.XImage;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */

/**
 *
 * @author DELL
 */
public class TiepNhan extends javax.swing.JPanel {

    /**
     * Creates new form LeTanJPanel
     */
    public TiepNhan() {
        initComponents();
        this.init();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jPanel2 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        txtMaPK = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtMaPhong = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        txtMaBN = new javax.swing.JTextField();
        jLabel13 = new javax.swing.JLabel();
        txtMaNV = new javax.swing.JTextField();
        jLabel14 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        txtGioKham = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtDauHieuBenh = new javax.swing.JTextArea();
        JDCNgayKham = new com.toedter.calendar.JDateChooser();
        btnThem = new javax.swing.JButton();
        btnSua = new javax.swing.JButton();
        Xoa = new javax.swing.JButton();
        btnMoi = new javax.swing.JButton();
        jLabel16 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        txtHoTenNV = new javax.swing.JTextField();
        txtHoTenBN = new javax.swing.JTextField();
        jPanel4 = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblPhieuKham = new javax.swing.JTable();
        jPanel3 = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        tblDanhSachDangKy = new javax.swing.JTable();
        btnFill = new javax.swing.JButton();

        setBackground(new java.awt.Color(93, 167, 219));
        setPreferredSize(new java.awt.Dimension(1600, 910));

        jPanel2.setBackground(new java.awt.Color(129, 198, 232));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông Tin Bệnh Nhân Chờ Khám", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel4.setText("Mã PK:");

        txtMaPK.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel5.setText("Mã Phòng:");

        txtMaPhong.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        jLabel10.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel10.setText("Mã BN:");

        txtMaBN.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        jLabel13.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel13.setText("Mã NV:");

        txtMaNV.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        jLabel14.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel14.setText("Ngày Khám:");

        jLabel15.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel15.setText("Giờ Khám:");

        txtGioKham.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel6.setText("Dấu Hiệu Bệnh : ");

        txtDauHieuBenh.setColumns(20);
        txtDauHieuBenh.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        txtDauHieuBenh.setRows(5);
        jScrollPane1.setViewportView(txtDauHieuBenh);

        JDCNgayKham.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        btnThem.setBackground(new java.awt.Color(125, 229, 237));
        btnThem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/add-friend.png"))); // NOI18N
        btnThem.setText("Thêm");
        btnThem.setBorder(null);
        btnThem.setFocusable(false);
        btnThem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemActionPerformed(evt);
            }
        });

        btnSua.setBackground(new java.awt.Color(125, 229, 237));
        btnSua.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/loop.png"))); // NOI18N
        btnSua.setText("Cập Nhật");
        btnSua.setBorder(null);
        btnSua.setFocusable(false);
        btnSua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaActionPerformed(evt);
            }
        });

        Xoa.setBackground(new java.awt.Color(125, 229, 237));
        Xoa.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/delete.png"))); // NOI18N
        Xoa.setText("Xóa");
        Xoa.setBorder(null);
        Xoa.setFocusable(false);
        Xoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                XoaActionPerformed(evt);
            }
        });

        btnMoi.setBackground(new java.awt.Color(125, 229, 237));
        btnMoi.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/new.png"))); // NOI18N
        btnMoi.setText("Mới");
        btnMoi.setBorder(null);
        btnMoi.setFocusable(false);
        btnMoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMoiActionPerformed(evt);
            }
        });

        jLabel16.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel16.setText("Họ Tên BN : ");

        jLabel17.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel17.setText("Họ Tên NV : ");

        txtHoTenNV.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        txtHoTenBN.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 616, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel14)
                            .addComponent(jLabel16)
                            .addComponent(jLabel4))
                        .addGap(6, 6, 6)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(13, 13, 13)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(JDCNgayKham, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(txtMaPK, javax.swing.GroupLayout.DEFAULT_SIZE, 150, Short.MAX_VALUE))
                                .addGap(23, 23, 23)
                                .addComponent(jLabel5)
                                .addGap(18, 18, 18)
                                .addComponent(txtMaPhong, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel10)
                                .addGap(18, 18, 18)
                                .addComponent(txtMaBN, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(186, 186, 186)
                                .addComponent(jLabel15)
                                .addGap(18, 18, 18)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addGroup(jPanel2Layout.createSequentialGroup()
                                        .addComponent(jLabel17)
                                        .addGap(18, 18, 18)
                                        .addComponent(txtHoTenNV))
                                    .addGroup(jPanel2Layout.createSequentialGroup()
                                        .addComponent(txtGioKham, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(jLabel13)
                                        .addGap(18, 18, 18)
                                        .addComponent(txtMaNV, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))))))
                .addContainerGap(76, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnThem, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(68, 68, 68)
                .addComponent(btnSua, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(63, 63, 63)
                .addComponent(Xoa, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(51, 51, 51)
                .addComponent(btnMoi, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(46, 46, 46))
            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(jPanel2Layout.createSequentialGroup()
                    .addGap(129, 129, 129)
                    .addComponent(txtHoTenBN, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(466, Short.MAX_VALUE)))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(14, 14, 14)
                                .addComponent(jLabel4))
                            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(txtMaPK, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel5)
                                .addComponent(txtMaPhong, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel10)
                                .addComponent(txtMaBN, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(56, 56, 56)
                                .addComponent(jLabel14))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel15, javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(txtGioKham, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel13, javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(txtMaNV, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                    .addComponent(JDCNgayKham, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel16)
                    .addComponent(jLabel17)
                    .addComponent(txtHoTenNV, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(33, 33, 33)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 56, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6))
                .addGap(37, 37, 37)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnThem, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnSua, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Xoa, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnMoi, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(jPanel2Layout.createSequentialGroup()
                    .addGap(154, 154, 154)
                    .addComponent(txtHoTenBN, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(165, Short.MAX_VALUE)))
        );

        jPanel4.setBackground(new java.awt.Color(129, 198, 232));
        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Danh Sách Bệnh Nhân Chờ Khám   ", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N

        tblPhieuKham.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        tblPhieuKham.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "Mã PK", "Mã Phòng", "Mã BN", "Mã NV", "Ngày Khám", "Giờ Khám"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblPhieuKham.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblPhieuKhamMouseClicked(evt);
            }
        });
        jScrollPane2.setViewportView(tblPhieuKham);

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane2)
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 277, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        jPanel3.setBackground(new java.awt.Color(129, 198, 232));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Danh Sách Bệnh Nhân Đăng Ký  ", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N

        tblDanhSachDangKy.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        tblDanhSachDangKy.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "Mã PK", "Mã Phòng", "Mã BN", "Mã NV", "Ngày Khám", "Giờ Khám"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblDanhSachDangKy.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblDanhSachDangKyMouseClicked(evt);
            }
        });
        jScrollPane4.setViewportView(tblDanhSachDangKy);

        btnFill.setBackground(new java.awt.Color(125, 229, 237));
        btnFill.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/refresh.png"))); // NOI18N
        btnFill.setText("Tải Lại Dữ Liệu");
        btnFill.setBorder(null);
        btnFill.setFocusable(false);
        btnFill.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFillActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 693, Short.MAX_VALUE)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(btnFill, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 278, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnFill, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(206, 206, 206))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemActionPerformed
        // TODO add your handling code here:
        this.insert();
    }//GEN-LAST:event_btnThemActionPerformed

    private void btnSuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaActionPerformed
        // TODO add your handling code here:
        this.update();
    }//GEN-LAST:event_btnSuaActionPerformed

    private void XoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_XoaActionPerformed
        // TODO add your handling code here:
        this.delete();
    }//GEN-LAST:event_XoaActionPerformed

    private void btnMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMoiActionPerformed
        // TODO add your handling code here:
        this.clearForm();
    }//GEN-LAST:event_btnMoiActionPerformed

    private void tblPhieuKhamMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblPhieuKhamMouseClicked
        // TODO add your handling code here:
        if(evt.getClickCount() == 2 ){
            this.row = tblPhieuKham.getSelectedRow();
            this.edit();
        }
    }//GEN-LAST:event_tblPhieuKhamMouseClicked

    private void tblDanhSachDangKyMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblDanhSachDangKyMouseClicked
        // TODO add your handling code here:
        if(evt.getClickCount() == 2 ){
            this.row = tblDanhSachDangKy.getSelectedRow();
            this.edittt();
        }
        
              
    }//GEN-LAST:event_tblDanhSachDangKyMouseClicked

    private void btnFillActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFillActionPerformed
        // TODO add your handling code here:
        this.fillTablee();
    }//GEN-LAST:event_btnFillActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.toedter.calendar.JDateChooser JDCNgayKham;
    private javax.swing.JButton Xoa;
    private javax.swing.JButton btnFill;
    private javax.swing.JButton btnMoi;
    private javax.swing.JButton btnSua;
    private javax.swing.JButton btnThem;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JTable tblDanhSachDangKy;
    private javax.swing.JTable tblPhieuKham;
    private javax.swing.JTextArea txtDauHieuBenh;
    private javax.swing.JTextField txtGioKham;
    private javax.swing.JTextField txtHoTenBN;
    private javax.swing.JTextField txtHoTenNV;
    private javax.swing.JTextField txtMaBN;
    private javax.swing.JTextField txtMaNV;
    private javax.swing.JTextField txtMaPK;
    private javax.swing.JTextField txtMaPhong;
    // End of variables declaration//GEN-END:variables

    PhieuKhamDao dao = new PhieuKhamDao();
    BenhNhanDao daodao = new BenhNhanDao();
    int row = -1;
    
    void init(){
        this.row = -1;
        this.initTable();
        this.initTablee();
        this.fillTable();  
        this.fillTablee();
    }
    
    public void initTable(){
        DefaultTableModel model = (DefaultTableModel) tblPhieuKham.getModel();
        model.setColumnIdentifiers(new String[]{"Ma Phiếu Khám","Ngày Khám","Lý Do Khám","Giờ Khám","HoTenBN","HoTenNV","Mã Phòng","Mã Bệnh Nhân","Mã Nhân Viên"});
    }
    
    public void initTablee(){
        DefaultTableModel model = (DefaultTableModel) tblDanhSachDangKy.getModel();
        model.setColumnIdentifiers(new String[]{"MaBN","HotenBN","GioiTinh","DiaChi","NgaySinh","SDTBN","DauHieuBenh"});
    }

    void fillTable() {
        DefaultTableModel model = (DefaultTableModel) tblPhieuKham.getModel();
        model.setRowCount(0);
        try {
            List<PhieuKhamPK> list = dao.selectAll();
            for(PhieuKhamPK pk : list){
                Object[] row = {
                    pk.getMaPK(),               
                    XDate.toString(pk.getNgayKham(), "MM/dd/yyyy"),
                    pk.getDauHieuBenh(),                  
                    pk.getGioKham(),
                    pk.getHoTenBN(),
                    pk.getHoTenNV(),
                    pk.getMaPhong(),
                    pk.getMaBN(),
                    pk.getMaNV(),};                   
                model.addRow(row);             
            }
        } catch (Exception e) {
            MsgBox.alert(this, "Lỗi truy vấn dữ liệu!");
        }
    }
         
    void fillTablee() {
        DefaultTableModel model = (DefaultTableModel) tblDanhSachDangKy.getModel();
        model.setRowCount(0);
        
        try {           
            List<BenhNhanPK> list = daodao.selectAll();
            for(BenhNhanPK bn : list){
                Object[] row = {
                    bn.getMaBN(),
                    bn.getHoTenBN(),
                    bn.getGioiTinh()?"Nam":"Nữ",                  
                    bn.getDiaChi(),                         
                    XDate.toString(bn.getNgaySinh(), "dd/MM/yyy"),
                    bn.getSDTBN(),
                    bn.getDauHieuBenh()
                };
                model.addRow(row);             
            }
        } catch (Exception e) {
            MsgBox.alert(this, "Lỗi truy vấn dữ liệu!");
        }
    }
    
    
    
    void setForm(PhieuKhamPK pk){
    txtMaPK.setText(pk.getMaPK());
    JDCNgayKham.setDate(pk.getNgayKham());
    txtDauHieuBenh.setText(pk.getDauHieuBenh());
    txtGioKham.setText(pk.getGioKham());  
    txtHoTenBN.setText(pk.getHoTenBN());  
    txtHoTenNV.setText(pk.getHoTenNV());  
    txtMaPhong.setText(pk.getMaPhong());
    txtMaBN.setText(pk.getMaBN());
    txtMaNV.setText(pk.getMaNV());
    }
    
    
    
            
            
    void clearForm(){
        PhieuKhamPK pk = new PhieuKhamPK();
        this.setForm(pk);
        this.row = -1;      
    }
    
    PhieuKhamPK getForm(){
        PhieuKhamPK pk = new PhieuKhamPK();
        pk.setMaPK(txtMaPK.getText());
        pk.setNgayKham(JDCNgayKham.getDate());
        pk.setDauHieuBenh(txtDauHieuBenh.getText());
        pk.setGioKham(txtGioKham.getText());
        pk.setHoTenBN(txtHoTenBN.getText());
        pk.setHoTenNV(txtHoTenNV.getText());
        pk.setMaPhong(txtMaPhong.getText());
        pk.setMaBN(txtMaBN.getText());
        pk.setMaNV(txtMaNV.getText());
        return pk;
    }
    
    
     void insert() {
        PhieuKhamPK model = this.getForm();
        try {
            dao.insert(model);
            this.fillTable();
            this.clearForm();
            MsgBox.alert(this, "thêm mới thành công");
        } catch (Exception e) {
            e.printStackTrace();
//            MsgBox.alert(this, "thêm mới Thất Bại");
        }
    }

    void edit() {
        String mapk = (String) tblPhieuKham.getValueAt(this.row, 0);
        PhieuKhamPK pk = dao.selectById(mapk);
        this.setForm(pk);
//        NhanVien.setSelectedIndex(0);

    }
    
    void edittt() {
        String bn = (String) tblDanhSachDangKy.getValueAt(this.row, 0);
        BenhNhanPK bnN = daodao.selectById(bn);
        this.setForm1(bnN);
//        NhanVien.setSelectedIndex(0);

    }
    
    void setForm1(BenhNhanPK bn){    
            txtMaBN.setText(bn.getMaBN());
            txtHoTenBN.setText(bn.getHoTenBN());               
            txtDauHieuBenh.setText(bn.getDauHieuBenh()); 
            JDCNgayKham.setDate(bn.getNgayKham());
    }

    void delete() {
        String mapk = txtMaPK.getText();
        try {
            dao.delete(mapk);
            this.fillTable();
            this.clearForm();
            MsgBox.alert(this, "Xóa thành công!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e);
            MsgBox.alert(this, "Xóa thất bại!");
        }
    }

    void update() {
        PhieuKhamPK model = getForm();
        try {
            dao.update(model);
            this.fillTable();
            MsgBox.alert(this, "Cập nhật thành công!");
        } catch (Exception e) {
             JOptionPane.showMessageDialog(this, e);
            MsgBox.alert(this, "Cập nhật thất bại!");
        }
    }
    
}
