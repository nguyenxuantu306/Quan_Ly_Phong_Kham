/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PhongKham.sendMail;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *
 * @author Administrator
 */

public class Screen extends javax.swing.JFrame {
private String dataContructor;
    /**
     * Creates new form Screen
     */
    public Screen(String dataContructor) {
        initComponents();
        setLocationRelativeTo(null);
        this.dataContructor = dataContructor;
    }

    private Screen() {
    }

    

    

    public JButton getBtm_chooseFile() {
        return btm_chooseFile;
    }

    public void setBtm_chooseFile(JButton btm_chooseFile) {
        this.btm_chooseFile = btm_chooseFile;
    }

    public JButton getBtn_send() {
        return btn_send;
    }

    public void setBtn_send(JButton btn_send) {
        this.btn_send = btn_send;
    }

    public JLabel getLb_file() {
        return lb_file;
    }

    public void setLb_file(JLabel lb_file) {
        this.lb_file = lb_file;
    }

    public JTextField getTf_bcc() {
        return tf_bcc;
    }

    public void setTf_bcc(JTextField tf_bcc) {
        this.tf_bcc = tf_bcc;
    }

    public JTextField getTf_cc() {
        return tf_cc;
    }

    public void setTf_cc(JTextField tf_cc) {
        this.tf_cc = tf_cc;
    }

    public JTextArea getTf_message() {
        return tf_message;
    }

    public void setTf_message(JTextArea tf_message) {
        this.tf_message = tf_message;
    }

    public JTextField getTf_password() {
        return tf_password;
    }

    public void setTf_password(JPasswordField tf_password) {
        this.tf_password = tf_password;
    }

    public JTextField getTf_subject() {
        return tf_subject;
    }

    public void setTf_subject(JTextField tf_subject) {
        this.tf_subject = tf_subject;
    }

    public JTextField getTf_to() {
        return tf_to;
    }

    public void setTf_to(JTextField tf_to) {
        this.tf_to = tf_to;
    }

    public JTextField getTf_username() {
        return tf_username;
    }

    public void setTf_username(JTextField tf_username) {
        this.tf_username = tf_username;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        tf_username = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        tf_password = new javax.swing.JPasswordField();
        jSeparator1 = new javax.swing.JSeparator();
        jLabel3 = new javax.swing.JLabel();
        tf_to = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        tf_cc = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        tf_bcc = new javax.swing.JTextField();
        jSeparator2 = new javax.swing.JSeparator();
        jLabel6 = new javax.swing.JLabel();
        tf_subject = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tf_message = new javax.swing.JTextArea();
        jLabel8 = new javax.swing.JLabel();
        btn_send = new javax.swing.JButton();
        btm_chooseFile = new javax.swing.JButton();
        lb_file = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tf_username.setEditable(false);
        tf_username.setFont(new java.awt.Font("Times New Roman", 2, 14)); // NOI18N
        tf_username.setText("nguyenxuantu306203@gmail.com");
        jPanel1.add(tf_username, new org.netbeans.lib.awtextra.AbsoluteConstraints(240, 10, 305, 40));

        jLabel1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Username :");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 20, 85, 38));

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Password :");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 80, 85, 35));

        tf_password.setEditable(false);
        tf_password.setFont(new java.awt.Font("Times New Roman", 2, 14)); // NOI18N
        tf_password.setText("eymqcdmzkbkagqfv");
        jPanel1.add(tf_password, new org.netbeans.lib.awtextra.AbsoluteConstraints(240, 70, 305, 38));
        jPanel1.add(jSeparator1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 143, 649, 10));

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("To");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(74, 173, 54, -1));

        tf_to.setFont(new java.awt.Font("Times New Roman", 2, 18)); // NOI18N
        tf_to.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tf_toActionPerformed(evt);
            }
        });
        jPanel1.add(tf_to, new org.netbeans.lib.awtextra.AbsoluteConstraints(162, 159, 440, 41));

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("CC");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(74, 218, 84, 41));

        tf_cc.setFont(new java.awt.Font("Times New Roman", 2, 18)); // NOI18N
        jPanel1.add(tf_cc, new org.netbeans.lib.awtextra.AbsoluteConstraints(162, 218, 440, 41));

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Bcc");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(74, 277, 57, 41));

        tf_bcc.setFont(new java.awt.Font("Times New Roman", 2, 18)); // NOI18N
        tf_bcc.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tf_bccActionPerformed(evt);
            }
        });
        jPanel1.add(tf_bcc, new org.netbeans.lib.awtextra.AbsoluteConstraints(162, 277, 440, 41));
        jPanel1.add(jSeparator2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 349, 649, 10));

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Subject");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(64, 365, 71, 41));

        tf_subject.setFont(new java.awt.Font("Times New Roman", 2, 18)); // NOI18N
        jPanel1.add(tf_subject, new org.netbeans.lib.awtextra.AbsoluteConstraints(161, 365, 440, 41));

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Message");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(64, 435, 73, 41));

        tf_message.setColumns(20);
        tf_message.setFont(new java.awt.Font("Monospaced", 0, 14)); // NOI18N
        tf_message.setRows(5);
        jScrollPane1.setViewportView(tf_message);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(163, 435, 440, 87));

        jLabel8.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("File");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(64, 557, 73, 34));

        btn_send.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/message.png"))); // NOI18N
        btn_send.setText("Send");
        btn_send.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_sendActionPerformed(evt);
            }
        });
        jPanel1.add(btn_send, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 610, 156, 43));

        btm_chooseFile.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/folder.png"))); // NOI18N
        btm_chooseFile.setText("Choose File");
        btm_chooseFile.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btm_chooseFileActionPerformed(evt);
            }
        });
        jPanel1.add(btm_chooseFile, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 560, 130, 34));
        jPanel1.add(lb_file, new org.netbeans.lib.awtextra.AbsoluteConstraints(162, 557, 290, 34));

        jLabel11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/cross.png"))); // NOI18N
        jLabel11.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel11MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(610, 0, 40, 40));

        jLabel9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/PhongKham/Hinh/bgroudemail.jpg"))); // NOI18N
        jLabel9.setText("jLabel9");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 650, 680));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btm_chooseFileActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btm_chooseFileActionPerformed
        // TODO add your handling code here:

    }//GEN-LAST:event_btm_chooseFileActionPerformed

    private void btn_sendActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_sendActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btn_sendActionPerformed

    private void tf_bccActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tf_bccActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tf_bccActionPerformed

    private void tf_toActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tf_toActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tf_toActionPerformed

    private void jLabel11MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel11MouseClicked
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_jLabel11MouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Screen().setVisible(true);
            }
        });
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btm_chooseFile;
    private javax.swing.JButton btn_send;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JLabel lb_file;
    private javax.swing.JTextField tf_bcc;
    private javax.swing.JTextField tf_cc;
    private javax.swing.JTextArea tf_message;
    private javax.swing.JPasswordField tf_password;
    private javax.swing.JTextField tf_subject;
    private javax.swing.JTextField tf_to;
    private javax.swing.JTextField tf_username;
    // End of variables declaration//GEN-END:variables
}
