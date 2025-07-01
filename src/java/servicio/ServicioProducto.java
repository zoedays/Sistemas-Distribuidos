
package servicio;

import conexion.DaoProducto;
import entidad.Producto;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Utiles;

public class ServicioProducto {
    public static List<Producto> listarProducto(){
        List lista = DaoProducto.listar();
        List productos = new ArrayList();
        for (int i = 0; i < lista.size(); i++) {
            Object[] p = (Object[]) lista.get(i);
            Producto pro = new Producto(
                    p[0].toString(),
                    p[1].toString(),
                    p[2].toString(),
                    Double.parseDouble(p[3].toString()),
                    (p[4] = "1".equals(p[4].toString()) ? "Activo" : "Inactivo").toString());
            productos.add(pro);
        }
        return productos;
    }
    
    public static String actualizarProducto(String codPro, String nom, String des, String pre, String est){
        Producto pro = new Producto(codPro, nom, des, Double.parseDouble(pre), est);
        String msg = DaoProducto.actualizar(pro);
        if (msg == null) {
            msg = "1";
        }
        return msg;
    }
    
    public static Producto consultarProducto(String codPro){
        Object[] p = DaoProducto.buscar(codPro);
        Producto pro;
        if (p != null) {
            pro = new Producto(
                    p[0].toString(), 
                    p[1].toString(), 
                    p[2].toString(), 
                    Double.parseDouble(p[3].toString()), 
                   (p[4] = "1".equals(p[4].toString()) ? "Activo" : "Inactivo").toString());
        } else {
            pro = null;
        }
        return pro;
    }
    
    public static String crearProducto(String nom, String des, String pre){
        List lista = DaoProducto.ultCod();
        Object[] ultCod = null;
        for (int i = 0; i < lista.size(); i++) {
            ultCod = (Object[]) lista.get(i);
        }
        System.out.println(ultCod[0].toString());
        String codProducto = Utiles.newCod(ultCod[0].toString());
        Producto pro = new Producto(codProducto, nom, des, Double.parseDouble(pre));
        String msg = DaoProducto.crear(pro);
        if (msg == null) {
            msg = "1";
        }
        return msg;
    }
    
    public static String eliminarProducto(String cod){
        String msg = DaoProducto.eliminar(cod);
        if (msg == null) {
            msg = "2";
        }
        return msg;
    }
}
