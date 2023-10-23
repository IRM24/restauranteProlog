/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectolenguajesrestaurante.Mesa;

public class Mesa {
    private int numeroMesa;
    private int cantidadPersonas;
    private boolean ocupada;

    public Mesa(int numeroMesa, int cantidadPersonas) {
        this.numeroMesa = numeroMesa;
        this.cantidadPersonas = cantidadPersonas;
        this.ocupada = false;
    }

    public int getNumeroMesa() {
        return numeroMesa;
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public boolean estaOcupada() {
        return ocupada;
    }

    public void ocuparMesa() {
        this.ocupada = true;
    }

    public void desocuparMesa() {
        this.ocupada = false;
    }
}
