package UI;

import java.sql.Date;
import java.time.LocalDate;
import javax.swing.ButtonGroup;
import proyectolenguajesrestaurante.Factura.OrdenCRUD;

// Esta clase crea un Frame que se utiliza para obtener las estadisticas de una fecha
// a otra fecha para conocer cuales son los platos/combos/elementos mas solicitados
public class FrmOrdenesRegistro extends javax.swing.JFrame {

    ButtonGroup grupoBotones = new ButtonGroup();
    
    public FrmOrdenesRegistro() {
        initComponents();
        
        this.grupoBotones.add(jButton5);
        this.grupoBotones.add(jButton6);
        this.grupoBotones.add(jButton7);
        this.grupoBotones.add(jButton8);
        
        this.jButton5.setVisible(false);
        this.jButton6.setVisible(false);
        this.jButton7.setVisible(false);
        this.jButton8.setVisible(false);
    }
    
    OrdenCRUD orden = new OrdenCRUD();
   
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jComboBox2 = new javax.swing.JComboBox<>();
        jComboBox3 = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        jComboBox4 = new javax.swing.JComboBox<>();
        jComboBox5 = new javax.swing.JComboBox<>();
        jComboBox6 = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jButton7 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        jLabel1.setText("Estadisticas de Ordenes");

