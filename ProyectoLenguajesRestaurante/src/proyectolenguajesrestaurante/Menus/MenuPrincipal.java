package proyectolenguajesrestaurante.Menus;

import java.util.List;
import java.util.Scanner;

public class MenuPrincipal {

    private final FuncionalidadesCombo funcionalidadesCombo;
    private final FuncionalidadesPlato funcionalidadesPlato;
    private final MenuSaludable menusaludable;

    public MenuPrincipal() {
        funcionalidadesCombo = new FuncionalidadesCombo();
        funcionalidadesPlato = new FuncionalidadesPlato();
        menusaludable = new MenuSaludable();
    }

    public void iniciar() {
        Scanner scanner = new Scanner(System.in);

        int opcion=0;

        System.out.println("Bienvenido al restaurante. Elija una opción:");
        System.out.println("1. Gestión de Combos");
        System.out.println("2. Gestión de Platos");
        System.out.println("3. Menú Saludable");
        System.out.println("0. Salir");

        opcion = scanner.nextInt();

        switch (opcion) {
            case 1:
                gestionarCombos();
                break;
            case 2:
                //gestionarPlatos();
                break;
            case 3:
                menuSaludable();
                break;
            case 0:
                System.out.println("Saliendo del programa...");
                break;
            default:
                System.out.println("Opción no válida. Inténtelo de nuevo.");
        }
        scanner.nextLine();

       // scanner.close();
    }


    private void gestionarCombos() {
        funcionalidadesCombo.leerCombos();
        Scanner scanner = new Scanner(System.in);
        int opcion;

        System.out.println("Seleccione una opción:");
        System.out.println("1. Mostrar todos los combos");
        System.out.println("2. Mostrar combos de bajas calorías");
        System.out.println("3. Mostrar combos a bajo precio");
        System.out.println("4. Mostrar combos con ensalada");
        System.out.println("0. Volver al menú principal");

        opcion = scanner.nextInt();

        switch (opcion) {
            case 1:
                System.out.println("Todos los combos:");
                funcionalidadesCombo.imprimirCombos();
                break;
            case 2:
                System.out.println("Combos con bajas calorías:");
                List<Comida> combosBajasCalorias = funcionalidadesCombo.filtrarCombosBajasCalorias();
                for (Comida combo : combosBajasCalorias) {
                    System.out.println(combo);
                }
                break;
            case 3:
                System.out.println("Combos a bajo precio:");
                List<Comida> combosBajoPrecio = funcionalidadesCombo.filtrarCombosPrecioBajo();
                for (Comida combo : combosBajoPrecio) {
                    System.out.println(combo);
                }
                break;
            case 4:
                System.out.println("Combos con ensalada:");
                List<Comida> combosEnsalada = funcionalidadesCombo.filtrarCombosConEnsalada();
                for (Comida combo : combosEnsalada) {
                    System.out.println(combo);
                }
                break;
            case 0:
                System.out.println("Volviendo al menú principal...");
                break;
            default:
                System.out.println("Opción no válida. Inténtelo de nuevo.");
    }

    }

//private void gestionarPlatos() {
//    funcionalidadesPlato.leerPlatos();
//
//    Scanner scanner = new Scanner(System.in);
//    int opcion;
//
//    System.out.println("Seleccione una opción:");
//    System.out.println("1. Mostrar todos los platos");
//    System.out.println("2. Mostrar platos de bajas calorías");
//    System.out.println("3. Mostrar platos a bajo precio");
//    System.out.println("4. Mostrar platos con pollo");
//    System.out.println("0. Volver al menú principal");
//
//    opcion = scanner.nextInt();
//
//    switch (opcion) {
//        case 1:
//            System.out.println("Todos los platos:");
//            funcionalidadesPlato.imprimirPlatos();
//            break;
//        case 2:
//            System.out.println("Platos con bajas calorías:");
//            List<Plato> platosBajasCalorias = funcionalidadesPlato.filtrarPlatosBajasCalorias();
//            for (Plato plato : platosBajasCalorias) {
//                System.out.println(plato);
//            }
//            break;
//        case 3:
//            System.out.println("Platos a bajo precio:");
//            List<Plato> platosPrecioBajo = funcionalidadesPlato.filtrarPlatosPrecioBajo();
//            for (Plato plato : platosPrecioBajo) {
//                System.out.println(plato);
//            }
//            break;
//        case 4:
//            System.out.println("Platos con pollo:");
//            List<Plato> platosPollo = funcionalidadesPlato.filtrarPlatosConPollo();
//            for (Plato plato : platosPollo) {
//                System.out.println(plato);
//            }
//            break;
//        case 0:
//            System.out.println("Volviendo al menú principal...");
//            break;
//        default:
//            System.out.println("Opción no válida. Inténtelo de nuevo.");
//    }
//}


    private void menuSaludable() {
                menusaludable.generarMenuSaludable();
    }
}
