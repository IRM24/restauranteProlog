package proyectolenguajesrestaurante.CRUD;

import java.sql.*;

public class ProteinasCRUD {

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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

                // Imprimir los valores de las columnas
                System.out.println("ID: " + id + ", Nombre: " + nombre + ", Tipo: " + tipo +
                        ", Desayuno: " + desayuno + ", Almuerzo: " + almuerzo + ", Cena: " + cena +
                        ", Calorías: " + calorias + ", Precio: " + precio);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizarProteina(int id, int precio) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement actualizarProteina = con.prepareCall("{CALL actualizar_proteina(?, ?)}");
            actualizarProteina.setInt(1, id);
            actualizarProteina.setInt(2, precio);
            actualizarProteina.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarProteina(int id) {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement eliminarProteina = con.prepareCall("{CALL eliminar_proteina(?)}");
            eliminarProteina.setInt(1, id);
            eliminarProteina.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
