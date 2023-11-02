
package UI;

import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.SpinnerNumberModel;
import proyectolenguajesrestaurante.Mesa.Mesa;

// Este Frame permite seleccionar una mesa e ingresar los datos del cliente
public class FrmeInicioRestaurante extends javax.swing.JFrame {


    public FrmeInicioRestaurante() {
        initComponents();
        jSpinner1.setModel(new SpinnerNumberModel(1, 1, 6, 1)); // Valor inicial, valor mínimo, valor máximo, incremento
        jSpinner2.setModel(new SpinnerNumberModel(1, 1, null,1)); // Valor inicial, valor mínimo, valor máximo, incremento

    }

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
        jLabel1.setText("Asignar Mesa");

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
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
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
                                    .addComponent(jSpinner2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(124, 124, 124)
                        .addComponent(jLabel1)))
                .addContainerGap(92, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(40, 40, 40))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(42, 42, 42)
                .addComponent(jLabel1)
                .addGap(31, 31, 31)
                .addComponent(jLabel2)
                .addGap(27, 27, 27)
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
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 40, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(20, 20, 20))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

         List<Mesa> mesas = new ArrayList<>();
        for (int i = 1; i <= 6; i++) { // Crear 6 mesas para el restaurante
            mesas.add(new Mesa(i, 0, "", false)); // Se inicializa sin ninguna persona ni representante
        }

        //Captura de datos, seleccion de tipo de pago
        int opcion = JOptionPane.showOptionDialog(null, "¿Desea pagar en una sola cuenta?", "Pago en una Sola Cuenta", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, null, null);
        int numeroMesa = (int)this.jSpinner1.getValue();

        boolean pagarJuntos = false;
        if (opcion == JOptionPane.YES_OPTION) {
             pagarJuntos = true;
             mesas.get(numeroMesa - 1).setUnaSolaCuenta(true);
             JOptionPane.showMessageDialog(null, "La orden se pagará en conjunto.");
         } else {
            if (opcion == JOptionPane.NO_OPTION) {

             pagarJuntos = false;
             mesas.get(numeroMesa - 1).setUnaSolaCuenta(false);
             JOptionPane.showMessageDialog(null, "La orden no se pagará en conjunto.");
         }
            }


        //
        do {
            //System.out.print("Por favor, seleccione el número de mesa (1-6): ");
            if (numeroMesa < 1 || numeroMesa > 6) {
                System.out.println("El número de mesa seleccionado no es válido. Inténtelo de nuevo.");
            } else if (mesas.get(numeroMesa - 1).estaOcupada()) {
                System.out.println("La mesa " + numeroMesa + " está ocupada en este momento. Por favor, seleccione otra mesa.");
            }
        } while (numeroMesa < 1 || numeroMesa > 6 || mesas.get(numeroMesa - 1).estaOcupada());


        // Se ocupa la mesa

        mesas.get(numeroMesa - 1).ocuparMesa();
        
        int numeroPersonas = (int)this.jSpinner2.getValue();
        
        mesas.get(numeroMesa - 1).setCantidadPersonas(numeroPersonas);
        
        String nombreRepresentante = this.jTextField4.getText();
        mesas.get(numeroMesa - 1).setNombreRepresentante(nombreRepresentante);

        String infoMesa = mesas.get(numeroMesa - 1).obtenerInfoMesa(); 
        JOptionPane.showMessageDialog(this, "Información de la mesa: " + infoMesa);
        
        FrmPedidos frmPedido = new FrmPedidos();
        frmPedido.setUnaSolaCuenta(pagarJuntos,numeroPersonas);
        frmPedido.setCantPersonas(numeroPersonas);
        frmPedido.setVisible(true);
        
        // Se desocupa la mesa luego de la facturacion
        mesas.get(numeroMesa - 1).desocuparMesa();
        dispose();
        
    }//GEN-LAST:event_jButton1ActionPerformed

    public static void main(String args[]) {

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
