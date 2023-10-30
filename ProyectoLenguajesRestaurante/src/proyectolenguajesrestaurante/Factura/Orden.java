package proyectolenguajesrestaurante.Factura;

import java.util.Date;

public class Orden {
    private int id;
    private Date fecha;
    private String detalle;

    public Orden(int id, Date fecha, String detalle) {
        this.id = id;
        this.fecha = fecha;
        this.detalle = detalle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    @Override
    public String toString() {
        return "Orden{" +
                "id=" + id +
                ", fecha=" + fecha +
                ", detalle='" + detalle + '\'' +
                '}';
    }
}
