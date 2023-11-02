package proyectolenguajesrestaurante.Menus;

// Esta es una super clase de la cual van a heredar combo y comida
// contiene todos los atributos que ambos comparten

public class Comida {
    private int id;
    private  String nombre;
    private  String proteina;
    private  String acompannamiento1;
    private  String acompannamiento2;
    private  String acompannamiento3;
    private  int calorias;
    private  int precio;

     public Comida(int id, String nombre, String proteina, String acompannamiento1, String acompannamiento2, String acompannamiento3, int calorias, int precio) {
        this.id = id;
        this.nombre = nombre;
        this.proteina = proteina;
        this.acompannamiento1 = acompannamiento1;
        this.acompannamiento2 = acompannamiento2;
        this.acompannamiento3 = acompannamiento3;
        this.calorias = calorias;
        this.precio = precio;
    }
     
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProteina() {
        return proteina;
    }

    public void setProteina(String proteina) {
        this.proteina = proteina;
    }

    public String getAcompannamiento1() {
        return acompannamiento1;
    }

    public void setAcompannamiento1(String acompannamiento1) {
        this.acompannamiento1 = acompannamiento1;
    }

    public String getAcompannamiento2() {
        return acompannamiento2;
    }

    public void setAcompannamiento2(String acompannamiento2) {
        this.acompannamiento2 = acompannamiento2;
    }

    public String getAcompannamiento3() {
        return acompannamiento3;
    }

    public void setAcompannamiento3(String acompannamiento3) {
        this.acompannamiento3 = acompannamiento3;
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
