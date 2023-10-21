package proyectolenguajesrestaurante.CRUD;

import java.sql.*;

public class BebidasCRUD {

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
                // Agrega más columnas según sea necesario

                // Imprimir los valores de las columnas
                System.out.println("ID: " + id + ", Nombre: " + nombre);
                // Agrega más columnas según sea necesario
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizarBebida(int id, int nuevoPrecio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement actualizarPrecioBebida = con.prepareCall("{CALL actualizar_precio_bebida(?, ?)}");
            actualizarPrecioBebida.setInt(1, id);
            actualizarPrecioBebida.setInt(2, nuevoPrecio);
            actualizarPrecioBebida.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarBebida(int id) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarBebida = con.prepareCall("{CALL eliminar_bebida(?)}");
            eliminarBebida.setInt(1, id);
            eliminarBebida.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
