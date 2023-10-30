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
    public Mesa(){
        this.numeroMesa = 0;
        this.cantidadPersonas = 0;
        this.nombreRepresentante = "";
        this.ocupada = false;
        this.unaSolaCuenta = false;
    
    }
    public int getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroMesa(int numeroMesa) {
        this.numeroMesa = numeroMesa;
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
    
    public String obtenerInfoMesa() {
        StringBuilder sb = new StringBuilder();
        sb.append("Número de mesa: ").append(numeroMesa).append("\n");
        sb.append("Cantidad de personas: ").append(cantidadPersonas).append("\n");
        sb.append("Nombre del representante: ").append(nombreRepresentante).append("\n");
        sb.append("¿Pagar en una sola cuenta? ").append(unaSolaCuenta ? "Sí" : "No").append("\n");
        sb.append("¿Mesa ocupada? ").append(ocupada ? "Sí" : "No").append("\n");
        return sb.toString();
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
