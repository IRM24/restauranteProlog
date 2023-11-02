package UI;

import java.awt.Component;
import java.awt.Container;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import proyectolenguajesrestaurante.Factura.Factura;
import proyectolenguajesrestaurante.Factura.FacturaCRUD;
import proyectolenguajesrestaurante.Factura.OrdenCRUD;
import proyectolenguajesrestaurante.Menus.Comida;
import proyectolenguajesrestaurante.Menus.MenusFacade;


// Esta clase crea el Frame con el cual se toman los pedidos y se factura
public class FrmPedidos extends javax.swing.JFrame {

    private boolean unaSolaCuenta = false; //false significa individual
    private int cantPersonas = 0; //cantidad de personas que van a ordenar
    private int contPersonas= 0;//lleva el conteo de cuantas personas han pedido
    private ArrayList<Comida> miListaPedidos = new ArrayList<Comida>(); //lista que almacena los pedidos
    
    ButtonGroup grupoBotones = new ButtonGroup();
    ButtonGroup grupoBotones2 = new ButtonGroup();
    ButtonGroup grupoBotones3 = new ButtonGroup();
    
    private MenusFacade menusFacade = new MenusFacade();

    List<Comida> combos = menusFacade.leerCombos();
    List<Comida> platos = menusFacade.leerPlatos();

    
    public FrmPedidos() {
        initComponents();
        

        //grupo botones de tipo comida
        this.grupoBotones.add(this.jRadioButton1);
        this.grupoBotones.add(this.jRadioButton2);
        this.grupoBotones.add(this.jRadioButton3);
        
        //grupo de botones de Combo
        this.grupoBotones2.add(this.jRdbCcEC);
        this.grupoBotones2.add(jRdbCBC);
        this.grupoBotones2.add(this.jRdbPrecioC);
        
        this.grupoBotones3.add(this.jRdbPrecioP);
        this.grupoBotones3.add(this.jRdbCBP);        
        this.grupoBotones3.add(this.jRdbPcP);
        
        this.jRdbPcP.setVisible(false);
        this.jRdbCBP.setVisible(false);
        this.jRdbPrecioP.setVisible(false);
        
        this.jRdbCBC.setVisible(false);
        this.jRdbCcEC.setVisible(false);
        this.jRdbPrecioC.setVisible(false);
        
        


    }
    
    
    public boolean isUnaSolaCuenta() {
        return unaSolaCuenta;
    }

    public void setUnaSolaCuenta(boolean unaSolaCuenta, int cantPersonas) {
        this.unaSolaCuenta = unaSolaCuenta;
        this.cantPersonas = cantPersonas;
    }

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
        jBtnFacturar = new javax.swing.JButton();
        jRdbPrecioC = new javax.swing.JRadioButton();
        jRdbCBC = new javax.swing.JRadioButton();
        jRdbCcEC = new javax.swing.JRadioButton();
        jRdbPrecioP = new javax.swing.JRadioButton();
        jRdbCBP = new javax.swing.JRadioButton();
        jRdbPcP = new javax.swing.JRadioButton();
        jRadioButton3 = new javax.swing.JRadioButton();

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

        jBtnFacturar.setText("Facturar");
        jBtnFacturar.setEnabled(false);
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