        jLabel3.setText("Seleccione Fecha de Inicio");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "2022", "2023" }));
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", " " }));
        jComboBox2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox2ActionPerformed(evt);
            }
        });

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", " " }));
        jComboBox3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox3ActionPerformed(evt);
            }
        });

        jLabel4.setText("Seleccione Fecha de Fin");

        jComboBox4.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "2022", "2023" }));
        jComboBox4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox4ActionPerformed(evt);
            }
        });

        jComboBox5.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", " " }));
        jComboBox5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox5ActionPerformed(evt);
            }
        });

        jComboBox6.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", " " }));
        jComboBox6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox6ActionPerformed(evt);
            }
        });

        jLabel5.setText("Anno");

        jLabel6.setText("Mes");

        jLabel7.setText("Dia");

        jTextField1.setText("Comida mas seleccionada");
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });

        jButton1.setText("Calcular para Combo ");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jLabel2.setText("Mas Solicitado:");

        jButton2.setText("Calcular para Plato");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setText("Calcular para Menu Saludable");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jLabel8.setText("Seleccione una opcion");

        jButton4.setText("Volver Menu Principal");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jButton5.setText("Proteina");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        jButton6.setText("Acompannamiento");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });

        jButton7.setText("Bebida");
        jButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton7ActionPerformed(evt);
            }
        });

        jButton8.setText("Postre");
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(35, 35, 35)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jButton4)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jLabel4)
                                            .addComponent(jLabel3))
                                        .addGap(34, 34, 34)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                            .addGroup(layout.createSequentialGroup()
                                                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                                            .addGroup(layout.createSequentialGroup()
                                                .addComponent(jComboBox4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(jComboBox5, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(2, 2, 2)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jLabel8)
                                            .addGroup(layout.createSequentialGroup()
                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                                    .addComponent(jButton2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                    .addComponent(jButton1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                    .addComponent(jButton3, javax.swing.GroupLayout.Alignment.LEADING))
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                .addComponent(jButton5)
                                                .addGap(8, 8, 8)))))
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, 54, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addComponent(jComboBox6, javax.swing.GroupLayout.PREFERRED_SIZE, 54, javax.swing.GroupLayout.PREFERRED_SIZE))
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 300, Short.MAX_VALUE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(4, 4, 4)
                                        .addComponent(jButton6)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(jButton7)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(jButton8)
                                        .addGap(0, 0, Short.MAX_VALUE))))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(291, 291, 291))
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(188, 188, 188)
                                        .addComponent(jLabel5))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(267, 267, 267)
                                        .addComponent(jLabel6)))
                                .addGap(45, 45, 45)
                                .addComponent(jLabel7)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 586, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE)))))
                .addContainerGap(27, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(jLabel1)
                .addGap(35, 35, 35)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jLabel6)
                    .addComponent(jLabel7))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jComboBox4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton3)
                    .addComponent(jButton5)
                    .addComponent(jButton6)
                    .addComponent(jButton7)
                    .addComponent(jButton8))
                .addGap(32, 32, 32)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 35, Short.MAX_VALUE)
                .addComponent(jButton4)
                .addGap(30, 30, 30))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // Carga las Ordenes desde la Base de Datos
        orden.leerOrdenes();
        
        String selectedValue1 = (String) jComboBox1.getSelectedItem();
        int annoInicio = Integer.parseInt(selectedValue1);
        
        String selectedValue2 = (String) jComboBox2.getSelectedItem();
        int mesInicio = Integer.parseInt(selectedValue2);
        
        String selectedValue3 = (String) jComboBox3.getSelectedItem();
        int diaInicio = Integer.parseInt(selectedValue3);
        
        String selectedValue4 = (String) jComboBox4.getSelectedItem();
        int annoFin = Integer.parseInt(selectedValue4);
        
        String selectedValue5 = (String) jComboBox5.getSelectedItem();
        int mesFin = Integer.parseInt(selectedValue5);
        
        String selectedValue6 = (String) jComboBox6.getSelectedItem();
        int diaFin = Integer.parseInt(selectedValue6);

        LocalDate localDateInicio = LocalDate.of(annoInicio, mesInicio, diaInicio); // Ejemplo: 1 de enero de 2023
        Date fechaInicio = Date.valueOf(localDateInicio);
        
        LocalDate localDateFin= LocalDate.of(annoFin,mesFin, diaFin); // Ejemplo: 1 de enero de 2023
        Date fechaFin = Date.valueOf(localDateFin);
        
        String comida = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "combo");
        this.jTextField1.setText(comida);
         
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void jComboBox2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox2ActionPerformed
    }//GEN-LAST:event_jComboBox2ActionPerformed

    private void jComboBox3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox3ActionPerformed
    }//GEN-LAST:event_jComboBox3ActionPerformed

    private void jComboBox4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox4ActionPerformed
    }//GEN-LAST:event_jComboBox4ActionPerformed

    private void jComboBox5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox5ActionPerformed
    }//GEN-LAST:event_jComboBox5ActionPerformed

    private void jComboBox6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox6ActionPerformed
    }//GEN-LAST:event_jComboBox6ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // Carga las Ordenes desde la Base de Datos
        orden.leerOrdenes();
        
        String selectedValue1 = (String) jComboBox1.getSelectedItem();
        int annoInicio = Integer.parseInt(selectedValue1);
        
        String selectedValue2 = (String) jComboBox2.getSelectedItem();
        int mesInicio = Integer.parseInt(selectedValue2);
        
        String selectedValue3 = (String) jComboBox3.getSelectedItem();
        int diaInicio = Integer.parseInt(selectedValue3);
        
        String selectedValue4 = (String) jComboBox4.getSelectedItem();
        int annoFin = Integer.parseInt(selectedValue4);
        
        String selectedValue5 = (String) jComboBox5.getSelectedItem();
        int mesFin = Integer.parseInt(selectedValue5);
        
        String selectedValue6 = (String) jComboBox6.getSelectedItem();
        int diaFin = Integer.parseInt(selectedValue6);

        LocalDate localDateInicio = LocalDate.of(annoInicio, mesInicio, diaInicio); // Ejemplo: 1 de enero de 2023
        Date fechaInicio = Date.valueOf(localDateInicio);
        
        LocalDate localDateFin= LocalDate.of(annoFin,mesFin, diaFin); // Ejemplo: 1 de enero de 2023
        Date fechaFin = Date.valueOf(localDateFin);
        
        // Calcula el plato mas solicitado
        String comida = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "plato");
        this.jTextField1.setText(comida);
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // Si se selecciona Menu Saludable, salen las opciones para ver los elementos
        // de manera individual mas solicitados 
        this.jButton5.setVisible(true);
        this.jButton6.setVisible(true);
        this.jButton7.setVisible(true);
        this.jButton8.setVisible(true);
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        dispose();
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // Carga las Ordenes desde la Base de Datos        
        orden.leerOrdenes();

        String selectedValue1 = (String) jComboBox1.getSelectedItem();
        int annoInicio = Integer.parseInt(selectedValue1);
        
        String selectedValue2 = (String) jComboBox2.getSelectedItem();
        int mesInicio = Integer.parseInt(selectedValue2);
        
        String selectedValue3 = (String) jComboBox3.getSelectedItem();
        int diaInicio = Integer.parseInt(selectedValue3);
        
        String selectedValue4 = (String) jComboBox4.getSelectedItem();
        int annoFin = Integer.parseInt(selectedValue4);
        
        String selectedValue5 = (String) jComboBox5.getSelectedItem();
        int mesFin = Integer.parseInt(selectedValue5);
        
        String selectedValue6 = (String) jComboBox6.getSelectedItem();
        int diaFin = Integer.parseInt(selectedValue6);

        LocalDate localDateInicio = LocalDate.of(annoInicio, mesInicio, diaInicio); // Ejemplo: 1 de enero de 2023
        Date fechaInicio = Date.valueOf(localDateInicio);
        
        LocalDate localDateFin= LocalDate.of(annoFin,mesFin, diaFin); // Ejemplo: 1 de enero de 2023
        Date fechaFin = Date.valueOf(localDateFin);
        
        //Calcula la Proteina mas solicitada
        String proteina = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "Proteina");
        this.jTextField1.setText(proteina);
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        // Carga las Ordenes desde la Base de Datos
        orden.leerOrdenes();

        String selectedValue1 = (String) jComboBox1.getSelectedItem();
        int annoInicio = Integer.parseInt(selectedValue1);
        
        String selectedValue2 = (String) jComboBox2.getSelectedItem();
        int mesInicio = Integer.parseInt(selectedValue2);
        
        String selectedValue3 = (String) jComboBox3.getSelectedItem();
        int diaInicio = Integer.parseInt(selectedValue3);
        
        String selectedValue4 = (String) jComboBox4.getSelectedItem();
        int annoFin = Integer.parseInt(selectedValue4);
        
        String selectedValue5 = (String) jComboBox5.getSelectedItem();
        int mesFin = Integer.parseInt(selectedValue5);
        
        String selectedValue6 = (String) jComboBox6.getSelectedItem();
        int diaFin = Integer.parseInt(selectedValue6);

        LocalDate localDateInicio = LocalDate.of(annoInicio, mesInicio, diaInicio); // Ejemplo: 1 de enero de 2023
        Date fechaInicio = Date.valueOf(localDateInicio);
        
        LocalDate localDateFin= LocalDate.of(annoFin,mesFin, diaFin); // Ejemplo: 1 de enero de 2023
        Date fechaFin = Date.valueOf(localDateFin);
        
        // Calcula el acompannamiento mas solicitado
        String acompannamiento = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "Acompannamiento");
        this.jTextField1.setText(acompannamiento);
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton7ActionPerformed
         // Carga las Ordenes desde la Base de Datos
        orden.leerOrdenes();

        String selectedValue1 = (String) jComboBox1.getSelectedItem();
        int annoInicio = Integer.parseInt(selectedValue1);
        
        String selectedValue2 = (String) jComboBox2.getSelectedItem();
        int mesInicio = Integer.parseInt(selectedValue2);
        
        String selectedValue3 = (String) jComboBox3.getSelectedItem();
        int diaInicio = Integer.parseInt(selectedValue3);
        
        String selectedValue4 = (String) jComboBox4.getSelectedItem();
        int annoFin = Integer.parseInt(selectedValue4);
        
        String selectedValue5 = (String) jComboBox5.getSelectedItem();
        int mesFin = Integer.parseInt(selectedValue5);
        
        String selectedValue6 = (String) jComboBox6.getSelectedItem();
        int diaFin = Integer.parseInt(selectedValue6);

        LocalDate localDateInicio = LocalDate.of(annoInicio, mesInicio, diaInicio); // Ejemplo: 1 de enero de 2023
        Date fechaInicio = Date.valueOf(localDateInicio);
        
        LocalDate localDateFin= LocalDate.of(annoFin,mesFin, diaFin); // Ejemplo: 1 de enero de 2023
        Date fechaFin = Date.valueOf(localDateFin);
        
        // Calcula la Bebida mas solicitada
        String bebida = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "Bebida");
        this.jTextField1.setText(bebida);
    }//GEN-LAST:event_jButton7ActionPerformed

    private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
        // Carga las Ordenes desde la Base de Datos
        orden.leerOrdenes();

        String selectedValue1 = (String) jComboBox1.getSelectedItem();
        int annoInicio = Integer.parseInt(selectedValue1);
        
        String selectedValue2 = (String) jComboBox2.getSelectedItem();
        int mesInicio = Integer.parseInt(selectedValue2);
        
        String selectedValue3 = (String) jComboBox3.getSelectedItem();
        int diaInicio = Integer.parseInt(selectedValue3);
        
        String selectedValue4 = (String) jComboBox4.getSelectedItem();
        int annoFin = Integer.parseInt(selectedValue4);
        
        String selectedValue5 = (String) jComboBox5.getSelectedItem();
        int mesFin = Integer.parseInt(selectedValue5);
        
        String selectedValue6 = (String) jComboBox6.getSelectedItem();
        int diaFin = Integer.parseInt(selectedValue6);

        LocalDate localDateInicio = LocalDate.of(annoInicio, mesInicio, diaInicio); // Ejemplo: 1 de enero de 2023
        Date fechaInicio = Date.valueOf(localDateInicio);
        
        LocalDate localDateFin= LocalDate.of(annoFin,mesFin, diaFin); // Ejemplo: 1 de enero de 2023
        Date fechaFin = Date.valueOf(localDateFin);
        
        // Calcula el postre mas solicitado
        String postre = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "Postre");
        this.jTextField1.setText(postre);
    }//GEN-LAST:event_jButton8ActionPerformed

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmOrdenesRegistro().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JButton jButton7;
    private javax.swing.JButton jButton8;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JComboBox<String> jComboBox3;
    private javax.swing.JComboBox<String> jComboBox4;
    private javax.swing.JComboBox<String> jComboBox5;
    private javax.swing.JComboBox<String> jComboBox6;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
