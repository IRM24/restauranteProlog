package proyectolenguajesrestaurante.Menus;

import java.util.List;

// El patron de disenno Facade funciona como fachada que proporciona una interfaz unidifcada
// para acceder a las funcionalidades relacionadas a comida. Menu Facade encapsula la complejidad
// de las funciones para acceder a ellas por metodos mas sencillos

public class MenusFacade {
    private FuncionalidadesCombo funcionalidadesCombo;
    private FuncionalidadesPlato funcionalidadesPlato;
    private MenuSaludable menuSaludable;

    public MenusFacade() {
        this.funcionalidadesCombo = new FuncionalidadesCombo();
        this.funcionalidadesPlato = new FuncionalidadesPlato();
        this.menuSaludable = new MenuSaludable();
    }
    
    public List<Comida> generarMenuSaludable(){
        return menuSaludable.generarMenuSaludable();
    }

    public List<Comida> leerCombos() {
        return funcionalidadesCombo.leerCombos();
    }

    public List<Comida> leerPlatos() {
        return funcionalidadesPlato.leerPlatos();
    }
    public List<Comida> filtrarCombosBajasCalorias() {
        return funcionalidadesCombo.filtrarCombosBajasCalorias();
    }

    public List<Comida> filtrarCombosPrecioBajo() {
        return funcionalidadesCombo.filtrarCombosPrecioBajo();
    }

    public List<Comida> filtrarCombosConEnsalada() {
        return funcionalidadesCombo.filtrarCombosConEnsalada();
    }

    public List<Comida> filtrarPlatosPrecioBajo() {
        return funcionalidadesPlato.filtrarPlatosPrecioBajo();
    }

    public List<Comida> filtrarPlatosBajasCalorias() {
        return funcionalidadesPlato.filtrarPlatosBajasCalorias();
    }

    public List<Comida> filtrarPlatosConPollo() {
        return funcionalidadesPlato.filtrarPlatosConPollo();
    }
}

