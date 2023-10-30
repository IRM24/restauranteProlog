package proyectolenguajesrestaurante.Factura;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import proyectolenguajesrestaurante.CRUD.ConexionMySQL;

public class OrdenCRUD {
    private List<Orden> listaOrdenes = new ArrayList<>();

    public void crearOrden(LocalDate fecha, String detalle) {
        String sql = "{CALL crear_orden(?, ?)}";

        try (Connection con = ConexionMySQL.getConexion();
             CallableStatement callableStatement = con.prepareCall(sql)) {

            callableStatement.setDate(1, java.sql.Date.valueOf(fecha));
            callableStatement.setString(2, detalle);
            callableStatement.execute();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void leerOrdenes() {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerOrden = con.prepareCall("{CALL leer_ordenes()}");
            ResultSet rs = leerOrden.executeQuery();
            while (rs.next()) {
                // Recupera más columnas según sea necesario
                int id = rs.getInt("id");
                Date fecha = rs.getDate("fecha");
                String detalle = rs.getString("detalle");

                // Verifica si ya existe una orden con el mismo id en la lista
                boolean existeOrden = false;
                for (Orden orden : listaOrdenes) {
                    if (orden.getId() == id) {
                        existeOrden = true;
                        break;
                    }
                }

                if (!existeOrden) {
                    Orden nuevaOrden = new Orden(id, fecha, detalle);
                    listaOrdenes.add(nuevaOrden);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void imprimirListaOrdenes() {
        for (Orden orden : listaOrdenes) {
            System.out.println(orden.toString());
        }
    }

    // Método para calcular el plato o combo más solicitado entre las fechas de inicio y fin
    public String calcularItemMasSolicitado(Date fechaInicio, Date fechaFin, String tipoDeItem) {
        Map<String, Long> contador = new HashMap<>();

        for (Orden orden : listaOrdenes) {
            if (orden.getFecha().after(fechaInicio) && orden.getFecha().before(fechaFin)) {
                if (orden.getDetalle().toLowerCase().contains(tipoDeItem.toLowerCase())) {
                    contador.put(orden.getDetalle(), contador.getOrDefault(orden.getDetalle(), 0L) + 1);
                }
            }
        }

        String itemMasSolicitado = "";
        long max = 0;
        for (Map.Entry<String, Long> entry : contador.entrySet()) {
            if (entry.getValue() > max) {
                max = entry.getValue();
                itemMasSolicitado = entry.getKey();
            }
        }

        return itemMasSolicitado;
    }
    
}
