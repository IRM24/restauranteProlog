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
            
            try(Scanner scanner = new Scanner(System.in)){
                System.out.println("Tiempo de comida: ");
                String tiempoComida = scanner.nextLine();
                
                Set<String> comidas = new HashSet<>();
                
                Query consultaPollo = new Query("obtener_proteina_pollo('cena',P)");
                consultaPollo.hasSolution();
                while(consultaPollo.hasSolution()){
                    java.util.Map<String, Term> solution = consultaPollo.nextSolution();
                    Term polloTerm = solution.get("P");
                }

            }
    
    }
}
}    
