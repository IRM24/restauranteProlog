package proyectolenguajesrestaurante.Factura;

import java.util.List;
import java.util.ArrayList;

public class FacturaGrupalBuilder {
    private final List<String> items;
    
    public FacturaGrupalBuilder() {
        this.items = new ArrayList<>();
    }

    public FacturaGrupalBuilder addItem(String item) {
        items.add(item);
        return this;
    }

    public FacturaGrupal build() {
        return new FacturaGrupal(items);
    }
}
