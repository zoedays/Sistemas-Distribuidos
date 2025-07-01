package servicio;

import conexion.DaoCliente;
import conexion.DaoDetallePedido;
import conexion.DaoPedido;
import conexion.DaoUsuario;
import entidad.DetallePedido;
import entidad.Pedido;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Utiles;

public class ServicioPedido {

    public static List listarPedido() {
        List lista = DaoPedido.listar();
        List detPed = DaoDetallePedido.listar();
        List listaClientes = DaoCliente.listar();
        List listadoPedidos = new ArrayList();
        
        List pedido = new ArrayList();
        for (int i = 0; i < lista.size(); i++) {
            Object[] c = (Object[]) lista.get(i);
            Pedido ped = new Pedido(
                    c[0].toString(),
                    c[1].toString(),
                    c[2].toString(),
                    c[3].toString());
            pedido.add(ped);
        }

        int tot = 0;

        String cliente;
        for (int i = 0; i < pedido.size(); i++) {
            Object[] lp = new Object[7];
            lp[0] = "";//numPed
            lp[1] = "";//nodCli
            lp[2] = "";//nomApe
            lp[3] = "";//fec
            lp[4] = 0;//subTot
            lp[5] = 0;//IGV
            lp[6] = 0;//tot
            Pedido ped = (Pedido) pedido.get(i);
            lp[0] = ped.getNumPedido();
            lp[1] = ped.getCodCliente();
            lp[3] = ped.getFec();
            for (int j = 0; j < detPed.size(); j++) {
                Object[] dt = (Object[]) detPed.get(j);
                if (lp[0].equals(dt[0])) {
                    lp[4] = Double.parseDouble(lp[4].toString()) + Double.parseDouble(dt[3].toString());
                    lp[5] = Double.parseDouble(lp[5].toString()) + Double.parseDouble(dt[4].toString());
                    lp[6] = Double.parseDouble(lp[6].toString()) + Double.parseDouble(dt[5].toString());

                }
            }

            for (int j = 0; j < listaClientes.size(); j++) {
                Object[] lc = (Object[]) listaClientes.get(j);
                if (lp[1].equals(lc[0])) {
                    lp[2] = lc[1].toString() + " " + lc[2].toString();
                }
            }
            listadoPedidos.add(lp);
        }
        for (int i = 0; i < listadoPedidos.size(); i++) {
            Object[] p = (Object[]) listadoPedidos.get(i);
            System.out.println("---- Pedido " + i + " ----");
            for (int j = 0; j < p.length; j++) {
                System.out.println("Campo[" + j + "]: " + p[j]);
            }
        }
        return listadoPedidos;
    }

//    public static Pedido consultarPedido(String numPed) {
//        Object[] ped = DaoPedido.buscar(numPed);
//        List detPed = DaoDetallePedido.buscar(numPed);
//        Pedido pedido = new Pedido(
//                ped[0].toString(),
//                ped[1].toString(),
//                ped[2].toString(),
//                ped[3].toString(),
//                detPed
//        );
//        return DaoPedido.buscar();
//    }

    public static String crearPedido(String usnUsu, String codCli, String fec, List lisDetPed) {
        String msg = null;
        String numPedido = nuevoNumPedido();
        Object[] codUsu = DaoUsuario.buscarUsn(usnUsu);
        Pedido ped = new Pedido(numPedido, codUsu[0].toString(), codCli, fec);
        String msgPed = DaoPedido.crear(ped);
        if (msgPed == null) {
            msgPed = "1";
        }

        List lisMsgDetPed = new ArrayList();
        String msgDetPed;
        for (int i = 0; i < lisDetPed.size(); i++) {
            Object[] linDetPed = (Object[]) lisDetPed.get(i);

            lisMsgDetPed.add(DaoDetallePedido.crear(numPedido, linDetPed));
        }
        boolean valMsgDetPed = lisMsgDetPed.stream().allMatch(obj -> obj == null);
        if (valMsgDetPed) {
            msgDetPed = "1";
        } else {
            msgDetPed = null;
        }

        if (msgDetPed == msgPed) {
            msg = "1";
        }
        return msg;
    }

    public static String eliminarPedido(String numPed) {
        String msg = DaoPedido.eliminar(numPed);
        if (msg == null) {
            msg = "1";
        }
        return null;
    }

    public static String nuevoNumPedido() {
        List ultNumPed = DaoPedido.ultCod();
        Object[] ultCodPed = null;
        for (int i = 0; i < ultNumPed.size(); i++) {
            ultCodPed = (Object[]) ultNumPed.get(i);
        }
        String numPedido = Utiles.newCod(ultCodPed[0].toString());
        return numPedido;
    }
}
