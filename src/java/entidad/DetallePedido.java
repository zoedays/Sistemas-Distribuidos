package entidad;

import java.util.ArrayList;
import java.util.List;

public class DetallePedido {

    private List detPed = new ArrayList();

    public void agregar(Object[] lin) {
        detPed.add(lin);
    }

    public void quitar(String cod) {
        for (int i = 0; i < detPed.size(); i++) {
            Object[] f = (Object[]) detPed.get(i);
            if (f[0].toString().equals(cod)) {
                detPed.remove(i);
            }
        }
    }

    public double getSubTotal() {
        double tot = 0;
        for (int i = 0; i < detPed.size(); i++) {
            Object[] f = (Object[]) detPed.get(i);
            tot += Double.parseDouble(f[5].toString());
        }
        return tot;
    }

    public double getIgv() {
        double tot = 0;
        for (int i = 0; i < detPed.size(); i++) {
            Object[] f = (Object[]) detPed.get(i);
            tot += Double.parseDouble(f[6].toString());
        }
        return tot;
    }

    public double getTotal() {
        double tot = 0;
        for (int i = 0; i < detPed.size(); i++) {
            Object[] f = (Object[]) detPed.get(i);
            tot += Double.parseDouble(f[7].toString());
        }
        return tot;
    }

    public List getDetPed() {
        return detPed;
    }

}
