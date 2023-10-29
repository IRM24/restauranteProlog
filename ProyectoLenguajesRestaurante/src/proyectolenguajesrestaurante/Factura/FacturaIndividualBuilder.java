package proyectolenguajesrestaurante.Factura;

import java.util.List;
import java.util.ArrayList;

public class FacturaIndividualBuilder {
    private final List<String> items;

    public FacturaIndividualBuilder() {
        this.items = new ArrayList<>();
    }

    public FacturaIndividualBuilder addItem(String item) {
        items.add(item);
        return this;
    }

    public FacturaIndividual build() {
        return new FacturaIndividual(items);
    }
}
