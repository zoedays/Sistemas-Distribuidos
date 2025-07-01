package controler;

import entidad.Cliente;
import entidad.DetallePedido;
import entidad.Pedido;
import entidad.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import presentador.PresDetallePedido;
import servicio.ServicioCliente;
import servicio.ServicioDetallePedido;
import servicio.ServicioPedido;
import servicio.ServicioProducto;

@WebServlet(name = "ControlPedido", urlPatterns = {"/ControlPedido"})
public class ControlPedido extends HttpServlet {

    private ServicioDetallePedido servDetPed;
    private ServicioCliente servCli;
    private PresDetallePedido pres;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        System.out.println("Mensaje de get srvlet doGet: " + op);

        switch (op) {
            case "ListarPedidos":
                List lisPedidos = ServicioPedido.listarPedido();
                request.getSession().setAttribute("lisPedidos", lisPedidos);
                response.sendRedirect(request.getContextPath() + "/Pedidos/listadoPedidos.jsp");
                break;
            case "ListarProductos":
                List lisPro = ServicioProducto.listarProducto();
                request.getSession().setAttribute("lisPro", lisPro);
                response.sendRedirect(request.getContextPath() + "/Pedidos/catalogoProductos.jsp");
                break;
            case "ListarClientes":
                List lista = ServicioCliente.listarCliente();
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect(request.getContextPath() + "/Pedidos/buscarCliente.jsp");
                break;
            case "Consultar":
//                String cod = request.getParameter("cod");
//                Pedido ped = ServicioPedido.consultarPedido(cod);
//                System.out.println(cli.toString());
//                request.getSession().setAttribute("cli", cli);
//                response.sendRedirect(request.getContextPath() + "/Clientes/actualizarCliente.jsp");
                break;
            case "Nuevo":
                String np = ServicioPedido.nuevoNumPedido();
                System.out.println(np);
                pres = new PresDetallePedido();
                servDetPed = new ServicioDetallePedido();
                servDetPed.crearDetallePedido();
                request.getSession().removeAttribute("cliente");
                request.getSession().removeAttribute("nuevoPedido");
                request.getSession().setAttribute("pres", pres);
                request.getSession().setAttribute("serv", servDetPed);
                request.getSession().setAttribute("np", np);
                response.sendRedirect(request.getContextPath() + "/Pedidos/gestionPedido.jsp");
                break;
            case "Salir":
                request.getSession().removeAttribute("cliente");
                request.getSession().removeAttribute("nuevoPedido");
                request.getSession().removeAttribute("pres");
                request.getSession().removeAttribute("serv");
                response.sendRedirect(request.getContextPath() + "/Pedidos/menuPedidos.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acc = request.getParameter("acc");
        System.out.println("Mensaje de get srvlet doGet: " + acc);

        if (acc.equals("Agregar Cliente")) {
            String cod = request.getParameter("cod");
            Cliente cli = ServicioCliente.consultarCliente(cod);
            System.out.println(cli.toString());
            request.getSession().setAttribute("cliente", cli);
            response.sendRedirect(request.getContextPath() + "/Pedidos/gestionPedido.jsp");
        }
        if (acc.equals("Crear Pedido")) {
            Usuario usu = (Usuario) request.getSession().getAttribute("usuAut");

            List lisDetPed = (List) servDetPed.verDetallePedido();

            String codCli = request.getParameter("codCli");
            String fec = request.getParameter("fec");

            String msg = ServicioPedido.crearPedido(usu.getUsername(), codCli, fec, lisDetPed);
            response.sendRedirect(request.getContextPath() + "/Pedidos/gestionPedido.jsp?msg=" + msg + "");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