        jRadioButton3.setText("Menu Saludable");
        jRadioButton3.setToolTipText("");
        jRadioButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButton3ActionPerformed(evt);
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
                        .addComponent(jBtnAceptar, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(59, 59, 59)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jComboBox1, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
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
                                            .addGroup(layout.createSequentialGroup()
                                                .addComponent(jRadioButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(jRadioButton3))))
                                    .addComponent(jLabel1))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 379, Short.MAX_VALUE))))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jBtnFacturar, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(20, 20, 20))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(jLabel3)
                .addGap(28, 28, 28)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jRadioButton1)
                    .addComponent(jRadioButton2)
                    .addComponent(jRadioButton3))
                .addGap(40, 40, 40)
                .addComponent(jLabel2)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(1, 1, 1)
                        .addComponent(jRdbPrecioP)
                        .addGap(3, 3, 3)
                        .addComponent(jRdbCBP)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jRdbPcP))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jRdbPrecioC)
                        .addGap(3, 3, 3)
                        .addComponent(jRdbCBC)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jRdbCcEC)))
                .addGap(29, 29, 29)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jBtnAceptar)
                .addGap(18, 18, 18)
                .addComponent(jBtnFacturar)
                .addContainerGap(21, Short.MAX_VALUE))
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
   if(this.unaSolaCuenta){
        if(this.contPersonas < this.cantPersonas){//valida que no se haya pasado la cantidad de personas de la mesa
             Comida selectedComida = (Comida) jComboBox1.getSelectedItem();
             if (selectedComida != null) {
                miListaPedidos.add(selectedComida);
                this.contPersonas++;
                JOptionPane.showMessageDialog(null,"Comida seleccionada: " + selectedComida.getNombre());
                JOptionPane.showMessageDialog(null, "Número de orden "+this.contPersonas);
                this.limpiarFormulario(this);

             } 
             if(this.contPersonas==this.cantPersonas){
             JOptionPane.showMessageDialog(null, "Ya todas las personas de la mesa han hecho su pedido. Selecciona la opcion de Facturar");
                this.jBtnFacturar.setEnabled(true);
                this.jBtnAceptar.setEnabled(false);
             }
    }
   }
    if (this.unaSolaCuenta==false){//facturas individuales

        if(this.contPersonas < this.cantPersonas){//valida que no se haya pasado la cantidad de personas de la mesa

             Comida selectedComida = (Comida) jComboBox1.getSelectedItem();
             if (selectedComida != null) {
                this.contPersonas++;
                JOptionPane.showMessageDialog(null,"Comida seleccionada: " + selectedComida.getNombre());
                JOptionPane.showMessageDialog(null, "Número de orden "+this.contPersonas);
                JOptionPane.showMessageDialog(null, "Su pedido ha sido registrado. Selecciona la opcion de Facturar");

                this.jBtnFacturar.setEnabled(true);
                this.jBtnAceptar.setEnabled(false);
             } 
             
        }
    }

    }//GEN-LAST:event_jBtnAceptarActionPerformed

    private void jBtnFacturarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnFacturarActionPerformed
        double montoTotal = 0;
        String facturaString="";
        
        //Pregunta por el metodo de pago
        int metodoPago = Integer.parseInt(JOptionPane.showInputDialog(null, "Por favor, digite: 1. Pago Efectivo - 2. Otro metodo de pago", "Tipo de Pago", JOptionPane.PLAIN_MESSAGE));
                   
        if(this.unaSolaCuenta){ 

            // Construye una orden
            OrdenCRUD orden = new OrdenCRUD();
            LocalDate fecha = LocalDate.now();
            
            for (Comida miComida : this.miListaPedidos) {
                montoTotal += miComida.getPrecio();
                
                // Si la seleccion contiene Menu, divide cada uno de los elementos en
                // la eleccion para poder utilizarlos para las estadisticas de elementos
                if (miComida.toString().contains("Menu")) { 
                    
                    List<String> elementosMenu = Arrays.asList(miComida.toString().split(", "));  
                        
                    String proteina = "Proteina: " + elementosMenu.get(1);
                    orden.crearOrden(fecha, proteina);
                    
                    String acompanamiento1 = "Acompannamiento: " + elementosMenu.get(2);
                    orden.crearOrden(fecha, acompanamiento1);

                    if (!elementosMenu.get(3).equals("null'")) {
                        String acompannamiento2 = "Acompannamiento: " + elementosMenu.get(3);
                        orden.crearOrden(fecha, acompannamiento2);
                    }
                    if (!elementosMenu.get(4).equals("null'")) {
                        String acompannamiento3 = "Acompannamiento: " + elementosMenu.get(4);
                        orden.crearOrden(fecha, acompannamiento3);

                    }    

                    String bebida = "Bebida: " + elementosMenu.get(5);
                    orden.crearOrden(fecha, bebida);

                    if (!elementosMenu.get(6).equals("null'")) {
                                String postre = "Postre: " + elementosMenu.get(6);
                                orden.crearOrden(fecha, postre);
                    }
                    
                    
                } else {
                    orden.crearOrden(fecha, miComida.toString());
                   
                }
                

                
            }//for
            // crea una factura en la bd
            FacturaCRUD facturaCRUD = new FacturaCRUD();
            Factura factura = new Factura(fecha, montoTotal);
            
            facturaCRUD.crearFactura(fecha, factura.getMontoTotal());
            
            double montoOriginal = montoTotal;
            facturaString = factura.toString() + "Monto Total con IVA: " + ((montoTotal*0.13)+montoOriginal) + "\n";
            for (Comida miComida : this.miListaPedidos) {
                facturaString += miComida.toString() + "\n";
                
            }
            
            JOptionPane.showMessageDialog(null, facturaString, "Factura de Pedido Grupal", HEIGHT);
            
            // En caso de que ya se le haya tomado la orden a todas las personas
            if((this.cantPersonas) == this.contPersonas){ 
                JOptionPane.showMessageDialog(null, "El proceso de Facturación ha terminado.", "Fin Proceso Facturacion", HEIGHT);
                this.dispose();
            }
        } 
        else{
            // Si la orden es Individual
                Comida selectedComidaIndiv = (Comida) jComboBox1.getSelectedItem();

                montoTotal = 0;//reinicia monto
                LocalDate fecha = LocalDate.now();
                
                FacturaCRUD facturaCRUD = new FacturaCRUD();
                
                OrdenCRUD orden = new OrdenCRUD();
                
                // Si la seleccion contiene Menu, divide cada uno de los elementos en
                // la eleccion para poder utilizarlos para las estadisticas de elementos
                if (selectedComidaIndiv.toString().contains("Menu")) {
                    
                    List<String> elementosMenu = Arrays.asList(selectedComidaIndiv.toString().split(", "));  
                        
                    String proteina = "Proteina: " + elementosMenu.get(1);
                    orden.crearOrden(fecha, proteina);
                    
                    String acompanamiento1 = "Acompannamiento: " + elementosMenu.get(2);
                    orden.crearOrden(fecha, acompanamiento1);

                    if (!elementosMenu.get(3).equals("null'")) {
                        String acompannamiento2 = "Acompannamiento: " + elementosMenu.get(3);
                        orden.crearOrden(fecha, acompannamiento2);
                    }
                    if (!elementosMenu.get(4).equals("null'")) {
                        String acompannamiento3 = "Acompannamiento: " + elementosMenu.get(4);
                        orden.crearOrden(fecha, acompannamiento3);

                    }    

                    String bebida = "Bebida: " + elementosMenu.get(5);
                    orden.crearOrden(fecha, bebida);

                    if (!elementosMenu.get(6).equals("null'")) {
                                String postre = "Postre: " + elementosMenu.get(6);
                                orden.crearOrden(fecha, postre);
                    }
                    
                    
                } else {
                    orden.crearOrden(fecha, selectedComidaIndiv.toString());
                   
                }

                montoTotal = selectedComidaIndiv.getPrecio();
                Factura factura = new Factura(fecha, montoTotal);
                
                facturaCRUD.crearFactura(factura.getFecha(), factura.getMontoTotal());//crea factura en el SQL
                
                double montoOriginal = montoTotal;
                facturaString = factura.toString() + "Monto Total con IVA: " + ((montoTotal*0.13)+montoOriginal) + "\n";
                facturaString += selectedComidaIndiv.toString();
                
           
                JOptionPane.showMessageDialog(null, facturaString, "Factura de Pedido Individual" + this.contPersonas, HEIGHT);
                                      
            
           
            if((this.cantPersonas) > this.contPersonas){
                this.jBtnAceptar.setEnabled(true);
                this.jBtnFacturar.setEnabled(false);
                JOptionPane.showMessageDialog(null, "Seleccione el pedido del siguiente comensal");
                this.limpiarFormulario(this);
                
            }
            if(this.contPersonas==this.cantPersonas){
                JOptionPane.showMessageDialog(null, "Ya todas las personas de la mesa han hecho su pedido");
                this.dispose();

             }
            
            
        }
    }//GEN-LAST:event_jBtnFacturarActionPerformed

    private void jRdbCBCActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbCBCActionPerformed
        // Filtra Combos por bajas calorias
        List<Comida> combosBajasCalorias = this.menusFacade.filtrarCombosBajasCalorias();
            DefaultComboBoxModel<Comida> model = new DefaultComboBoxModel<>();
            for (Comida combo : combosBajasCalorias) {
                model.addElement(combo); 
            }
            jComboBox1.setModel(model);
    }//GEN-LAST:event_jRdbCBCActionPerformed

    private void jRdbPrecioCActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbPrecioCActionPerformed
        // Filtra combos con precio bajo
        List<Comida> combosPrecioBajo = this.menusFacade.filtrarCombosPrecioBajo();
            DefaultComboBoxModel<Comida> model2 = new DefaultComboBoxModel<>();
            for (Comida combo : combosPrecioBajo) {
                model2.addElement(combo); 
            }    
            jComboBox1.setModel(model2);
    }//GEN-LAST:event_jRdbPrecioCActionPerformed

    private void jRdbCcECActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbCcECActionPerformed
        // Filtra Combos con Ensalada
        List<Comida> combosEnsalada = this.menusFacade.filtrarCombosConEnsalada();
            DefaultComboBoxModel<Comida> model3 = new DefaultComboBoxModel<>();
            for (Comida combo : combosEnsalada) {
                model3.addElement(combo); 
            }    
            jComboBox1.setModel(model3);
    }//GEN-LAST:event_jRdbCcECActionPerformed

    private void jRdbPrecioPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbPrecioPActionPerformed
        // Filtra Platos con precio bajo
        List<Comida> platosPrecioBajo = this.menusFacade.filtrarPlatosPrecioBajo();
            DefaultComboBoxModel<Comida> model5 = new DefaultComboBoxModel<>();
            for (Comida plato : platosPrecioBajo) {
                model5.addElement(plato); 
            }
            jComboBox1.setModel(model5);
    }//GEN-LAST:event_jRdbPrecioPActionPerformed

    private void jRdbCBPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbCBPActionPerformed
        // Filtrar platos de bajas calorias
        List<Comida> platosBajasCalorias = this.menusFacade.filtrarPlatosBajasCalorias();
            DefaultComboBoxModel<Comida> model6 = new DefaultComboBoxModel<>();
            for (Comida plato : platosBajasCalorias) {
                model6.addElement(plato); 
            }
            jComboBox1.setModel(model6);
    }//GEN-LAST:event_jRdbCBPActionPerformed

    private void jRdbPcPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRdbPcPActionPerformed
        // Filtrar platos con pollo
        List<Comida> platosPollo = this.menusFacade.filtrarPlatosConPollo();
            DefaultComboBoxModel<Comida> model4 = new DefaultComboBoxModel<>();
            for (Comida plato : platosPollo) {
                model4.addElement(plato); 
            }
            jComboBox1.setModel(model4);
    }//GEN-LAST:event_jRdbPcPActionPerformed

    // Limpia el formulario entre pedidos
    public void limpiarFormulario(Container container) {
    for (Component component : container.getComponents()) {
        if (component instanceof JTextField) {
            JTextField field = (JTextField) component;
            field.setText("");
        }else if (component instanceof JComboBox) {
            JComboBox comboBox = (JComboBox) component;
            comboBox.setSelectedIndex(-1);
        }else if (component instanceof JRadioButton) {
            JRadioButton radioButton = (JRadioButton) component;
            radioButton.setSelected(false);
        } else if (component instanceof Container) {
            limpiarFormulario((Container) component);
        }
    }
    
    grupoBotones.clearSelection();
    grupoBotones2.clearSelection();
    grupoBotones3.clearSelection();
    this.noMostrarBtnRdd();
     

}

    private void noMostrarBtnRdd(){
    
       this.jRdbPcP.setVisible(false);
        this.jRdbCBP.setVisible(false);
        this.jRdbPrecioP.setVisible(false);
        
        this.jRdbCBC.setVisible(false);
        this.jRdbCcEC.setVisible(false);
        this.jRdbPrecioC.setVisible(false);}
    
    private void jRadioButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton3ActionPerformed
        // Permite usar la opcion de Menu Saludable
        this.jRdbPcP.setVisible(false);
        this.jRdbCBP.setVisible(false);
        this.jRdbPrecioP.setVisible(false);
        this.jRdbCBC.setVisible(false);
        this.jRdbCcEC.setVisible(false);
        this.jRdbPrecioC.setVisible(false);
        
        List<Comida> MenuSaludables = this.menusFacade.generarMenuSaludable();
        DefaultComboBoxModel<Comida> model = new DefaultComboBoxModel<>();
        
        for (Comida combo : MenuSaludables) {
                model.addElement(combo); 
            }
        jComboBox1.setModel(model);
        
    }//GEN-LAST:event_jRadioButton3ActionPerformed


    public static void main(String args[]) {

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
    private javax.swing.JCheckBoxMenuItem jCheckBoxMenuItem1;
    private javax.swing.JComboBox<Comida> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JRadioButton jRadioButton1;
    private javax.swing.JRadioButton jRadioButton2;
    private javax.swing.JRadioButton jRadioButton3;
    private javax.swing.JRadioButton jRdbCBC;
    private javax.swing.JRadioButton jRdbCBP;
    private javax.swing.JRadioButton jRdbCcEC;
    private javax.swing.JRadioButton jRdbPcP;
    private javax.swing.JRadioButton jRdbPrecioC;
    private javax.swing.JRadioButton jRdbPrecioP;
    // End of variables declaration//GEN-END:variables
}
