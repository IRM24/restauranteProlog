package proyectolenguajesrestaurante.Menus;

import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;

public class MenuSaludable {

    public static void main(String[] args) {
        // Ruta al archivo Prolog
        String rutaProlog = "C:/Users/camiu/restauranteProlog/prolog/prototipoForm_Ian";

        // Consulta para cargar el archivo Prolog
        Query query = new Query("consult('" + rutaProlog + "')");

        // Verificar si se ha cargado el archivo Prolog
        if (query.hasSolution()) {
            System.out.println("Archivo cargado con éxito.");

            // Establecer conexión con la base de datos Prolog
            Query conexionProlog = new Query("conectar_base_de_datos.");

            // Verificar si la conexión se ha establecido correctamente
            if (conexionProlog.hasSolution()) {
                System.out.println("Conexión exitosa a la base de datos.");

                // Llamar a la función generar_menus_con_limite('cena')
                Term[] terminos = {new Atom("cena")};
                Query consultaGenerarMenus = new Query("generar_menus_con_limite", terminos);

                // Verificar si se encontraron soluciones
                if (consultaGenerarMenus.hasSolution()) {
                    System.out.println("Soluciones encontradas:");
                    while (consultaGenerarMenus.hasMoreSolutions()) {
                        java.util.Map<String, Term> solution = consultaGenerarMenus.nextSolution();
                        // Recuperar las soluciones y manejarlas según sea necesario
                        if (solution != null) {
                            Term menu = solution.get("Menu"); // Suponiendo que el nombre de la variable en Prolog sea "Menu"
                            System.out.println("Menú: " + menu.toString());
                            // Aquí puedes realizar cualquier operación adicional con el menú recuperado
                        }
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
    }
}