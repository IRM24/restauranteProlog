package proyectolenguajesrestaurante.Mesa;

public class Mesa {
    private int numeroMesa;
    private int cantidadPersonas;
    private boolean ocupada;
    private String nombreRepresentante;
    private boolean unaSolaCuenta;

    public Mesa(int numeroMesa, int cantidadPersonas, String nombreRepresentante, boolean unaSolaCuenta) {
        this.numeroMesa = numeroMesa;
        this.cantidadPersonas = cantidadPersonas;
        this.nombreRepresentante = nombreRepresentante;
        this.unaSolaCuenta = unaSolaCuenta;
        this.ocupada = false;
    }

    public int getNumeroMesa() {
        return numeroMesa;
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public String getNombreRepresentante() {
        return nombreRepresentante;
    }

    public boolean getUnaSolaCuenta() {
        return unaSolaCuenta;
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

    public void mostrarInfoMesa() {
        System.out.println("Información de la mesa:");
        System.out.println("Número de mesa: " + numeroMesa);
        System.out.println("Cantidad de personas: " + cantidadPersonas);
        System.out.println("Nombre del representante: " + nombreRepresentante);
        System.out.println("¿Pagar en una sola cuenta? " + (unaSolaCuenta ? "Sí" : "No"));
        System.out.println("¿Mesa ocupada? " + (ocupada ? "Sí" : "No"));
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public void setNombreRepresentante(String nombreRepresentante) {
        this.nombreRepresentante = nombreRepresentante;
    }

    public void setUnaSolaCuenta(boolean unaSolaCuenta) {
        this.unaSolaCuenta = unaSolaCuenta;
    }
}
