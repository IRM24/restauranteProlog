package proyectolenguajesrestaurante.Menus;

// Clase Plato extiene de Comida y permite crear nuevos platos con los atributos heredados
public class Plato extends Comida{

    public Plato(int id, String nombre, String proteina, String acompannamiento1, String acompannamiento2, String acompannamiento3, int calorias, int precio) {
        super(id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio);
    }
    
    public Plato() {
        super(0, "", "", "", "", "", 0, 0); // Valores predeterminados para los campos
    }

    // Método toString para mostrar la información del plato
    @Override
    public String toString() {
        return 
               "Nombre:'" + getNombre() + '\'' +
               ", "+getProteina() + '\'' +
               ", "+getAcompannamiento1() + '\'' +
               ", "+getAcompannamiento2() + '\'' +
               ", "+getAcompannamiento3() + '\'' +
               " Calorias:, "+getCalorias() +
               " Precio:, "+getPrecio();
   }

}
