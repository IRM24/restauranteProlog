package proyectolenguajesrestaurante.Factura;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import proyectolenguajesrestaurante.Menus.Comida;

public class Factura {
    
    private LocalDate fecha;
    private List<Comida> items;
    private double montoTotal;

    public Factura(LocalDate fecha, double montoTotal) {
        this.fecha = LocalDate.now();
        this.montoTotal = montoTotal;
        this.items = new ArrayList<Comida>();

    }
    
     public Factura() {
       this.fecha = LocalDate.now();
       this.items = new ArrayList<Comida>();
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public List<Comida> getItems() {
        return items;
    }

    public void setItems(List<Comida> items) {
        this.items = items;
    }

    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public void agregarItems(Comida comida){
        this.items.add(comida);
    }
   

    @Override
    public String toString() {
 StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Factura:\n");
        stringBuilder.append("Fecha: ").append(fecha).append("\n");
        stringBuilder.append("Items:\n");
        for (Comida item : items) {
            stringBuilder.append(item).append("\n");
        }
        stringBuilder.append("Monto total: ").append(montoTotal).append("\n");
        return stringBuilder.toString();
    }
}
