<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Catalogo de Productos</title>
    </head>
    <body>
        <h1>Catalogo de productos</h1>
        <c:if test="${not empty sessionScope.lisPro}">
            <table>
                <tr>
                    <td align="center">Codigo</td>
                    <td align="center">Nombre</td>
                    <td align="center">Descripción</td>
                    <td align="center">Precio</td>
                    <td align="center">Cantidad</td>
                </tr>
                <c:forEach var="lisPro" items="${sessionScope.lisPro}">
                    <form action="${pageContext.request.contextPath}/ControlDetallePedido" method="POST">
                        <tr>
                            <td><input type="text" name="cod" size="5" value="${lisPro.codProducto}" readonly/></td>
                            <td><input type="text" name="nom" size="15" value="${lisPro.nom}" readonly/></td>
                            <td><input type="text" name="des" size="20" value="${lisPro.des}" readonly/></td>
                            <td><input type="text" name="pre" size="5" value="${lisPro.pre}" readonly/></td>
                            <td><input type="text" name="can" size="5" value="" required/></td>
                            <td><input type="submit" name="acc" value="Agregar Producto"/></td>
                        </tr>
                    </form>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${empty sessionScope.lisPro}">
            <p>No hay productos registrados.</p>
        </c:if>
        <br>
        <div><a href="${pageContext.request.contextPath}/Pedidos/gestionPedido.jsp">Cancelar</a></div>
    </body>
</html>
