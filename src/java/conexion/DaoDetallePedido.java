package conexion;

import java.util.List;

public class DaoDetallePedido {

    public static List listar() {
        String sql = "SELECT * FROM t_detalle_pedido ORDER BY Id_Pedido ASC";
        return Acceso.listar(sql);
    }

    public static List buscar(String numPed) {
        String sql = "SELECT * FROM t_detalle_pedido WHERE Id_Pedido = '" + numPed + "'";
        return Acceso.listar(sql);
    }

    public static String crear(String numPed, Object[] ldp) {
        String sql = "INSERT INTO t_detalle_pedido(Id_Pedido, Id_Prod, cantidad, sub_Total, igv, total) VALUES "
                + "('" + numPed + "',"
                + "'" + ldp[0] + "',"
                + "'" + ldp[4] + "',"
                + "'" + ldp[5] + "',"
                + "'" + ldp[6] + "',"
                + "'" + ldp[7] + "')";
        return Acceso.ejecutar(sql);
    }

    public static String eliminar(String numPed) {
        String sql = "DELETE FROM t_detalle_pedido WHERE Id_Pedido = '" + numPed + "'";
        return Acceso.ejecutar(sql);
    }
}
