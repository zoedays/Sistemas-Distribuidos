package conexion;

import entidad.Cliente;
import java.util.List;

public class DaoCliente {

    public static List listar() {
        String sql = "SELECT * FROM t_cliente ORDER BY Id_Cliente ASC";
        return Acceso.listar(sql);
    }

    public static String actualizar(Cliente cli) {
        String sql = "UPDATE t_cliente SET "
                + "Apellidos='" + cli.getApe() + "',"
                + "Nombres='" + cli.getNom() + "',"
                + "Direccion='" + cli.getDir() + "',"
                + "DNI='" + cli.getDni() + "',"
                + "Telefono='" + cli.getTel() + "',"
                + "Movil='" + cli.getCel() + "',"
                + "Estado='" + cli.getEst() + "' "
                + "WHERE Id_Cliente='" + cli.getCodCliente() + "'";
        return Acceso.ejecutar(sql);
    }

    public static Object[] buscar(String cod) {
        String sql = "SELECT * FROM t_cliente WHERE Id_Cliente = '" + cod + "'";
        return Acceso.buscar(sql);
    }

    public static String crear(Cliente cli) {
        String sql = "INSERT INTO t_cliente(Id_Cliente, Apellidos, Nombres, Direccion, DNI, Telefono, Movil, Estado) VALUES "
                + "('" + cli.getCodCliente() + "',"
                + "'" + cli.getApe() + "',"
                + "'" + cli.getNom() + "',"
                + "'" + cli.getDir() + "',"
                + "'" + cli.getDni() + "',"
                + "'" + cli.getTel() + "',"
                + "'" + cli.getCel() + "',"
                + "'1')";
        return Acceso.ejecutar(sql);
    }

    public static List ultCod() {
        String sql = "select max(Id_Cliente) Id_Cliente from t_cliente";
        return Acceso.listar(sql);
    }

    public static String eliminar(String cod) {
        String sql = "DELETE FROM t_cliente WHERE Id_Cliente = '" + cod + "'";
        return Acceso.ejecutar(sql);
    }
}
