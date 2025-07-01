package conexion;

import entidad.Pedido;
import java.util.List;

public class DaoPedido {

    public static List listar() {
        String sql = "SELECT * FROM t_pedido ORDER BY Id_Pedido ASC";
        return Acceso.listar(sql);
    }

    public static Object[] buscar(String numPed) {
        String sql = "SELECT * FROM t_pedido WHERE Id_Pedido = '" + numPed + "'";
        return Acceso.buscar(sql);
    }

    public static String crear(Pedido ped) {
        String sql = "INSERT INTO `t_pedido`(`Id_Pedido`, `Id_Usuario`, `Id_Cliente`, `Fecha`) VALUES "
                + "('" + ped.getNumPedido() + "',"
                + "'" + ped.getCodUsuario() + "',"
                + "'" + ped.getCodCliente() + "',"
                + "'" + ped.getFec() + "')";
        return Acceso.ejecutar(sql);
    }

    public static String eliminar(String numPed) {
        String sql = "DELETE FROM t_pedido WHERE Id_Pedido = '" + numPed + "'";
        return Acceso.ejecutar(sql);
    }

    public static List ultCod() {
        String sql = "SELECT MAX(Id_Pedido) Id_Pedido FROM t_pedido";
        return Acceso.listar(sql);
    }
}
