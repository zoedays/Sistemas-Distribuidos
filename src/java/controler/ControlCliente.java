
package controler;

import entidad.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicio.ServicioCliente;

@WebServlet(name = "ControlCliente", urlPatterns = {"/ControlCliente"})
public class ControlCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        System.out.println("Mensaje de get srvlet doGet: " + op);

        switch (op) {
            case "Listar":
                List lista = ServicioCliente.listarCliente();
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect(request.getContextPath() + "/Clientes/listadoClientes.jsp");
                break;
            case "Consultar":
                String cod = request.getParameter("cod");
                Cliente cli = ServicioCliente.consultarCliente(cod);
                System.out.println(cli.toString());
                request.getSession().setAttribute("cli", cli);
                response.sendRedirect(request.getContextPath() + "/Clientes/actualizarCliente.jsp");
                break;
            case "Nuevo":
                response.sendRedirect(request.getContextPath() + "/Clientes/registrarCliente.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("txtCod");
        String nom = request.getParameter("txtNom");
        String ape = request.getParameter("txtApe");
        String dir = request.getParameter("txtDir");
        String dni = request.getParameter("txtDni");
        String tel = request.getParameter("txtTel");
        String cel = request.getParameter("txtCel");
        String est = request.getParameter("selEst");

        String acc = request.getParameter("acc");
        String msg;
        List lista;
        System.out.println("Mensaje del servlet doPost acc: "+acc);
        switch (acc) {
            case "Crear":
                msg = ServicioCliente.crearCliente(nom, ape, dir, dni, tel, cel);
                response.sendRedirect(request.getContextPath() + "/Clientes/registrarCliente.jsp?msg=" + msg + "");
                break;
            case "Actualizar":
                msg = ServicioCliente.actualizarCliente(cod, nom, ape, dir, dni, tel, cel, est);
                request.getSession().setAttribute("cli", ServicioCliente.consultarCliente(cod));
                response.sendRedirect(request.getContextPath() + "/Clientes/actualizarCliente.jsp?msg=" + msg + "");
                break;
            case "Eliminar":
                msg = ServicioCliente.eliminarCliente(cod);
                lista = ServicioCliente.listarCliente();
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect(request.getContextPath() + "/Clientes/listadoClientes.jsp?msg=" + msg + "");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
