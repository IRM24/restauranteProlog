package proyectolenguajesrestaurante;
import UI.FrmMenuInicio;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import proyectolenguajesrestaurante.CRUD.Bebida;
import proyectolenguajesrestaurante.CRUD.BebidasCRUD;
import proyectolenguajesrestaurante.CRUD.*;
import proyectolenguajesrestaurante.Factura.Factura;
import proyectolenguajesrestaurante.Factura.FacturaCRUD;
import proyectolenguajesrestaurante.Factura.OrdenCRUD;
import proyectolenguajesrestaurante.Menus.Combo;
import proyectolenguajesrestaurante.Menus.Comida;
import proyectolenguajesrestaurante.Menus.FuncionalidadesCombo;
import proyectolenguajesrestaurante.Menus.FuncionalidadesPlato;
import proyectolenguajesrestaurante.Menus.MenuPrincipal;
import proyectolenguajesrestaurante.Menus.MenuSaludable;
import proyectolenguajesrestaurante.Menus.Plato;
import proyectolenguajesrestaurante.Mesa.OrdenesRestaurante;


public class ProyectoLenguajesRestaurante {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
<<<<<<< HEAD
        FrmMenuInicio frmMenuInicio = new FrmMenuInicio();
        frmMenuInicio.setVisible(true);
=======
        
        MenuSaludable menu = new MenuSaludable();
        menu.generarMenuSaludable();
        //Saluditos 
        
>>>>>>> a983954bfa6d0a354a5ca4b047fa2648cd658705
//<<<<<<< HEAD
////        FacturaCRUD facturaCRUD = new FacturaCRUD();
////        LocalDate fecha = LocalDate.now();
////        double montoTotal = 8000;
////        Factura factura = new Factura(fecha, montoTotal);
////        facturaCRUD.crearFactura(factura.getFecha(), factura.getMontoTotal());
//
//        
//    //MenuSaludable menu = new MenuSaludable();
//    //menu.generarMenuSaludable();
//=======
//    MenuSaludable menu = new MenuSaludable();
//    menu.generarMenuSaludable();
//>>>>>>> 0eb9e7713c2360b1ba7ee3c0aa32b06674526828
    
////        OrdenesRestaurante ordenesRestaurante = new OrdenesRestaurante();
////        ordenesRestaurante.gestionarOrdenes();
////        
//        MenuPrincipal menuPrincipal = new MenuPrincipal();
//        menuPrincipal.iniciar();
//      
        
//        FuncionalidadesCombo funcionalidadesCombo = new FuncionalidadesCombo();
//        funcionalidadesCombo.leerCombos();
//        funcionalidadesCombo.imprimirCombos();
//        List<Comida> combosBajasCalorias = funcionalidadesCombo.filtrarCombosBajasCalorias();
//        List<Comida> combosBajoPrecio = funcionalidadesCombo.filtrarCombosPrecioBajo();     
//        List<Comida> combosEnsalada = funcionalidadesCombo.filtrarCombosConEnsalada();
//
//        
//        FacturaCRUD fa = new FacturaCRUD();
//        fa.leerFacturas();
//        fa.imprimirListaFacturas();
//        int anno = 2023;
//        LocalDate localDateInicio = LocalDate.of(anno, 1, 1); // Ejemplo: 1 de enero de 2023
//        Date fechaInicio = Date.valueOf(localDateInicio);
//        LocalDate localDateFin= LocalDate.of(2023, 11, 1); // Ejemplo: 1 de enero de 2023
//        Date fechaFin = Date.valueOf(localDateFin);
//        double monto = fa.calcularSumaTotalEnRango(fechaInicio, fechaFin);
//        System.out.println(monto);
//         
<<<<<<< HEAD
//          OrdenCRUD orden = new OrdenCRUD();
//          //orden.crearOrden(LocalDate.of(2023, 1, 1), "detalle de la orden");
//          orden.leerOrdenes();
//          orden.imprimirListaOrdenes();
//          LocalDate localDateInicio = LocalDate.of(2023, 1, 28); // Ejemplo: 1 de enero de 2023
//          Date fechaInicio = Date.valueOf(localDateInicio);
//          LocalDate localDateFin= LocalDate.of(2023, 10, 30);
//          Date fechaFin = Date.valueOf(localDateFin);
//          
//          String platoMasSolicitado = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "plato");
//          System.out.println("Plato más solicitado: " + platoMasSolicitado);
=======
          /*OrdenCRUD orden = new OrdenCRUD();
          //orden.crearOrden(LocalDate.of(2023, 1, 1), "detalle de la orden");
          orden.leerOrdenes();
          orden.imprimirListaOrdenes();
          LocalDate localDateInicio = LocalDate.of(2023, 1, 28); // Ejemplo: 1 de enero de 2023
          Date fechaInicio = Date.valueOf(localDateInicio);
          LocalDate localDateFin= LocalDate.of(2023, 10, 30);
          Date fechaFin = Date.valueOf(localDateFin);
          
          String platoMasSolicitado = orden.calcularItemMasSolicitado(fechaInicio, fechaFin, "plato");
          System.out.println("Plato más solicitado: " + platoMasSolicitado);*/
>>>>>>> a983954bfa6d0a354a5ca4b047fa2648cd658705

//        //boolean valid = funcionalidadesCombo.verifyCombo(2);
//        //System.out.println(valid);
//       
//        System.out.println("Combos Ensalada:");
//        for (Comida combo : combosEnsalada) {
//            System.out.println(combo);
//        }
        
        
//        FuncionalidadesPlato funcionalidadesPlato = new FuncionalidadesPlato();
//        funcionalidadesPlato.leerPlatos();
//        funcionalidadesPlato.imprimirPlatos();
//        List<Comida> platosBajasCalorias = funcionalidadesPlato.filtrarPlatosBajasCalorias();
//        List<Comida> platosPrecioBajo = funcionalidadesPlato.filtrarPlatosPrecioBajo();
//        List<Comida> platosPollo = funcionalidadesPlato.filtrarPlatosConPollo();
//
//        
//        //boolean valid = funcionalidadesCombo.verifyCombo(2);
//        //System.out.println(valid);
//        
//        System.out.println("Platos Calorias:");
//        for (Comida plato : platosBajasCalorias) {
//            System.out.println(plato);
//        }
        
