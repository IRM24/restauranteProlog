package proyectolenguajesrestaurante.CRUD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JTextArea;

// Clase ProteinasCRUD, esta clase permite las funciones CRUD y crea una lista de Proteinas
public class ProteinasCRUD {
    
    private List<Proteina> listaProteina = new ArrayList<>();

    public void imprimirListaProteinas() {
        for (Proteina proteina : listaProteina) {
            System.out.println(proteina.getNombre() + ", " + proteina.getCalorias());
        }
    }
    
    // Esta funcion se utiliza desde la interfaz
    public void imprimirListaProteinas(JTextArea jTextArea) {
        for (Proteina proteina : listaProteina) {
            jTextArea.append(proteina.getNombre() + ", " + proteina.getCalorias() + "\n");
        }
    }

    // Esta funcion permite crear una proteina en la base de datos y agregarla a la lista
    public void crearProteina(String nombre, String tipo, String desayuno, String almuerzo, String cena, int calorias, int precio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement crearProteina = con.prepareCall("{CALL crear_proteina(?, ?, ?, ?, ?, ?, ?)}");
            crearProteina.setString(1, nombre);
            crearProteina.setString(2, tipo);
            crearProteina.setString(3, desayuno);
            crearProteina.setString(4, almuerzo);
            crearProteina.setString(5, cena);
            crearProteina.setInt(6, calorias);
            crearProteina.setInt(7, precio);
            crearProteina.execute();
            
            Proteina nuevaProteina = new Proteina(nombre, tipo, desayuno, almuerzo, cena, calorias, precio);
            listaProteina.add(nuevaProteina);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Permite obtener todas las proteinas en la base de datos
    public void leerProteinas() {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerProteina = con.prepareCall("{CALL leer_proteina()}");
            ResultSet rs = leerProteina.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String tipo = rs.getString("tipo");
                String desayuno = rs.getString("desayuno");
                String almuerzo = rs.getString("almuerzo");
                String cena = rs.getString("cena");
                int calorias = rs.getInt("calorias");
                int precio = rs.getInt("precio");

                // Verificar si ya existe una proteína con el mismo nombre en la lista
                boolean existeProteina = false;
                for (Proteina proteina : listaProteina) {
                    if (proteina.getNombre().equals(nombre)) {
                        existeProteina = true;
                        break;
                    }
                }

                // Crear un nuevo objeto Proteina si no existe en la lista
                if (!existeProteina) {
                    Proteina nuevaProteina = new Proteina(nombre, tipo, desayuno, almuerzo, cena, calorias, precio);
                    listaProteina.add(nuevaProteina);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Permite actualizar el precio de una proteina
    public void actualizarProteina(String nombre, int nuevoPrecio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement actualizarPrecioProteina = con.prepareCall("{CALL actualizar_proteina_nombre(?, ?)}");

            actualizarPrecioProteina.setString(1, nombre);
            actualizarPrecioProteina.setInt(2, nuevoPrecio);
            actualizarPrecioProteina.execute();

            for (Proteina proteina : listaProteina) {
                if (proteina.getNombre().equals(nombre)) {
                    proteina.setPrecio(nuevoPrecio);
                    break; // Si se ha encontrado y actualizado la proteina, se sale del for
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Permite eliminar una proteina
    public void eliminarProteina(String nombre) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarProteina = con.prepareCall("{CALL eliminar_proteina_nombre(?)}");
            eliminarProteina.setString(1, nombre);
            eliminarProteina.execute();

            // Eliminar la proteína de la lista
            for (int i = 0; i < listaProteina.size(); i++) {
                if (listaProteina.get(i).getNombre().equals(nombre)) {
                    listaProteina.remove(i);
                    break; // Si se ha encontrado y eliminado la proteina, se sale del for
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
