package proyectolenguajesrestaurante.CRUD;

import java.sql.*;

public class AcompannamientosCRUD {

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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

                // Imprimir los valores de las columnas
                System.out.println("ID: " + id + ", Nombre: " + nombre + ", Temperatura: " + temperatura +
                        ", Carbohidratos: " + carbohidratos + ", Vegetales: " + vegetales +
                        ", Desayuno: " + desayuno + ", Almuerzo: " + almuerzo + ", Cena: " + cena +
                        ", Calorías: " + calorias + ", Precio: " + precio);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizarAcompannamiento(int id, int precio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement actualizarAcompannamiento = con.prepareCall("{CALL actualizar_acompannamiento(?, ?)}");
            actualizarAcompannamiento.setInt(1, id);
            actualizarAcompannamiento.setInt(2, precio);
            actualizarAcompannamiento.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarAcompannamiento(int id) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarAcompannamiento = con.prepareCall("{CALL eliminar_acompannamiento(?)}");
            eliminarAcompannamiento.setInt(1, id);
            eliminarAcompannamiento.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
