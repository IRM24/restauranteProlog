package proyectolenguajesrestaurante.CRUD;

// Clase Acompannamiento, se utiliza para crear nuevos acompannamientos

public class Acompannamiento {
    private String nombre;
    private String temperatura;
    private String carbohidratos;
    private String vegetales;
    private String desayuno;
    private String almuerzo;
    private String cena;
    private int calorias;
    private int precio;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(String temperatura) {
        this.temperatura = temperatura;
    }

    public String getCarbohidratos() {
        return carbohidratos;
    }

    public void setCarbohidratos(String carbohidratos) {
        this.carbohidratos = carbohidratos;
    }

    public String getVegetales() {
        return vegetales;
    }

    public void setVegetales(String vegetales) {
        this.vegetales = vegetales;
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
   

    public Acompannamiento(String nombre, String temperatura, String carbohidratos, String vegetales, String desayuno, String almuerzo, String cena, int calorias, int precio) {
        this.nombre = nombre;
        this.temperatura = temperatura;
        this.carbohidratos = carbohidratos;
        this.vegetales = vegetales;
        this.desayuno = desayuno;
        this.almuerzo = almuerzo;
        this.cena = cena;
        this.calorias = calorias;
        this.precio = precio;
    }

}
