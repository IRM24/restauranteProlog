package proyectolenguajesrestaurante.CRUD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JTextArea;

// Clase PostresCRUD, esta clase permite las funciones CRUD y crea una lista de Postres
public class PostresCRUD {
    private List<Postre> listaPostres = new ArrayList<>();

    public void imprimirListaPostres() {
        for (Postre postre : listaPostres) {
            System.out.println(postre.getNombre() + ", " + postre.getCalorias());
        }
    }
    
    // Esta funcion se utiliza desde la interfaz
    public void imprimirListaPostres(JTextArea jTextArea) {
        for (Postre postre : listaPostres) {
            jTextArea.append(postre.getNombre() + ", " + postre.getCalorias() + "\n");
        }
    }

    // Esta funcion permite crear un postre en la base de datos y en la lista de postres
    public void crearPostre(String nombre, String lacteo, String frutas, String desayuno, String almuerzo, String cena, int calorias, int precio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement crearPostre = con.prepareCall("{CALL crear_postre(?, ?, ?, ?, ?, ?, ?, ?)}");
            crearPostre.setString(1, nombre);
            crearPostre.setString(2, lacteo);
            crearPostre.setString(3, frutas);
            crearPostre.setString(4, desayuno);
            crearPostre.setString(5, almuerzo);
            crearPostre.setString(6, cena);
            crearPostre.setInt(7, calorias);
            crearPostre.setInt(8, precio);
            crearPostre.execute();
            
            Postre nuevoPostre = new Postre(nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio);
            listaPostres.add(nuevoPostre);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Esta funcion permite obtener todos los postres en la base de datos
    public void leerPostres() {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerPostre = con.prepareCall("{CALL leer_postre()}");
            ResultSet rs = leerPostre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String lacteo = rs.getString("lacteo");
                String frutas = rs.getString("frutas");
                String desayuno = rs.getString("desayuno");
                String almuerzo = rs.getString("almuerzo");
                String cena = rs.getString("cena");
                int calorias = rs.getInt("calorias");
                int precio = rs.getInt("precio");

                // Verificar si ya existe un postre con el mismo nombre en la lista
                boolean existePostre = false;
                for (Postre postre : listaPostres) {
                    if (postre.getNombre().equals(nombre)) {
                        existePostre = true;
                        break;
                    }
                }

                // Crear un nuevo objeto Postre si no existe en la lista
                if (!existePostre) {
                    Postre nuevoPostre = new Postre(nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio);
                    listaPostres.add(nuevoPostre);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Esta funcion permite actualizar el precio de un postre
    public void actualizarPostre(String nombre, int nuevoPrecio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement actualizarPostre = con.prepareCall("{CALL actualizar_postre_nombre(?, ?)}");
            actualizarPostre.setString(1, nombre);
            actualizarPostre.setInt(2, nuevoPrecio);
            actualizarPostre.execute();

            for (Postre postre : listaPostres) {
                if (postre.getNombre().equals(nombre)) {
                    postre.setPrecio(nuevoPrecio);
                    break; // Si se ha encontrado y actualizado el postre, se sale del for
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Esta funcion permite eliminar un postre
    public void eliminarPostre(String nombre) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarPostre = con.prepareCall("{CALL eliminar_postre_nombre(?)}");
            eliminarPostre.setString(1, nombre);
            eliminarPostre.execute();

            // Eliminar el postre de la lista
            for (int i = 0; i < listaPostres.size(); i++) {
                if (listaPostres.get(i).getNombre().equals(nombre)) {
                    listaPostres.remove(i);
                    break; // Si se ha encontrado y eliminado el postre, se sale del for
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
