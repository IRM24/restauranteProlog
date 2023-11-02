package proyectolenguajesrestaurante.Menus;

// Se utiliza el patron de disenno Factory para crear objetos "Comida", segun el tipo
// especificado en este caso plato o combo. Permite encapsular la logica de la creacion
// del objeto y la logica de uso 

public class FactoryComida {
    public static Comida crearComida(String type, int id, String nombre, String proteina, String acompannamiento1, String acompannamiento2, String acompannamiento3, int calorias, int precio, String bebida, String postre) {
        if (type.equalsIgnoreCase("plato")) {
            return new Plato(id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio);
        
        } else if (type.equalsIgnoreCase("combo")) {
            return new Combo(id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio, bebida, postre);
        
        } else {
            throw new IllegalArgumentException("Tipo de plato no válido");
        }
    }
}
