package proyectolenguajesrestaurante;
import java.util.List;
import proyectolenguajesrestaurante.CRUD.Bebida;
import proyectolenguajesrestaurante.CRUD.BebidasCRUD;
import proyectolenguajesrestaurante.CRUD.*;
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
    MenuSaludable menu = new MenuSaludable();
    menu.generarMenuSaludable();
    
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
