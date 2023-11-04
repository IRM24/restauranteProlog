package proyectolenguajesrestaurante.CRUD;

import java.sql.*;

// En esta clase de java utilizando el mysql-connector-j-8.1.0.jar creamos una conexion
// a la base de datos 

public class ConexionMySQL {
    
    private static final String URL = "jdbc:mysql://localhost:3306/restaurante";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "My.SQL.24041507";

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // se crea la conexion
            con = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException | SQLException e) {
        }
        return con;
    }

    public static void cerrarConexion(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
            }
        }
    }
}
