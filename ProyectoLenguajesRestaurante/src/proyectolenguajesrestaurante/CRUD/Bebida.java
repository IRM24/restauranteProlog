package proyectolenguajesrestaurante.CRUD;

import java.util.List;

public class Bebida {
    private String nombre;
    private String carbonatadas;
    private String naturales;
    private String temperatura;
    private String desayuno;
    private String almuerzo;
    private String cena;
    private int calorias;
    private int precio;

    
    public Bebida(String nombre, String carbonatadas, String naturales, String temperatura, String desayuno, String almuerzo, String cena, int calorias, int precio) {
        this.nombre = nombre;
        this.carbonatadas = carbonatadas;
        this.naturales = naturales;
        this.temperatura = temperatura;
        this.desayuno = desayuno;
        this.almuerzo = almuerzo;
        this.cena = cena;
        this.calorias = calorias;
        this.precio = precio;
    }
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCarbonatadas() {
        return carbonatadas;
    }

    public void setCarbonatadas(String carbonatadas) {
        this.carbonatadas = carbonatadas;
    }

    public String getNaturales() {
        return naturales;
    }

    public void setNaturales(String naturales) {
        this.naturales = naturales;
    }

    public String getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(String temperatura) {
        this.temperatura = temperatura;
    }

    public String getDesayuno() {
        return desayuno;
    }

    public void setDesayuno(String desayuno) {
        this.desayuno = desayuno;
    }

    public String getAlmuerzo() {
        return almuerzo;
    }

    public void setAlmuerzo(String almuerzo) {
        this.almuerzo = almuerzo;
    }

    public String getCena() {
        return cena;
    }

    public void setCena(String cena) {
        this.cena = cena;
    }

    public int getCalorias() {
        return calorias;
    }

    public void setCalorias(int calorias) {
        this.calorias = calorias;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }



   

    // Agrega getters y setters según sea necesario
}

