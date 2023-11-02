package proyectolenguajesrestaurante.Menus;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import javax.swing.JOptionPane;
import org.jpl7.Query;
import org.jpl7.Term;

public class MenuSaludable {

// lista comida por cada elemento que prolog devuelva/crea lo agrega a esa lista
// y esa lista es la que tiene que llamar desde FrmPedidos (ver comentarios que le puse)

    public List<Comida> generarMenuSaludable() {
        JOptionPane.showMessageDialog(null,"Abrir terminal para ejecutar programa de menu saludable");
        System.out.println("╔══════════════════════════════════════════════╗");
        System.out.println("║  Reglas para la Correcta Ejecución     ║");
        System.out.println("╚══════════════════════════════════════════════╝");
        System.out.println("  IMPORTANTE: finalizar cada instruccion con .");
        System.out.println("  1. Ingrese el límite de calorías (> 600).");
        System.out.println("  2. ¿Desea postre? ('si.' o 'no.').");
        System.out.println("  3. Temperatura de la bebida ('fria.' o 'caliente.').");
        System.out.println("  4. Tipo de bebida ('naturales.' o 'carbonatadas.').");
        System.out.println("  5. Tipo de proteína ('pollo.', 'carnes_rojas.' o 'mariscos.').");
        System.out.println("  6. Cantidad de acompañamientos (1 a 3).");
        System.out.println("  7. Temperatura de acompañamientos ('fria.' o 'caliente.').");
        System.out.println("  8. ¿Desea vegetales en sus acompañamientos? ('si.' o 'no.').");
        System.out.println("  9. ¿Desea carbohidratos en sus acompañamientos? ('si.' o 'no.').");
        System.out.println(" 10. Si eligió postre, ¿desea postre con lácteos? ('si.' o 'no.').");
        System.out.println(" 11. Si eligió postre, ¿desea postres con frutas? ('si.' o 'no.').");
        System.out.println("╚══════════════════════════════════════════════╝");
        
        Scanner scanner = new Scanner(System.in);
        System.out.print("Por favor, ingrese el tiempo de comida (por ejemplo, 'cena'): ");
        String tiempoComida = scanner.nextLine();
        tiempoComida = "'" + tiempoComida + "'";
        System.out.println("tiempo comida "+tiempoComida);
        
        List<Comida> listaDeComidas = new ArrayList<>();
        // Ruta al archivo Prolog
        String rutaPrologIan = "C:/Users/camiu/restauranteProlog/prolog/prototipoForm_Ian.pl";

        // Consulta para cargar el archivo Prolog
        Query query = new Query("consult('" + rutaPrologIan + "')");

        // Verificar si se ha cargado el archivo Prolog
        if (query.hasSolution()) {
            System.out.println("Archivo Prolog cargado con éxito.");

            // Establecer conexión con la base de datos Prolog
            Query conexionProlog = new Query("conectar_base_de_datos.");

            // Verificar si la conexión se ha establecido correctamente
            if (conexionProlog.hasSolution()) {
                System.out.println("Conexión exitosa a la base de datos.");

                // Llamar a la función generar_menus_con_limite('cena')
                Query consultaGenerarMenus = new Query("generar_menus_con_limite(" + tiempoComida + ", MenuSeleccionado)");

                
                
                // Verificar si se encontraron soluciones
                if (consultaGenerarMenus.hasSolution()) {
                    Term menuProlog = consultaGenerarMenus.oneSolution().get("MenuSeleccionado");
                    if (menuProlog != null) {
                        if (menuProlog.isList()) {
                            for(int i = 0; i<3; i++){
                                procesarMenu(menuProlog.toTermArray()[i],listaDeComidas);
                                //System.out.println("menu: "+menuProlog.toTermArray()[i]);
                            }              
                        } else {
                            System.out.println("El término no es una lista.");
                        }
                    } else {
                        System.out.println("El término MenuSeleccionado no se encontró en la solución.");
                    }
                } else {
                    System.out.println("No se encontraron soluciones para la consulta.");
                }
            } else {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
            }
        } else {
            System.out.println("No se pudo cargar el archivo Prolog.");
        }
        System.out.println("lista: " + listaDeComidas);
        return listaDeComidas;
    }
    
    
    
    public void procesarMenu(Term lista, List<Comida> listaMenus){
    
    int Id;
    String Nombre;
    String Bebida;
    String Proteina;
    String Acompannamiento1;
    String Acompannamiento2;
    String Acompannamiento3;
    String Postre;
    int Precio;
    int Caloria;
 
    Term acompanamiento = lista.toTermArray()[4];
    Term[] elementosSublista = acompanamiento.toTermArray();
        List<Term> listaA = new ArrayList<>(); // Inicializa la lista vacía
         for (int i = 0; i < 3; i++) {
            listaA.add(null);
        }
        for (int i = 0; i < elementosSublista.length; i++) {
            listaA.set(i,  elementosSublista[i]);
        }
    
    if (lista.toTermArray().length > 7) {
        
        Id = lista.toTermArray()[0].intValue();
        Nombre = lista.toTermArray()[1].toString();
        Bebida = lista.toTermArray()[2].toString();
        Proteina = lista.toTermArray()[3].toString();
        
        Acompannamiento1 = listaA.get(0) != null ? listaA.get(0).toString() : null;
        Acompannamiento2 = listaA.get(1) != null ? listaA.get(1).toString() : null;
        Acompannamiento3 = listaA.get(2) != null ? listaA.get(2).toString() : null;

        Postre = lista.toTermArray()[5].toString();
        Precio = lista.toTermArray()[7].intValue();
        Caloria = lista.toTermArray()[6].intValue();
        
    } else {
    
        Id = lista.toTermArray()[0].intValue();
        Nombre = lista.toTermArray()[1].toString();
        Bebida = lista.toTermArray()[2].toString();
        Proteina = lista.toTermArray()[3].toString();
        
        Acompannamiento1 = listaA.get(0) != null ? listaA.get(0).toString() : null;
        Acompannamiento2 = listaA.get(1) != null ? listaA.get(1).toString() : null;
        Acompannamiento3 = listaA.get(2) != null ? listaA.get(2).toString() : null;

        Postre = null;
        Precio = lista.toTermArray()[6].intValue();
        Caloria = lista.toTermArray()[5].intValue();
    }

    Combo combo = (Combo) FactoryComida.crearComida("combo", Id, Nombre, Proteina, Acompannamiento1, Acompannamiento2, Acompannamiento3, Caloria, Precio, Bebida, Postre);
    //System.out.println("Combo: "+combo);
    listaMenus.add(combo);
    }
}
