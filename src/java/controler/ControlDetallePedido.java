package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import presentador.PresDetallePedido;
import servicio.ServicioDetallePedido;
import servicio.ServicioProducto;

@WebServlet(name = "ControlDetallePedido", urlPatterns = {"/ControlDetallePedido"})
public class ControlDetallePedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicioDetallePedido serv = (ServicioDetallePedido) request.getSession().getAttribute("serv");
        PresDetallePedido pres = (PresDetallePedido) request.getSession().getAttribute("pres");
        
        String op = request.getParameter("op");
        System.out.println("Mensaje de get srvlet doGet: " + op);

        switch (op) {
            case "ListarProductos":
                List lisPro = ServicioProducto.listarProducto();
                request.getSession().setAttribute("lisPro", lisPro);
                response.sendRedirect(request.getContextPath() + "/Pedidos/catalogoProductos.jsp");
                break;
            case "Quitar":
                String cod = request.getParameter("cod");
                serv.quitarLinea(cod);
                pres.setLis(serv.verDetallePedido());
                pres.setSubTot(serv.verSubTotal());
                pres.setIgv(serv.verIgv());
                pres.setTot(serv.verTotal());
                response.sendRedirect(request.getContextPath() + "/Pedidos/gestionPedido.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acc = request.getParameter("acc");
        System.out.println("Mensaje de get srvlet doGet: " + acc);

        ServicioDetallePedido serv = (ServicioDetallePedido) request.getSession().getAttribute("serv");
        PresDetallePedido pres = (PresDetallePedido) request.getSession().getAttribute("pres");

        if (acc.equals("Agregar Producto")) {
            String cod = request.getParameter("cod");
            String nom = request.getParameter("nom");
            String des = request.getParameter("des");
            String pre = request.getParameter("pre");
            String can = request.getParameter("can");

            serv.agregarLinea(cod, nom, des, pre, can);
            pres.setLis(serv.verDetallePedido());
            pres.setSubTot(serv.verSubTotal());
            pres.setIgv(serv.verIgv());
            pres.setTot(serv.verTotal());
        }
        if (acc.equals("Listar")) {
            pres = new PresDetallePedido();
            serv = new ServicioDetallePedido();
            serv.crearDetallePedido();
            request.getSession().setAttribute("pres", pres);
        }
        response.sendRedirect(request.getContextPath() + "/Pedidos/gestionPedido.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
