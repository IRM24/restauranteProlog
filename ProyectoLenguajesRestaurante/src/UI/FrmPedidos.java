package UI;

import java.awt.event.ItemEvent;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import proyectolenguajesrestaurante.Factura.Factura;
import proyectolenguajesrestaurante.Factura.FacturaCRUD;
import proyectolenguajesrestaurante.Factura.FacturaGrupalBuilder;
import proyectolenguajesrestaurante.Menus.Comida;
import proyectolenguajesrestaurante.Menus.FuncionalidadesCombo;
import proyectolenguajesrestaurante.Menus.FuncionalidadesPlato;

public class FrmPedidos extends javax.swing.JFrame {

    private boolean unaSolaCuenta = false; //false significa individual
    private int cantPersonas = 0; //cantidad de personas que van a ordenar
    private int contPersonas= 0;//lleva el conteo de cuantas personas han pedido
    private ArrayList<Comida> miListaPedidos = new ArrayList<Comida>(); //lista que almacena los pedidos
    ButtonGroup grupoBotones = new ButtonGroup();
    ButtonGroup grupoBotones2 = new ButtonGroup();
    ButtonGroup grupoBotones3 = new ButtonGroup();
    
    

    public boolean isUnaSolaCuenta() {
        return unaSolaCuenta;
    }

    public void setUnaSolaCuenta(boolean unaSolaCuenta, int cantPersonas) {
        this.unaSolaCuenta = unaSolaCuenta;
        this.cantPersonas = cantPersonas;
    }
    
    public FrmPedidos() {
        initComponents();
        //grupo botones de tipo comida
        this.grupoBotones.add(this.jRadioButton1);
        this.grupoBotones.add(this.jRadioButton2);
        
        //grupo de botones de Combo
        this.grupoBotones2.add(this.jRdbCcEC);
        this.grupoBotones2.add(jRdbCBC);
        this.grupoBotones2.add(this.jRdbPrecioC);
        
        this.grupoBotones3.add(this.jRdbPrecioP);
        this.grupoBotones3.add(this.jRdbCBP);        
        this.grupoBotones3.add(this.jRdbPcP);


    }
    
    FuncionalidadesCombo funcionalidadesCombo = new FuncionalidadesCombo();
    FuncionalidadesPlato funcionalidadesPlato = new FuncionalidadesPlato();
    List<Comida> combos = funcionalidadesCombo.leerCombos();
    List<Comida> platos = funcionalidadesPlato.leerPlatos();

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        buttonGroup2 = new javax.swing.ButtonGroup();
        buttonGroup3 = new javax.swing.ButtonGroup();
        jCheckBoxMenuItem1 = new javax.swing.JCheckBoxMenuItem();
        buttonGroup4 = new javax.swing.ButtonGroup();
        jRadioButton1 = new javax.swing.JRadioButton();
        jRadioButton2 = new javax.swing.JRadioButton();
        jComboBox1 = new javax.swing.JComboBox<>();
        jBtnAceptar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jBtnFacturar = new javax.swing.JButton();
        jRdbPrecioC = new javax.swing.JRadioButton();
        jRdbCBC = new javax.swing.JRadioButton();
        jRdbCcEC = new javax.swing.JRadioButton();
        jRdbPrecioP = new javax.swing.JRadioButton();
        jRdbCBP = new javax.swing.JRadioButton();
        jRdbPcP = new javax.swing.JRadioButton();
        jButton1 = new javax.swing.JButton();

