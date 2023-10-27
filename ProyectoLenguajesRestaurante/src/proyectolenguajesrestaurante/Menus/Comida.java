/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectolenguajesrestaurante.Menus;

/**
 *
 * @author camiu
 * Clase Super y para esto va a usar un factory
 */
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
     
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the proteina
     */
    public String getProteina() {
        return proteina;
    }

    /**
     * @param proteina the proteina to set
     */
    public void setProteina(String proteina) {
        this.proteina = proteina;
    }

    /**
     * @return the acompannamiento1
     */
    public String getAcompannamiento1() {
        return acompannamiento1;
    }

    /**
     * @param acompannamiento1 the acompannamiento1 to set
     */
    public void setAcompannamiento1(String acompannamiento1) {
        this.acompannamiento1 = acompannamiento1;
    }

    /**
     * @return the acompannamiento2
     */
    public String getAcompannamiento2() {
        return acompannamiento2;
    }

    /**
     * @param acompannamiento2 the acompannamiento2 to set
     */
    public void setAcompannamiento2(String acompannamiento2) {
        this.acompannamiento2 = acompannamiento2;
    }

    /**
     * @return the acompannamiento3
     */
    public String getAcompannamiento3() {
        return acompannamiento3;
    }

    /**
     * @param acompannamiento3 the acompannamiento3 to set
     */
    public void setAcompannamiento3(String acompannamiento3) {
        this.acompannamiento3 = acompannamiento3;
    }

    /**
     * @return the calorias
     */
    public int getCalorias() {
        return calorias;
    }

    /**
     * @param calorias the calorias to set
     */
    public void setCalorias(int calorias) {
        this.calorias = calorias;
    }

    /**
     * @return the precio
     */
    public int getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(int precio) {
        this.precio = precio;
    }
    
}
