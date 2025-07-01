package servicio;

import entidad.DetallePedido;
import java.util.List;

public class ServicioDetallePedido {

    private DetallePedido detPed;

    public void crearDetallePedido() {
        detPed = new DetallePedido();
    }

    public void agregarLinea(String codPro, String nom, String des, String pre, String can) {
        System.out.println(codPro + " " + nom + " " + des + " " + pre + " " + can);
        Object[] lin = new Object[8];
        lin[0] = codPro;
        lin[1] = nom;
        lin[2] = des;
        lin[3] = pre;
        lin[4] = can;
        lin[5] = String.format("%.2f", Double.parseDouble(pre) * Integer.parseInt(can));
        lin[6] = String.format("%.2f", Double.parseDouble(lin[5].toString()) * 0.18);
        lin[7] = String.format("%.2f", Double.parseDouble(lin[5].toString()) + Double.parseDouble(lin[6].toString()));
        detPed.agregar(lin);
    }

    public void quitarLinea(String codPro) {
        detPed.quitar(codPro);
    }

    public List verDetallePedido() {
        return detPed.getDetPed();
    }

    public String verSubTotal() {
        return String.valueOf(String.format("%.2f", detPed.getSubTotal()));
    }

    public String verIgv() {
        return String.valueOf(String.format("%.2f", detPed.getIgv()));
    }

    public String verTotal() {
        return String.valueOf(String.format("%.2f", detPed.getTotal()));
    }
}
