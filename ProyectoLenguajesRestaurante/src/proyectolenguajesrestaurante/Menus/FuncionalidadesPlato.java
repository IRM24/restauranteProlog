package proyectolenguajesrestaurante.Menus;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import proyectolenguajesrestaurante.CRUD.ConexionMySQL;

// Esta clase permite crear una lista de platos, obtener todos los platos desde la base
// de datos y la creacion de los filtros a utilizar por el cliente.

public class FuncionalidadesPlato {
    private final List<Comida> listaPlatos;
    
    public FuncionalidadesPlato() {
        listaPlatos = new ArrayList<>();
    }
    
    // Obtiene todos los datos de platos desde la base de datos
    public List<Comida> leerPlatos() {
        try (Connection con = ConexionMySQL.getConexion()) {
            CallableStatement leerPlatos = con.prepareCall("{CALL leer_platos()}");
            ResultSet rs = leerPlatos.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String proteina = rs.getString("proteina");
                String acompannamiento1 = rs.getString("acompannamiento1");
                String acompannamiento2 = rs.getString("acompannamiento2");
                String acompannamiento3 = rs.getString("acompannamiento3");
                int calorias = rs.getInt("calorias");
                int precio = rs.getInt("precio");

                Comida miComida = FactoryComida.crearComida("plato", id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio, null, null);

                 //Verificar el plato antes de agregarlo a la lista
                if (verificarPlato(miComida.getId())) {
                    listaPlatos.add(miComida);
                }
            }
        } catch (Exception e) {
            // Manejar la excepción apropiadamente
        }
        return listaPlatos;
    }
    
    public void imprimirPlatos() {
        for (Comida plato : listaPlatos) {
            System.out.println(plato);
        }
    }
    
    // Esta funcion filtra los platos con menos de 600 calorias
    public List<Comida> filtrarPlatosBajasCalorias() {
    List<Comida> platosBajasCalorias = new ArrayList<>();
        for (Comida plato : listaPlatos) {
            if (plato.getCalorias() < 600) {
                platosBajasCalorias.add(plato);
            }
        }
        return platosBajasCalorias;
    }
    
    // Esta funcion filtra los platos menores a 7000 colones
    public List<Comida> filtrarPlatosPrecioBajo() {
        List<Comida> platosPrecioBajo = new ArrayList<>();
        for (Comida plato : listaPlatos) {
            if (plato.getPrecio() < 7000) {
                platosPrecioBajo.add(plato);
            }
        }
        return platosPrecioBajo;
    }
    
    // Esta funcion filtra los platos que tengan pollo
    public List<Comida> filtrarPlatosConPollo() {
        List<Comida> platosFiltrados = new ArrayList<>();
        for (Comida plato : listaPlatos) {
            if (plato.getProteina().contains("Pollo")) {
                platosFiltrados.add(plato);
            }
        }
        return platosFiltrados;
    }
    
    // Esta funcion encuentra un plato por el ID
    public Plato encontrarPlatoPorId(int idPlato) {
        Plato plato = null;
        try (Connection con = ConexionMySQL.getConexion()) {
            String query = "SELECT * FROM plato WHERE id = ?";
            CallableStatement stmt = con.prepareCall(query);
            stmt.setInt(1, idPlato);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String proteina = rs.getString("proteina");
                String acompannamiento1 = rs.getString("acompannamiento1");
                String acompannamiento2 = rs.getString("acompannamiento2");
                String acompannamiento3 = rs.getString("acompannamiento3");
                int calorias = rs.getInt("calorias");
                int precio = rs.getInt("precio");

                plato = (Plato) FactoryComida.crearComida("plato", id, nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio, null, null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plato;
    }

    public boolean verificarPlato(int idPlato) {
        Comida plato = encontrarPlatoPorId(idPlato);

        if (plato == null) {
            // El plato no se encontró en la base de datos.
            return false;
        }

        // Verificar la existencia de proteína
        if (!existeItemComida(plato.getProteina(), "proteina")) {
            return false;
        }

        // Verificar la existencia de acompañamientos
        if (!existeItemComida(plato.getAcompannamiento1(), "acompannamiento") ||
            !existeItemComida(plato.getAcompannamiento2(), "acompannamiento") ||
            !existeItemComida(plato.getAcompannamiento3(), "acompannamiento")) {
            return false;
        }

        // Si todos los alimentos existen y el plato se encontró en la base de datos, es válido.
        return true;
    }

    // Verificar si existe ese item, ya que en caso que se haya elimado no tener
    // platos con elementos que no existen
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

    
}
