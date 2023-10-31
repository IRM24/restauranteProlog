/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectolenguajesrestaurante.Menus;

import java.util.List;

/**
 *
 * @author camiu
 */

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

