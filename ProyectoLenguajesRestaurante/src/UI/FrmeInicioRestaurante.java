/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package UI;

import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;
import proyectolenguajesrestaurante.Mesa.Mesa;
import proyectolenguajesrestaurante.Mesa.OrdenesRestaurante;

/**
 *
 * @author camiu
 */
public class FrmeInicioRestaurante extends javax.swing.JFrame {

    /**
     * Creates new form frmMenu
     */
    public FrmeInicioRestaurante() {
        initComponents();
        jSpinner1.setModel(new SpinnerNumberModel(1, 1, 6, 1)); // Valor inicial, valor mínimo, valor máximo, incremento
        jSpinner2.setModel(new SpinnerNumberModel(1, 1, null,1)); // Valor inicial, valor mínimo, valor máximo, incremento

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jSpinner1 = new javax.swing.JSpinner();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jTextField4 = new javax.swing.JTextField();
        jSpinner2 = new javax.swing.JSpinner();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        jLabel1.setText("Bienvenido al Restaurante");

        jButton1.setText("Aceptar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jLabel3.setText("Numero de Mesa:");

        jLabel4.setText("Cantidad de personas:");

        jLabel5.setText("Nombre Representante:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(72, 72, 72))
            .addGroup(layout.createSequentialGroup()
                .addGap(90, 90, 90)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5))
                        .addGap(23, 23, 23)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jSpinner1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, 71, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jSpinner2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(68, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(59, 59, 59))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(61, 61, 61)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel2)
                .addGap(36, 36, 36)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jSpinner1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jSpinner2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(28, 28, 28)
                .addComponent(jButton1)
                .addContainerGap(23, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
//        Mesa miMesa = new Mesa();
//        
//        String nombre = JOptionPane.showInputDialog(null, "Por favor, ingrese su nombre:", "Entrada de texto", JOptionPane.PLAIN_MESSAGE);
//        miMesa.setNombreRepresentante(nombre);
//        
//        if (nombre != null) {
//            System.out.println("El nombre ingresado es: " + nombre);
//        } else {
//            System.out.println("El usuario canceló la entrada.");
//        }
         List<Mesa> mesas = new ArrayList<>();
        // Crear 6 mesas de ejemplo
        for (int i = 1; i <= 6; i++) {
            mesas.add(new Mesa(i, 0, "", false)); // Se inicializa sin ninguna persona ni representante
        }

        //CAptura de datos (Tipo de PAGO)
        int opcion = JOptionPane.showOptionDialog(null, "¿Desea pagar en una sola cuenta?", "Pago en una Sola Cuenta", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, null, null);
        int numeroMesa = (int)this.jSpinner1.getValue();

        boolean pagarJuntos;
        if (opcion == JOptionPane.YES_OPTION) {
             pagarJuntos = true;
             mesas.get(numeroMesa - 1).setUnaSolaCuenta(true);
             JOptionPane.showMessageDialog(null, "La orden se pagará en conjunto.");
         } else {
             pagarJuntos = false;
             mesas.get(numeroMesa - 1).setUnaSolaCuenta(false);
             JOptionPane.showMessageDialog(null, "La orden no se pagará en conjunto.");
         }

        //
        do {
            System.out.print("Por favor, seleccione el número de mesa (1-6): ");
            if (numeroMesa < 1 || numeroMesa > 6) {
                System.out.println("El número de mesa seleccionado no es válido. Inténtelo de nuevo.");
            } else if (mesas.get(numeroMesa - 1).estaOcupada()) {
                System.out.println("La mesa " + numeroMesa + " está ocupada en este momento. Por favor, seleccione otra mesa.");
            }
        } while (numeroMesa < 1 || numeroMesa > 6 || mesas.get(numeroMesa - 1).estaOcupada());

        mesas.get(numeroMesa - 1).ocuparMesa();

        //JOptionPane.showMessageDialog(null, "Mesa Ocupada");
        
        int numeroPersonas = (int)this.jSpinner2.getValue();
        
        mesas.get(numeroMesa - 1).setCantidadPersonas(numeroPersonas);
        
        String nombreRepresentante = this.jTextField4.getText();
        mesas.get(numeroMesa - 1).setNombreRepresentante(nombreRepresentante);

        String infoMesa = mesas.get(numeroMesa - 1).obtenerInfoMesa(); // Ajusta el método según la estructura de tu clase Mesa
        JOptionPane.showMessageDialog(this, "Información de la mesa: " + infoMesa);
        
    }//GEN-LAST:event_jButton1ActionPerformed

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
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmeInicioRestaurante.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmeInicioRestaurante.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmeInicioRestaurante.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmeInicioRestaurante.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmeInicioRestaurante().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JSpinner jSpinner1;
    private javax.swing.JSpinner jSpinner2;
    private javax.swing.JTextField jTextField4;
    // End of variables declaration//GEN-END:variables
}
