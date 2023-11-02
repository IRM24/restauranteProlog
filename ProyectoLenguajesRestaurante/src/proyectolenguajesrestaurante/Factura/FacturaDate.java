package proyectolenguajesrestaurante.Factura;

import java.util.Date;

// Esta clase se utiliza para poder crear las facturas que vienen desde la base de datos
public class FacturaDate {
    private Date fecha;
    private double montoTotal;

    public FacturaDate(Date fecha, double montoTotal) {
        this.fecha = fecha;
        this.montoTotal = montoTotal;
    }

    @Override
    public String toString() {
        return "FacturaDate{" + "fecha=" + fecha + ", montoTotal=" + montoTotal + '}';
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }
    
    
}
