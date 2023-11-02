package proyectolenguajesrestaurante.CRUD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JTextArea;

// Clase AcompannamientosCRUD, esta clase permite las funciones CRUD y crea una lista de Acopannamientos

public class AcompannamientosCRUD {
    private List<Acompannamiento> listaAcompannamiento = new ArrayList<>();

    public void imprimirListaAcompannamientos() {
        for (Acompannamiento acompannamiento : listaAcompannamiento) {
            System.out.println(acompannamiento.getNombre() + ", " + acompannamiento.getCalorias());
        }
    }
    
    // Esta funcion se utiliza desde la interfaz
    public void imprimirListaAcompannamientos(JTextArea jTextArea) {
        for (Acompannamiento acompannamiento : listaAcompannamiento) {
            jTextArea.append(acompannamiento.getNombre() + ", " + acompannamiento.getCalorias() + "\n");
        }
    }

    // Permite crear un acompannamiento tanto en la base de datos y se agrega a la lista
    public void crearAcompannamiento(String nombre, String temperatura, String carbohidratos, String vegetales, String desayuno, String almuerzo, String cena, int calorias, int precio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement crearAcompannamiento = con.prepareCall("{CALL crear_acompannamiento(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            crearAcompannamiento.setString(1, nombre);
            crearAcompannamiento.setString(2, temperatura);
            crearAcompannamiento.setString(3, carbohidratos);
            crearAcompannamiento.setString(4, vegetales);
            crearAcompannamiento.setString(5, desayuno);
            crearAcompannamiento.setString(6, almuerzo);
            crearAcompannamiento.setString(7, cena);
            crearAcompannamiento.setInt(8, calorias);
            crearAcompannamiento.setInt(9, precio);
            crearAcompannamiento.execute();
            
            Acompannamiento nuevaAcompannamiento = new Acompannamiento(nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio);
            listaAcompannamiento.add(nuevaAcompannamiento);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Permite obtener todos los acompannamientos de la base de datos
    public void leerAcompannamientos() {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerAcompannamiento = con.prepareCall("{CALL leer_acompannamiento()}");
            ResultSet rs = leerAcompannamiento.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String temperatura = rs.getString("temperatura");
                String carbohidratos = rs.getString("carbohidratos");
                String vegetales = rs.getString("vegetales");
                String desayuno = rs.getString("desayuno");
                String almuerzo = rs.getString("almuerzo");
                String cena = rs.getString("cena");
                int calorias = rs.getInt("calorias");
                int precio = rs.getInt("precio");

                // Verificar si ya existe un acompañamiento con el mismo nombre en la lista
                boolean existeAcompannamiento = false;
                for (Acompannamiento acompannamiento : listaAcompannamiento) {
                    if (acompannamiento.getNombre().equals(nombre)) {
                        existeAcompannamiento = true;
                        break;
                    }
                }

                // Crear un nuevo objeto Acompannamiento si no existe en la lista
                if (!existeAcompannamiento) {
                    Acompannamiento nuevoAcompannamiento = new Acompannamiento(nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio);
                    listaAcompannamiento.add(nuevoAcompannamiento);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Permite actualizar el precio de un acompannamiento 
    public void actualizarAcompannamiento(String nombre, int nuevoPrecio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement actualizarPrecioAcompannamiento = con.prepareCall("{CALL actualizar_acompannamiento_nombree(?, ?)}");

            actualizarPrecioAcompannamiento.setString(1, nombre);
            actualizarPrecioAcompannamiento.setInt(2, nuevoPrecio);
            actualizarPrecioAcompannamiento.execute();

            for (Acompannamiento acompannamiento : listaAcompannamiento) {
                if (acompannamiento.getNombre().equals(nombre)) {
                    acompannamiento.setPrecio(nuevoPrecio);
                    break; // Si se ha encontrado y actualizado el acompañamiento, se sale del for
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Permite eliminar un acompannamiento
    public void eliminarAcompannamiento(String nombre) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarAcompannamiento = con.prepareCall("{CALL eliminar_acompannamiento_nombree(?)}");
            eliminarAcompannamiento.setString(1, nombre);
            eliminarAcompannamiento.execute();

            // Eliminar el acompañamiento de la lista
            for (int i = 0; i < listaAcompannamiento.size(); i++) {
                if (listaAcompannamiento.get(i).getNombre().equals(nombre)) {
                    listaAcompannamiento.remove(i);
                    break; // Si se ha encontrado y eliminado el acompañamiento, se sale del for
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
