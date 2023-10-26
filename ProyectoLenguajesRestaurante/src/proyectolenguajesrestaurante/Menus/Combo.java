package proyectolenguajesrestaurante.Menus;

import java.util.ArrayList;
import java.util.List;

public class Combo {
    private int id;
    private final String nombre;
    private final String proteina;
    private final String acompannamiento1;
    private final String acompannamiento2;
    private final String acompannamiento3;
    private final String bebida;
    private final String postre;
    private final int calorias;
    private final int precio;
    

    public Combo(int id, String nombre, String proteina, String acompannamiento1, String acompannamiento2,
                 String acompannamiento3, String bebida, String postre, int calorias, int precio) {
        this.id = id;
        this.nombre = nombre;
        this.proteina = proteina;
        this.acompannamiento1 = acompannamiento1;
        this.acompannamiento2 = acompannamiento2;
        this.acompannamiento3 = acompannamiento3;
        this.bebida = bebida;
        this.postre = postre;
        this.calorias = calorias;
        this.precio = precio;
    }

    // Getters y setters para cada campo
    // Ejemplo para id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Agrega los demás getters y setters para los otros campos
    // ...

    // Método toString para mostrar la información del combo
    @Override
    public String toString() {
        return "Combo{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", proteina='" + proteina + '\'' +
                ", acompannamiento1='" + acompannamiento1 + '\'' +
                ", acompannamiento2='" + acompannamiento2 + '\'' +
                ", acompannamiento3='" + acompannamiento3 + '\'' +
                ", bebida='" + bebida + '\'' +
                ", postre='" + postre + '\'' +
                ", calorias=" + calorias +
                ", precio=" + precio +
                '}';
    }

    public int getCalorias() {
        return this.calorias;
    }
    
    public String getNombre() {
        return nombre;
    }

    public String getProteina() {
        return proteina;
    }

    public String getAcompannamiento1() {
        return acompannamiento1;
    }

    public String getAcompannamiento2() {
        return acompannamiento2;
    }

    public String getAcompannamiento3() {
        return acompannamiento3;
    }

    public String getBebida() {
        return bebida;
    }

    public String getPostre() {
        return postre;
    }
}
