package servicio;

import conexion.DaoCliente;
import conexion.DaoDetallePedido;
import conexion.DaoPedido;
import conexion.DaoProducto;
import conexion.DaoUsuario;
import entidad.Cliente;
import entidad.DetallePedido;
import entidad.Pedido;
import entidad.ResumenPedido;
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

public static ResumenPedido consultarPedido(String numPed) {
        
        Object[] ip = DaoPedido.buscar(numPed);
        Pedido ped = new Pedido(
                ip[0].toString(),
                ip[1].toString(),
                ip[2].toString(),
                ip[3].toString());
        
        Object[] ic = DaoCliente.buscar(ped.getCodCliente());
        Cliente cli = new Cliente(
                ic[0].toString(),
                ic[1].toString(),
                ic[2].toString(),
                ic[3].toString(),
                ic[4].toString(),
                ic[5].toString(),
                ic[6].toString());
        
        List detPed = new ArrayList();
        
        List detPet = DaoDetallePedido.listarBuscar(numPed);
        double tot = 0;
        double subTot = 0;
        double igv = 0;
        
        for (int i = 0; i < detPet.size(); i++) {
            Object[] lin = new Object[15];
            Object[] dp = (Object[]) detPet.get(i);
            Object[] ipr = DaoProducto.buscar(dp[1].toString());
            
            int pos = 0;
            for (int j = 1; j < dp.length; j++) {
                lin[pos] = dp[j];
                if (pos == 1) {
                    for (int k = 1; k < ipr.length - 1; k++) {
                        lin[pos] = ipr[k];
                        pos += 1;
                        if (pos == 4) {
                            lin[pos] = dp[j];
                            pos += 1;
                        }
                    }
                    pos -= 1;
                }
                pos += 1;
            }
            subTot += Double.parseDouble(lin[5].toString());
            igv += Double.parseDouble(lin[6].toString());
            tot += Double.parseDouble(lin[7].toString());
            
            lin[pos + 1] = subTot;
            lin[pos + 1] = igv;
            lin[pos + 1] = tot;
            
            detPed.add(lin);
        }

//        for (int i = 0; i < detPed.size()-3; i++) {
//            Object[] dp = (Object[]) detPed.get(i);
//            for (int j = 0; j < dp.length; j++) {
//                System.out.println(dp[j]);
//            }
//            System.out.println("lista dpdetallado: " + dp);
//        }
        for (int i = 0; i < detPed.size(); i++) {
            System.out.println("lista dp: " + detPed.get(i));
        }
        ResumenPedido resuPedido = new ResumenPedido(ped, cli, detPed, subTot, igv, tot);
        
        return resuPedido;
    }

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
