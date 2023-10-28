package proyectolenguajesrestaurante.CRUD;

public class Postre {
    private String nombre;
    private String lacteo;
    private String frutas;
    private String desayuno;
    private String almuerzo;
    private String cena;
    private int calorias;
    private int precio;

    public Postre(String nombre, String lacteo, String frutas, String desayuno, String almuerzo, String cena, int calorias, int precio) {
        this.nombre = nombre;
        this.lacteo = lacteo;
        this.frutas = frutas;
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

    public String getLacteo() {
        return lacteo;
    }

    public void setLacteo(String lacteo) {
        this.lacteo = lacteo;
    }

    public String getFrutas() {
        return frutas;
    }

    public void setFrutas(String frutas) {
        this.frutas = frutas;
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


}
