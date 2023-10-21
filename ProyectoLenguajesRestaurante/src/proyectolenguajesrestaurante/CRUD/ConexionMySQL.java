/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectolenguajesrestaurante.CRUD;

import java.sql.*;

public class ConexionMySQL {
    public static void main(String[] args) {
        Connection con = null;
        try {
            // Paso 1: Cargar el controlador JDBC de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Paso 2: Establecer la conexión con la base de datos
            String url = "jdbc:mysql://localhost:3306/restaurante";
            String usuario = "root";
            String contraseña = "Coquito21";
            con = DriverManager.getConnection(url, usuario, contraseña);

            // Paso 3: Crear un objeto Statement o PreparedStatement
            Statement stmt = con.createStatement();

            // Paso 4: Ejecutar consultas SQL
            ResultSet rs = stmt.executeQuery("SELECT * FROM bebidas");

            // Paso 5: Procesar los resultados
            while (rs.next()) {
                // Aquí puedes obtener los valores de las columnas
                // Ejemplo: String columna1 = rs.getString("nombre_columna");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Paso 6: Cerrar la conexión a la base de datos
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

