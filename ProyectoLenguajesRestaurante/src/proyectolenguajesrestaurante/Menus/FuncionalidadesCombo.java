package proyectolenguajesrestaurante.Menus;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import proyectolenguajesrestaurante.CRUD.ConexionMySQL;

public class FuncionalidadesCombo {
    private final List<Combo> listaCombos;
    
    public FuncionalidadesCombo() {
        listaCombos = new ArrayList<>();
    }


public List<Combo> leerCombos() {
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

            Combo combo = new Combo(id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio);

            // Verificar el combo antes de agregarlo a la lista
            if (verifyCombo(combo.getId())) {
                listaCombos.add(combo);
            }
        }
    } catch (Exception e) {
        // Manejar la excepción apropiadamente
    }
    return listaCombos;
}


        public void imprimirCombos() {
            for (Combo combo : listaCombos) {
                System.out.println(combo);
            }
        }

        
        public List<Combo> filtrarCombosBajasCalorias() {
        List<Combo> combosBajasCalorias = new ArrayList<>();
        for (Combo combo : listaCombos) {
            if (combo.getCalorias() < 800) {
                combosBajasCalorias.add(combo);
            }
        }
        return combosBajasCalorias;
    }
        
    public boolean foodItemExists(String itemName, String tableName) {
        try (Connection con = ConexionMySQL.getConexion()) {
            String query = "SELECT COUNT(*) AS count FROM " + tableName + " WHERE nombre = ?";
            CallableStatement stmt = con.prepareCall(query);
            stmt.setString(1, itemName);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            int count = rs.getInt("count");
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Combo findComboById(int comboId) {
    Combo combo = null;
    
    try (Connection con = ConexionMySQL.getConexion()) {
        String query = "SELECT * FROM combo WHERE id = ?";
        CallableStatement stmt = con.prepareCall(query);
        stmt.setInt(1, comboId);
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

            combo = new Combo(id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return combo;
}
    
    public boolean verifyCombo(int comboId) {
    Combo combo = findComboById(comboId);

    if (combo == null) {
        // El combo no se encontró en la base de datos.
        return false;
    }

    // Verificar la existencia de proteína
    if (!foodItemExists(combo.getProteina(), "proteina")) {
        return false;
    }

    // Verificar la existencia de acompañamientos
    if (!foodItemExists(combo.getAcompannamiento1(), "acompannamiento") ||
        !foodItemExists(combo.getAcompannamiento2(), "acompannamiento") ||
        !foodItemExists(combo.getAcompannamiento3(), "acompannamiento")) {
        return false;
    }

    // Verificar la existencia de bebida
    if (!foodItemExists(combo.getBebida(), "bebida")) {
        return false;
    }

    // Verificar la existencia de postre
    if (!foodItemExists(combo.getPostre(), "postre")) {
        return false;
    }

    // Si todos los alimentos existen y el combo se encontró en la base de datos, es válido.
    return true;
}
}
