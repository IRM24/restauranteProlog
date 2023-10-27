/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectolenguajesrestaurante.Menus;

/**
 *
 * @author camiu
 */
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