        // Pruebas para los CRUD 
        
//        BebidasCRUD bebidasCRUD = new BebidasCRUD();        
//        bebidasCRUD.leerBebidas();
//        bebidasCRUD.imprimirListaBebidas();
//        bebidasCRUD.crearBebida("Jugo Manzana", "No", "Si", "Fria", "Si", "Si", "No", 130, 1600);
//        bebidasCRUD.imprimirListaBebidas();
//        bebidasCRUD.actualizarBebida("Jugo Manzana", 1000);
//        bebidasCRUD.imprimirListaBebidas();
//        bebidasCRUD.eliminarBebida("Jugo Manzana");
//        bebidasCRUD.imprimirListaBebidas();
//        
//        ProteinasCRUD proteinasCRUD = new ProteinasCRUD();        
//        proteinasCRUD.leerProteinas();
//        proteinasCRUD.imprimirListaProteinas();
//        proteinasCRUD.crearProteina("Pollo Asado", "Pollo", "No", "Si", "Si", 200, 1800);
//        proteinasCRUD.imprimirListaProteinas();
//        proteinasCRUD.actualizarProteina("Pollo Asado", 2000);
//        proteinasCRUD.imprimirListaProteinas();
//        proteinasCRUD.eliminarProteina("Pollo Asado");
//        proteinasCRUD.imprimirListaProteinas();

//        AcompannamientosCRUD aCRUD = new AcompannamientosCRUD();        
//        aCRUD.leerAcompannamientos();
//        aCRUD.imprimirListaAcompannamientos();
//        aCRUD.crearAcompannamiento("Frijoles", "Caliente", "Si", "No","Si", "Si", "Si", 150, 900);
//        aCRUD.imprimirListaAcompannamientos();
//        aCRUD.actualizarAcompannamiento("Frijoles", 1200);
//        aCRUD.imprimirListaAcompannamientos();
//        aCRUD.eliminarAcompannamiento("Frijoles");
//        aCRUD.imprimirListaAcompannamientos();

//        PostresCRUD postresCRUD = new PostresCRUD();        
//        postresCRUD.leerPostres();
//        postresCRUD.imprimirListaPostres();
//        postresCRUD.crearPostre("Queque", "Si", "Si", "Si", "Si", "Si", 310, 1700);
//        postresCRUD.imprimirListaPostres();
//        postresCRUD.actualizarPostre("Queque", 2000);
//        postresCRUD.imprimirListaPostres();
//        postresCRUD.eliminarPostre("Queque");
//        postresCRUD.imprimirListaPostres();
      

        
    }

}    
