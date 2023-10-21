package proyectolenguajesrestaurante.CRUD;

import java.sql.*;

public class PostresCRUD {

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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

                // Imprimir los valores de las columnas
                System.out.println("ID: " + id + ", Nombre: " + nombre + ", Lácteo: " + lacteo +
                        ", Frutas: " + frutas + ", Desayuno: " + desayuno + ", Almuerzo: " + almuerzo +
                        ", Cena: " + cena + ", Calorías: " + calorias + ", Precio: " + precio);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizarPostre(int id, int precio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement actualizarPostre = con.prepareCall("{CALL actualizar_postre(?, ?)}");
            actualizarPostre.setInt(1, id);
            actualizarPostre.setInt(2, precio);
            actualizarPostre.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarPostre(int id) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarPostre = con.prepareCall("{CALL eliminar_postre(?)}");
            eliminarPostre.setInt(1, id);
            eliminarPostre.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
