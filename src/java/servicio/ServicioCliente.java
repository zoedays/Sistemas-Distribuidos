package servicio;

import conexion.DaoCliente;
import entidad.Cliente;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Utiles;

public class ServicioCliente {

    public static List<Cliente> listarCliente() {
        List lista = DaoCliente.listar();
        List clientes = new ArrayList();
        for (int i = 0; i < lista.size(); i++) {
            Object[] c = (Object[]) lista.get(i);
            Cliente cli = new Cliente(
                    c[0].toString(),
                    c[1].toString(),
                    c[2].toString(),
                    c[3].toString(),
                    c[4].toString(),
                    c[5].toString(),
                    c[6].toString(),
                    (c[7] = "1".equals(c[7].toString()) ? "Activo" : "Inactivo").toString());
            clientes.add(cli);
        }
        return clientes;
    }

    public static String actualizarCliente(String codCli, String nom, String ape, String dir, String dni, String tel, String cel, String est) {
        Cliente cli = new Cliente(codCli, nom, ape, dir, dni, tel, cel, est);
        String msg = DaoCliente.actualizar(cli);
        if (msg == null) {
            msg = "1";
        }
        return msg;
    }

    public static Cliente consultarCliente(String codCli) {
        Object[] c = DaoCliente.buscar(codCli);
        Cliente cli;
        if (c != null) {
            cli = new Cliente(
                    c[0].toString(), 
                    c[1].toString(), 
                    c[2].toString(), 
                    c[3].toString(), 
                    c[4].toString(), 
                    c[5].toString(), 
                    c[6].toString(), 
                   (c[7] = "1".equals(c[7].toString()) ? "Activo" : "Inactivo").toString());
        } else {
            cli = null;
        }
        return cli;
    }

    public static String crearCliente(String nom, String ape, String dir, String dni, String tel, String cel) {
        List lista = DaoCliente.ultCod();
        Object[] ultCod = null;
        for (int i = 0; i < lista.size(); i++) {
            ultCod = (Object[]) lista.get(i);
        }
        System.out.println(ultCod[0].toString());
        String codCliente = Utiles.newCod(ultCod[0].toString());
        Cliente cli = new Cliente(codCliente, nom, ape, dir, dni, tel, cel);
        String msg = DaoCliente.crear(cli);
        if (msg == null) {
            msg = "1";
        }
        return msg;
    }

    public static String eliminarCliente(String cod) {
        String msg = DaoCliente.eliminar(cod);;
        if (msg == null) {
            msg = "2";
        }
        return msg;
    }
}
