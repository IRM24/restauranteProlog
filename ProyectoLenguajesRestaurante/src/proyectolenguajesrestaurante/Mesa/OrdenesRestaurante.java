package proyectolenguajesrestaurante.Mesa;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class OrdenesRestaurante {
    public void gestionarOrdenes() {
        List<Mesa> mesas = new ArrayList<>();
        // Crear 6 mesas de ejemplo
        for (int i = 1; i <= 6; i++) {
            mesas.add(new Mesa(i, 0, "", false)); // Se inicializa sin ninguna persona ni representante
        }

        Scanner scanner = new Scanner(System.in);

        System.out.println("Bienvenido al sistema de gestión de órdenes del restaurante.");

        int numeroMesa;
        do {
            System.out.print("Por favor, seleccione el número de mesa (1-6): ");
            numeroMesa = scanner.nextInt();
            if (numeroMesa < 1 || numeroMesa > 6) {
                System.out.println("El número de mesa seleccionado no es válido. Inténtelo de nuevo.");
            } else if (mesas.get(numeroMesa - 1).estaOcupada()) {
                System.out.println("La mesa " + numeroMesa + " está ocupada en este momento. Por favor, seleccione otra mesa.");
            }
        } while (numeroMesa < 1 || numeroMesa > 6 || mesas.get(numeroMesa - 1).estaOcupada());

        mesas.get(numeroMesa - 1).ocuparMesa();

        System.out.print("Ingrese la cantidad de personas en la mesa: ");
        int cantidadPersonas = scanner.nextInt();

        System.out.print("Ingrese el nombre del representante: ");
        scanner.nextLine(); // Limpiar el buffer
        String nombreRepresentante = scanner.nextLine();

        System.out.print("¿Desea pagar en una sola cuenta? (Si/No): ");
        boolean pagarJuntos = scanner.next().equalsIgnoreCase("Si");

        if (pagarJuntos) {
            System.out.println("La orden se pagará en conjunto.");
            mesas.get(numeroMesa - 1).setUnaSolaCuenta(true);
        } else {
            System.out.println("Se llevará un registro individual de la orden y el pago.");
            mesas.get(numeroMesa - 1).setUnaSolaCuenta(false);
        }
        
        mesas.get(numeroMesa - 1).setCantidadPersonas(cantidadPersonas);
        mesas.get(numeroMesa - 1).setNombreRepresentante(nombreRepresentante);

        System.out.println("Información de la mesa:");
        mesas.get(numeroMesa - 1).mostrarInfoMesa();
        
        scanner.close();

        // Simular el proceso de generar la factura y desocupar la mesa
        // aquí hay que hacer lo de los menús
        // (una vez que se haya completado el proceso de pago)
        // mesas.get(numeroMesa - 1).desocuparMesa();
        // System.out.println("La mesa " + numeroMesa + " ha sido desocupada.");
    }
}
