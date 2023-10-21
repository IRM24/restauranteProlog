/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package proyectolenguajesrestaurante;
import java.util.HashSet;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import org.jpl7.*;
/**
 *
 * @author camiu
 */
public class ProyectoLenguajesRestaurante {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String rutaProlog= "C:/Users/camiu/restauranteProlog/prolog/prototipoForm_Ian";
        
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
