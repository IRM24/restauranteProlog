/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectolenguajesrestaurante.Factura;

import java.util.Date;

/**
 *
 * @author camiu
 */
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
