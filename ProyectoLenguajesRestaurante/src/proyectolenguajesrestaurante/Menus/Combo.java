package proyectolenguajesrestaurante.Menus;


public class Combo extends Comida{

    private  String bebida;
    private  String postre;
   
    

    public Combo(int id, String nombre, String proteina, String acompannamiento1, String acompannamiento2, String acompannamiento3, int calorias, int precio, String bebida, String postre) {
        super(id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio);
        this.bebida = bebida;
        this.postre = postre;
    } 
    
    public Combo() {
    super(0, "", "", "", "", "", 0, 0); // Valores predeterminados para los campos heredados
    this.bebida = "";
    this.postre = "";
}

    // Agrega los demás getters y setters para los otros campos
    // ...

    public String getBebida() {
        return bebida;
    }

    public void setBebida(String bebida) {
        this.bebida = bebida;
    }

    public String getPostre() {
        return postre;
    }

    public void setPostre(String postre) {
        this.postre = postre;
    }

       // Método toString para mostrar la información del combo
 
@Override
public String toString() {
    return "Combo{" +
            "id=" + getId() +
            ", nombre='" + getNombre() + '\'' +
            ", proteina='" + getProteina() + '\'' +
            ", acompannamiento1='" + getAcompannamiento1() + '\'' +
            ", acompannamiento2='" + getAcompannamiento2() + '\'' +
            ", acompannamiento3='" + getAcompannamiento3() + '\'' +
            ", calorias=" + getCalorias() +
            ", precio=" + getPrecio() +
            ", bebida='" + bebida + '\'' +
            ", postre='" + postre + '\'' +
            '}';
}
 
}