        jCheckBoxMenuItem1.setSelected(true);
        jCheckBoxMenuItem1.setText("jCheckBoxMenuItem1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jRadioButton1.setText("Combo");
        jRadioButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButton1ActionPerformed(evt);
            }
        });

        jRadioButton2.setText("Plato");
        jRadioButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButton2ActionPerformed(evt);
            }
        });

        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jBtnAceptar.setText("Aceptar");
        jBtnAceptar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnAceptarActionPerformed(evt);
            }
        });

        jLabel1.setText("Seleccione la opcion que desea");

        jLabel2.setText("Seleccione un filtro a la vez");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        jLabel3.setText("Pedido");

        jLabel4.setText("Total Factura");

        jTextField1.setText("Monto Factura");
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });

        jBtnFacturar.setText("Facturar");
        jBtnFacturar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnFacturarActionPerformed(evt);
            }
        });

        jRdbPrecioC.setText("Precio Bajo");
        jRdbPrecioC.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRdbPrecioCActionPerformed(evt);
            }
        });

        jRdbCBC.setText("Calorias Bajas");
        jRdbCBC.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRdbCBCActionPerformed(evt);
            }
        });

        jRdbCcEC.setText("Combos con ensaladas");
        jRdbCcEC.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRdbCcECActionPerformed(evt);
            }
        });

        jRdbPrecioP.setText("Precio Bajo");
        jRdbPrecioP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRdbPrecioPActionPerformed(evt);
            }
        });

        jRdbCBP.setText("Calorias Bajas");
        jRdbCBP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRdbCBPActionPerformed(evt);
            }
        });

        jRdbPcP.setText("Platos con Pollo");
        jRdbPcP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRdbPcPActionPerformed(evt);
            }
        });

        jButton1.setText("jButton1");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jLabel4)
                        .addGap(15, 15, 15)
                        .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jBtnFacturar))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                        .addGap(59, 59, 59)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel2)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jRadioButton1)
                                            .addComponent(jRdbPrecioC)
                                            .addComponent(jRdbCBC)
                                            .addComponent(jRdbCcEC))
                                        .addGap(42, 42, 42)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jRdbPrecioP)
                                            .addComponent(jRdbCBP)
                                            .addComponent(jRdbPcP)
                                            .addComponent(jRadioButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel1)
                                        .addGap(294, 294, 294)
                                        .addComponent(jButton1)))
                                .addGap(0, 304, Short.MAX_VALUE))))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jBtnAceptar)))
                .addGap(20, 20, 20))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(jLabel3)
                .addGap(25, 25, 25)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jButton1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jRadioButton1)
                    .addComponent(jRadioButton2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel2)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jRdbPrecioC)
                        .addGap(3, 3, 3)
                        .addComponent(jRdbCBC)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jRdbCcEC))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jRdbPrecioP)
                        .addGap(3, 3, 3)
                        .addComponent(jRdbCBP)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jRdbPcP)))
                .addGap(18, 18, 18)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jBtnAceptar)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 18, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(jBtnFacturar))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    public int getCantPersonas() {
        return cantPersonas;
    }

    public void setCantPersonas(int cantPersonas) {
        this.cantPersonas = cantPersonas;
    }

    private void jRadioButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton1ActionPerformed
        this.jRdbPcP.setVisible(false);
        this.jRdbCBP.setVisible(false);
        this.jRdbPrecioP.setVisible(false);
        
        this.jRdbCBC.setVisible(true);
        this.jRdbCcEC.setVisible(true);
        this.jRdbPrecioC.setVisible(true);
    }//GEN-LAST:event_jRadioButton1ActionPerformed

    private void jRadioButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton2ActionPerformed
        this.jRdbPcP.setVisible(true);
        this.jRdbCBP.setVisible(true);
        this.jRdbPrecioP.setVisible(true);
        
        this.jRdbCBC.setVisible(false);
        this.jRdbCcEC.setVisible(false);
        this.jRdbPrecioC.setVisible(false);
    }//GEN-LAST:event_jRadioButton2ActionPerformed

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
                
    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void jBtnAceptarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnAceptarActionPerformed
