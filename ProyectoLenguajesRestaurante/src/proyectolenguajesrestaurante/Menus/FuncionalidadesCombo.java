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
                listaCombos.add(combo);
            }
        } catch (Exception e) {
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
        
}
