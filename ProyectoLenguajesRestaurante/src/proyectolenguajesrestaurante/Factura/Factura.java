package proyectolenguajesrestaurante.Factura;

import java.time.LocalDate;

// Esta clase permite crear nuevas facturas

public class Factura {
    
    private LocalDate fecha;
    private double montoTotal;

    public Factura(LocalDate fecha, double montoTotal) {
        this.fecha = LocalDate.now();
        this.montoTotal = montoTotal;

    }

    
     public Factura() {
       this.fecha = LocalDate.now();
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }


    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }


    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Factura:\n");
        stringBuilder.append("Fecha: ").append(fecha).append("\n");
     
        stringBuilder.append("Monto total: ").append(montoTotal).append("\n");
        return stringBuilder.toString();
    }
}