//        if (seleccionCombo != null) {
//            System.out.println("Selección guardada: " + seleccionCombo);
//            // Agrega aquí la lógica para guardar la selección en tu base de datos o en donde sea necesario
//        } else {
//            System.out.println("No se ha seleccionado ningún elemento.");
//        }
        if(this.contPersonas < this.cantPersonas){//valida que no se haya pasado la cantidad de personas de la mesa
            Comida selectedComida = (Comida) jComboBox1.getSelectedItem();
            if (selectedComida != null) {
               miListaPedidos.add(selectedComida);
               this.contPersonas++;
               JOptionPane.showMessageDialog(null,"Comida seleccionada: " + selectedComida.getNombre());
               JOptionPane.showMessageDialog(null, "Número de orden "+this.contPersonas);
            } 

        }

    }//GEN-LAST:event_jBtnAceptarActionPerformed

    private void jBtnFacturarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnFacturarActionPerformed
        // TODO add your handling code here:
        double montoTotal = 0;
        String facturaString="";
        //Metodo de pago
        int metodoPago = Integer.parseInt(JOptionPane.showInputDialog(null, "Por favor, digite: 1. Pago Efectivo - 2. Otro metodo de pago", "Tipo de Pago", JOptionPane.PLAIN_MESSAGE));
                   
        if(this.unaSolaCuenta){ //si es T es grupal
            //construir factura grupal
            Factura miFactura = new Factura();
            for (Comida miComida : this.miListaPedidos) {
                montoTotal += miComida.getPrecio();
                
            }//for
            
            this.jTextField1.setText(montoTotal+"");
            FacturaCRUD facturaCRUD = new FacturaCRUD();
            LocalDate fecha = LocalDate.now();
            Factura factura = new Factura(fecha, montoTotal);
            facturaCRUD.crearFactura(factura.getFecha(), factura.getMontoTotal());//guarda factura en sql
            //muestra la factura
            facturaString = factura.toString();
            for (Comida miComida : this.miListaPedidos) {
                facturaString += miComida.toString() + "\n";
                
            }//for
            JOptionPane.showMessageDialog(null, facturaString, "Factura de Pedido Grupal", HEIGHT);
            
            if((this.cantPersonas+1) == this.contPersonas){
                FrmFactura frameFactura = new FrmFactura();
                frameFactura.setVisible(true);
            }
        } 
        else{
          //si es individual
                Comida selectedComidaIndiv = (Comida) jComboBox1.getSelectedItem();

                montoTotal = 0;//reinicia monto
                FacturaCRUD facturaCRUD = new FacturaCRUD();
                Factura miFactura = new Factura();
                montoTotal = selectedComidaIndiv.getPrecio();
                this.jTextField1.setText(montoTotal+"");
                LocalDate fecha = LocalDate.now();
                Factura factura = new Factura(fecha, montoTotal);
               // se aumenta el contador de personas
                
                facturaCRUD.crearFactura(factura.getFecha(), factura.getMontoTotal());//crea factura en el SQL
                
                 //muestra la factura
                facturaString = factura.toString();
                facturaString += selectedComidaIndiv.toString();
                
            
                JOptionPane.showMessageDialog(null, facturaString, "Factura de Pedido Individual" + this.contPersonas, HEIGHT);
            
                int pedidosPendFact = this.cantPersonas-this.contPersonas;
                          
            
            
            if((this.cantPersonas+1) == this.contPersonas){
                FrmFactura frameFactura = new FrmFactura();
                frameFactura.setVisible(true);
            }
            
        }
    }//GEN-LAST:event_jBtnFacturarActionPerformed

    private void jRdbCBCActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbCBCActionPerformed
        List<Comida> combosBajasCalorias = funcionalidadesCombo.filtrarCombosBajasCalorias();//viene de la BD
            DefaultComboBoxModel<Comida> model = new DefaultComboBoxModel<>();
            for (Comida combo : combosBajasCalorias) {
                model.addElement(combo); // Ajusta esto según cómo deseas que se muestren los combos en el jComboBox1
            }
            jComboBox1.setModel(model);
    }//GEN-LAST:event_jRdbCBCActionPerformed

    private void jRdbPrecioCActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbPrecioCActionPerformed
        // TODO add your handling code here:
         List<Comida> combosPrecioBajo = funcionalidadesCombo.filtrarCombosPrecioBajo();
            DefaultComboBoxModel<Comida> model2 = new DefaultComboBoxModel<>();
            for (Comida combo : combosPrecioBajo) {
                model2.addElement(combo); // Ajusta esto según cómo deseas que se muestren los combos en el jComboBox1
            }    
            jComboBox1.setModel(model2);
    }//GEN-LAST:event_jRdbPrecioCActionPerformed

    private void jRdbCcECActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbCcECActionPerformed
        List<Comida> combosEnsalada = funcionalidadesCombo.filtrarCombosConEnsalada();
            DefaultComboBoxModel<Comida> model3 = new DefaultComboBoxModel<>();
            for (Comida combo : combosEnsalada) {
                model3.addElement(combo); // Ajusta esto según cómo deseas que se muestren los combos en el jComboBox1
            }    
            jComboBox1.setModel(model3);
    }//GEN-LAST:event_jRdbCcECActionPerformed

    private void jRdbPrecioPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbPrecioPActionPerformed
        List<Comida> platosPrecioBajo = funcionalidadesPlato.filtrarPlatosPrecioBajo();
            DefaultComboBoxModel<Comida> model5 = new DefaultComboBoxModel<>();
            for (Comida plato : platosPrecioBajo) {
                model5.addElement(plato); // Ajusta esto según cómo deseas que se muestren los combos en el jComboBox1
            }
            jComboBox1.setModel(model5);
    }//GEN-LAST:event_jRdbPrecioPActionPerformed

    private void jRdbCBPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbCBPActionPerformed
        List<Comida> platosBajasCalorias = funcionalidadesPlato.filtrarPlatosBajasCalorias();
            DefaultComboBoxModel<Comida> model6 = new DefaultComboBoxModel<>();
            for (Comida plato : platosBajasCalorias) {
                model6.addElement(plato); // Ajusta esto según cómo deseas que se muestren los combos en el jComboBox1
            }
            jComboBox1.setModel(model6);
    }//GEN-LAST:event_jRdbCBPActionPerformed

    private void jRdbPcPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbPcPActionPerformed
        List<Comida> platosPollo = funcionalidadesPlato.filtrarPlatosConPollo();
            DefaultComboBoxModel<Comida> model4 = new DefaultComboBoxModel<>();
            for (Comida plato : platosPollo) {
                model4.addElement(plato); // Ajusta esto según cómo deseas que se muestren los combos en el jComboBox1
            }
            jComboBox1.setModel(model4);
    }//GEN-LAST:event_jRdbPcPActionPerformed

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
for (Comida pedido : miListaPedidos) {
    System.out.println("Pedido: " + pedido.getNombre() + ", Precio: " + pedido.getPrecio());
}
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
            java.util.logging.Logger.getLogger(FrmPedidos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmPedidos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmPedidos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmPedidos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmPedidos().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.ButtonGroup buttonGroup2;
    private javax.swing.ButtonGroup buttonGroup3;
    private javax.swing.ButtonGroup buttonGroup4;
    private javax.swing.JButton jBtnAceptar;
    private javax.swing.JButton jBtnFacturar;
    private javax.swing.JButton jButton1;
    private javax.swing.JCheckBoxMenuItem jCheckBoxMenuItem1;
    private javax.swing.JComboBox<Comida> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JRadioButton jRadioButton1;
    private javax.swing.JRadioButton jRadioButton2;
    private javax.swing.JRadioButton jRdbCBC;
    private javax.swing.JRadioButton jRdbCBP;
    private javax.swing.JRadioButton jRdbCcEC;
    private javax.swing.JRadioButton jRdbPcP;
    private javax.swing.JRadioButton jRdbPrecioC;
    private javax.swing.JRadioButton jRdbPrecioP;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
