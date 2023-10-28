package proyectolenguajesrestaurante.CRUD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JTextArea;

public class BebidasCRUD {
    private List<Bebida> listaBebidas = new ArrayList<>();

    public void imprimirListaBebidas() {
    for (Bebida bebida : listaBebidas) {
        System.out.println(bebida.getNombre() + ", " + bebida.getCalorias());
    }
    }
    
    public void imprimirListaBebidas(JTextArea jTextArea) {
    for (Bebida bebida : listaBebidas) {
        jTextArea.append(bebida.getNombre() + ", " + bebida.getCalorias() + "\n");
    }
    }



    
    public void crearBebida(String nombre, String carbonatadas, String naturales, String temperatura, String desayuno, String almuerzo, String cena, int calorias, int precio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement crearBebida = con.prepareCall("{CALL crear_bebida(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            crearBebida.setString(1, nombre);
            crearBebida.setString(2, carbonatadas);
            crearBebida.setString(3, naturales);
            crearBebida.setString(4, temperatura);
            crearBebida.setString(5, desayuno);
            crearBebida.setString(6, almuerzo);
            crearBebida.setString(7, cena);
            crearBebida.setInt(8, calorias);
            crearBebida.setInt(9, precio);
            crearBebida.execute();
            
            Bebida nuevaBebida = new Bebida(nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio);
            listaBebidas.add(nuevaBebida);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void leerBebidas() {
    
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerBebida = con.prepareCall("{CALL leer_bebida()}");
            ResultSet rs = leerBebida.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                // Recupera más columnas según sea necesario

                // Verifica si ya existe una bebida con el mismo nombre en la lista
                boolean existeBebida = false;
                for (Bebida bebida : listaBebidas) {
                    if (bebida.getNombre().equals(nombre)) {
                        existeBebida = true;
                        break;
                    }
                }

                // Crea un nuevo objeto Bebida si no existe en la lista
                if (!existeBebida) {
                    String carbonatadas = rs.getString("carbonatadas");
                    String naturales = rs.getString("naturales");
                    String temperatura = rs.getString("temperatura");
                    String desayuno = rs.getString("desayuno");
                    String almuerzo = rs.getString("almuerzo");
                    String cena = rs.getString("cena");
                    int calorias = rs.getInt("calorias");
                    int precio = rs.getInt("precio");

                    Bebida nuevaBebida = new Bebida(nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio);
                    listaBebidas.add(nuevaBebida);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void actualizarBebida(String nombre, int nuevoPrecio) {
    try (Connection con = ConexionMySQL.getConexion()) {
        CallableStatement actualizarPrecioBebida = con.prepareCall("{CALL actualizar_precio_bebida_nombre(?, ?)}");

        actualizarPrecioBebida.setString(1, nombre);
        actualizarPrecioBebida.setInt(2, nuevoPrecio);
        actualizarPrecioBebida.execute();
        
        for (Bebida bebida : listaBebidas) {
            if (bebida.getNombre().equals(nombre)) {
                bebida.setPrecio(nuevoPrecio);
                break; // Si se ha encontrado y actualizado la bebida, se sale del bucle
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    }


    public void eliminarBebida(String nombre) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarBebida = con.prepareCall("{CALL eliminar_bebida_nombre(?)}");
            eliminarBebida.setString(1, nombre);
            eliminarBebida.execute();

            // Eliminar la bebida de la lista
            for (int i = 0; i < listaBebidas.size(); i++) {
                if (listaBebidas.get(i).getNombre().equals(nombre)) {
                    listaBebidas.remove(i);
                    break; // Si se ha encontrado y eliminado la bebida, se sale del bucle
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
