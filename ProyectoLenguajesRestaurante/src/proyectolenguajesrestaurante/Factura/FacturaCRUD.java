package proyectolenguajesrestaurante.Factura;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import proyectolenguajesrestaurante.CRUD.ConexionMySQL;

public class FacturaCRUD{
    private List<FacturaDate> listaFacturas = new ArrayList<>();


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
    
    public void leerFacturas() {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerFactura = con.prepareCall("{CALL leer_facturas()}");
            var rs = leerFactura.executeQuery();
            while (rs.next()) {
                // Recupera más columnas según sea necesario
                Date fecha = rs.getDate("fecha");
                double montoTotal = rs.getDouble("monto_total");

                // Verifica si ya existe una factura con la misma fecha y monto en la lista
                boolean existeFactura = false;
                for (FacturaDate factura : listaFacturas) {
                    if (factura.getFecha().equals(fecha) && factura.getMontoTotal() == montoTotal) {
                        existeFactura = true;
                        break;
                    }
            }

                if (!existeFactura) {
                    FacturaDate nuevaFactura = new FacturaDate(fecha, montoTotal);
                    listaFacturas.add(nuevaFactura);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void imprimirListaFacturas() {
        for (FacturaDate factura : listaFacturas) {
            System.out.println(factura.toString());
        }
    }
    
    public double calcularSumaTotalEnRango(Date fechaInicio, Date fechaFin) {
        double sumaTotal = 0;

        for (FacturaDate factura : listaFacturas) {
            Date fechaFactura = (Date) factura.getFecha();

            if (fechaFactura.compareTo(fechaInicio) >= 0 && fechaFactura.compareTo(fechaFin) <= 0) {
                sumaTotal += factura.getMontoTotal();
            }
        }

        return sumaTotal;
    }

    }





