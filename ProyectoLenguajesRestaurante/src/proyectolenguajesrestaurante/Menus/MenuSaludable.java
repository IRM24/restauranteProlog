package proyectolenguajesrestaurante.Menus;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;

public class MenuSaludable {

int Id;
String Nombre;
String Proteina;
String Acompannamiento1;
String Acompannamiento2;
String Acompannamiento3;
int Caloria;
int Precio;
String Bebida;
String Postre;

    public void generarMenuSaludable() {
        // Ruta al archivo Prolog
        String rutaPrologIan = "C:/Users/Ian Calvo/Desktop/restauranteProlog/prolog/prototipoForm_Ian.pl";

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
                Query consultaGenerarMenus = new Query("generar_menus_con_limite('cena', MenuSeleccionado)");

                int idCounter = 1; //este contador es provicional
                String nombreCombo = "Nombre Combo";
                
                // Verificar si se encontraron soluciones
                if (consultaGenerarMenus.hasSolution()) {
                    Term menuProlog = consultaGenerarMenus.oneSolution().get("MenuSeleccionado");
                    if (menuProlog != null) {
                        // Verifica si el término es una lista
                        if (menuProlog.isList()) {
                            
                            List<Term> lista = new ArrayList<>(); // Inicializa la lista vacía
                            
                            Term acompanamiento = menuProlog.toTermArray()[2];
                            Term[] elementosSublista = acompanamiento.toTermArray();
                            
                            for (int i = 0; i < 3; i++) {
                                lista.add(null);
                            }
                            for (int i = 0; i < elementosSublista.length; i++) {
                                lista.set(i, elementosSublista[i]);
                            }
                            // Convierte el término de lista a una lista de Java
                            List<String> menuJava = new ArrayList<>();
                            
                            menuJava.add(Integer.toString(idCounter));
                            menuJava.add(nombreCombo+" "+idCounter);
                            
                            for (Term item : menuProlog.toTermArray()) {
                                menuJava.add(item.toString());
                            }
                            // Ahora tienes el menú en forma de lista de Java
                            System.out.println("Menú en Java: " + menuJava);
                            System.out.println("La longitud de la lista es: " + menuJava.size());
                            
                            if(menuJava.size()>7){
                                Id = Integer.parseInt(menuJava.get(0));
                                Nombre = menuJava.get(1);
                                Bebida = menuJava.get(2);
                                Proteina = menuJava.get(3);
                                
                                Term elemento1 = lista.get(0);
                                Term elemento2 = lista.get(1);
                                Term elemento3 = lista.get(2);
                                
                                Acompannamiento1 = elemento1 != null ? elemento1.toString() : null;
                                Acompannamiento2 = elemento2 != null ? elemento2.toString() : null;
                                Acompannamiento3 = elemento3 != null ? elemento3.toString() : null;
                                
                                Postre = menuJava.get(5);
                                Precio = Integer.parseInt(menuJava.get(6));
                                Caloria = Integer.parseInt(menuJava.get(7));
                            }else{
                                Id = Integer.parseInt(menuJava.get(0));
                                Nombre = menuJava.get(1);
                                Bebida = menuJava.get(2);
                                Proteina = menuJava.get(3);
                                
                                Term elemento1 = lista.get(0);
                                Term elemento2 = lista.get(1);
                                Term elemento3 = lista.get(2);
                                
                                Acompannamiento1 = elemento1 != null ? elemento1.toString() : null;
                                Acompannamiento2 = elemento2 != null ? elemento2.toString() : null;
                                Acompannamiento3 = elemento3 != null ? elemento3.toString() : null;
                                
                                Postre = null;
                                Precio = Integer.parseInt(menuJava.get(5));
                                Caloria = Integer.parseInt(menuJava.get(6));
                            }
                                Combo combo = (Combo) FactoryComida.crearComida("combo", Id, Nombre, Proteina, Acompannamiento1, Acompannamiento2, Acompannamiento3, Caloria, Precio, Bebida, Postre);
                                
                                System.out.println("BebidaCombo: " + combo.getBebida());
                                System.out.println("ProteinaCombo: " + combo.getProteina());
                                System.out.println("Acompanamiento1Combo: " + combo.getAcompannamiento1());
                                System.out.println("Acompanamiento2Combo: " + combo.getAcompannamiento2());
                                System.out.println("Acompanamiento3Combo: " + combo.getAcompannamiento3());
                                System.out.println("PostreCombo: " + combo.getPostre());
                                System.out.println("PrecioCombo: " + combo.getPrecio());
                                System.out.println("CaloriaCombo: " + combo.getCalorias());
                                
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
    }
}
