package proyectolenguajesrestaurante.Factura;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import proyectolenguajesrestaurante.CRUD.ConexionMySQL;

public class FacturaCRUD{

    public void crearFactura(LocalDate fecha, double montoTotal) {
        String sql = "{CALL crear_factura(?, ?)}";

        try (Connection con = ConexionMySQL.getConexion();
                CallableStatement cstmt = con.prepareCall(sql)) {

            cstmt.setDate(1, java.sql.Date.valueOf(fecha));
            cstmt.setDouble(2, montoTotal);
            cstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
