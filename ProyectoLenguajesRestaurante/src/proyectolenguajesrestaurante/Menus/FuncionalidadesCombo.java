package proyectolenguajesrestaurante.Menus;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import proyectolenguajesrestaurante.CRUD.ConexionMySQL;

// Esta clase permite crear una lista de combos, obtener todos los combos desde la base
// de datos y la creacion de los filtros a utilizar por el cliente.

public class FuncionalidadesCombo {
    private final List<Comida> listaCombos;
    
    public FuncionalidadesCombo() {
        listaCombos = new ArrayList<>();
    }

    //Obtiene todos lo combos en la base de datos y si no estan en la lista los agrega
    public List<Comida> leerCombos() {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerCombos = con.prepareCall("{CALL leer_combos()}");
            ResultSet rs = leerCombos.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String proteina = rs.getString("proteina");
                String acompannamiento1 = rs.getString("acompannamiento1");
                String acompannamiento2 = rs.getString("acompannamiento2");
                String acompannamiento3 = rs.getString("acompannamiento3");
                String bebida = rs.getString("bebida");
                String postre = rs.getString("postre");
                int calorias = rs.getInt("calorias");
                int precio = rs.getInt("precio");

                Comida miComida = FactoryComida.crearComida("combo",id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio, bebida, postre);

                // Verificar el combo antes de agregarlo a la lista
                if (verificarCombo(miComida.getId())) {
                    listaCombos.add(miComida);
                }
            }
        } catch (Exception e) {
        }
        return listaCombos;
    }


    public void imprimirCombos() {
        for (Comida combo : listaCombos) {
            System.out.println(combo);
        }
    }

    // Funcion para filtrar los combos menores a 800 calorias  
    public List<Comida> filtrarCombosBajasCalorias() {
    List<Comida> combosBajasCalorias = new ArrayList<>();
    for (Comida combo : listaCombos) {
        if (combo.getCalorias() < 800) {
            combosBajasCalorias.add(combo);
        }
    }
    return combosBajasCalorias;
    }
    
    // Funcion para filtrar los combos menores a 8500
    public List<Comida> filtrarCombosPrecioBajo() {
    List<Comida> combosPrecioBajo = new ArrayList<>();
    for (Comida combo : listaCombos) {
        if (combo.getPrecio() < 8500) {
            combosPrecioBajo.add(combo);
        }
    }
    return combosPrecioBajo;
    }

    // Funcion para filtrar los combos que tengan ensalada
    public List<Comida> filtrarCombosConEnsalada() {
    List<Comida> combosFiltrados = new ArrayList<>();
    for (Comida combo : listaCombos) {
        if (combo.getAcompannamiento1().contains("Ensalada") ||
            combo.getAcompannamiento2().contains("Ensalada") ||
            combo.getAcompannamiento3().contains("Ensalada")) {
            combosFiltrados.add(combo);
        }
    }
    return combosFiltrados;
    }

    // Verificar si existe ese item, ya que en caso que se haya elimado no tener
    // combos con elementos que no existen
    public boolean existeItemComida(String nombreItem, String nombreTabla) {
        try (Connection con = ConexionMySQL.getConexion()) {
            String query = "SELECT COUNT(*) AS count FROM " + nombreTabla + " WHERE nombre = ?";
            CallableStatement stmt = con.prepareCall(query);
            stmt.setString(1, nombreItem);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            int count = rs.getInt("count");
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Encuentra el combo por el ID 
    public Comida encontrarComboPorId(int idCombo) {
        Comida combo = null;
        try (Connection con = ConexionMySQL.getConexion()) {
            String query = "SELECT * FROM combo WHERE id = ?";
            CallableStatement stmt = con.prepareCall(query);
            stmt.setInt(1, idCombo);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String proteina = rs.getString("proteina");
                String acompannamiento1 = rs.getString("acompannamiento1");
                String acompannamiento2 = rs.getString("acompannamiento2");
                String acompannamiento3 = rs.getString("acompannamiento3");
                String bebida = rs.getString("bebida");
                String postre = rs.getString("postre");
                int calorias = rs.getInt("calorias");
                int precio = rs.getInt("precio");

                combo = FactoryComida.crearComida("combo", id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio, bebida, postre);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return combo;
    }

        public boolean verificarCombo(int idCombo) {
        Comida combo = encontrarComboPorId(idCombo);

        if (combo == null) {
            // El combo no se encontró en la base de datos.
            return false;
        }

        // Verificar la existencia de proteína
        if (!existeItemComida(combo.getProteina(), "proteina")) {
            return false;
        }

        // Verificar la existencia de acompannamientos
        if (!existeItemComida(combo.getAcompannamiento1(), "acompannamiento") ||
            !existeItemComida(combo.getAcompannamiento2(), "acompannamiento") ||
            !existeItemComida(combo.getAcompannamiento3(), "acompannamiento")) {
            return false;
        }

        // Comprueba si combo es una instancia de la clase Combo
        if (combo instanceof Combo) {
            Combo comboEspecifico = (Combo) combo; // Conversión explícita a la subclase Combo
            // Verificar la existencia de bebida
            if (!existeItemComida(comboEspecifico.getBebida(), "bebida")) {
                return false;
            }
        }

        // Verificar la existencia de postre
        if (combo instanceof Combo) {
            Combo comboEspecifico = (Combo) combo; // Conversión explícita a la subclase Combo
            if (!existeItemComida(comboEspecifico.getPostre(), "postre")) {
                return false;
            }
        }
        // Si todos los alimentos existen y el combo se encontró en la base de datos, es válido.
        return true;
    }

}
