package proyectolenguajesrestaurante;
import java.util.HashSet;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import org.jpl7.*;
import proyectolenguajesrestaurante.CRUD.*;
import proyectolenguajesrestaurante.Mesa.OrdenesRestaurante;






/**
 *
 * @author camiu
 */
public class ProyectoLenguajesRestaurante {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //OrdenesRestaurante ordenesRestaurante = new OrdenesRestaurante();
        //ordenesRestaurante.gestionarOrdenes();
        
        

        // Pruebas para los CRUD 
        
        //BebidasCRUD bebidasCRUD = new BebidasCRUD();
        //bebidasCRUD.crearBebida("Jugo Manzana", "No", "Si", "Fria", "Si", "Si", "No", 130, 1600);
        //bebidasCRUD.leerBebidas();    
        //bebidasCRUD.eliminarBebida(10);
        //bebidasCRUD.actualizarBebida(1, 1500);

        //ProteinasCRUD proteinasCRUD = new ProteinasCRUD();
        //proteinasCRUD.crearProteina("Cordero", "Carnes Rojas", "No", "Si", "Si", 250, 3600);
        //proteinasCRUD.leerProteinas();
        //proteinasCRUD.eliminarProteina(10);
        //proteinasCRUD.actualizarProteina(1, 1600);
        //proteinasCRUD.leerProteinas();
        
        //AcompannamientosCRUD aCRUD = new AcompannamientosCRUD();
        //aCRUD.crearAcompannamiento("Sopa Cebolla", "Caliente", "Si", "Si", "No", "Si", "Si", 190, 2500);
        //aCRUD.leerAcompannamientos();
        //aCRUD.eliminarAcompannamiento(11);
        //aCRUD.actualizarAcompannamiento(1, 800);
        //aCRUD.leerAcompannamientos();
                
        //PostresCRUD postresCRUD = new PostresCRUD();
        //postresCRUD.crearPostre("Queque vainilla", "Si", "No", "Si", "Si", "Si", 250,2000 );
        //postresCRUD.leerPostres();
        //postresCRUD.actualizarPostre(3, 2650);
        //postresCRUD.eliminarPostre(11);
        //postresCRUD.leerPostres();
        
        //String rutaProlog= "C:/Users/camiu/restauranteProlog/prolog/prototipoForm_Ian";
        
        String rutaProlog= "C:/Users/Ian Calvo/Desktop/restauranteProlog/prolog/prototipoForm_Ian.pl";
        
        Query query = new Query("consult('"+ rutaProlog +"')");
        
       
        if(query.hasSolution()){
            System.out.println("Archivo cargado con exito");
            
            Query conexionProlog = new Query("conectar_base_de_datos.");
            if (conexionProlog.hasSolution()){
                System.out.println("Conexion exitosa a la base de datos ");

                try(Scanner scanner = new Scanner(System.in)){
                    System.out.println("Tiempo de comida: ");
                    String tiempoComida = scanner.nextLine();

                    Set<String> comidas = new HashSet<>();

                    Term[] terminos = {new Atom(tiempoComida), new Variable("P")};
                    Query consultaPollo = new Query("obtener_proteina_pollo", terminos);
                    consultaPollo.hasSolution();
                    if (consultaPollo.hasSolution()) {
                        System.out.println("Soluciones encontradas:");
                        while (consultaPollo.hasMoreSolutions()) {
                            Map<String, Term> solution = consultaPollo.nextSolution();
                            Term polloTerm = solution.get("P");
                            comidas.add(polloTerm.toString());
                        }
                        System.out.println("Las comidas de pollo son: " + comidas);
                    } else {
                        System.out.println("No se encontraron soluciones.");
                    }
            }
        }    
    }
}
}    
