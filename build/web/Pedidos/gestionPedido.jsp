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
        <title>Registrar Pedido</title>
    </head>
    <body>
    <div class="login-container">
        <h1>Registrar nuevo Pedido</h1>
        <c:set var="c" value="${sessionScope.cliente}"/>
        <c:set var="np" value="${sessionScope.np}"/>
        <form action="${pageContext.request.contextPath}/ControlPedido" method="POST">
            <table>
                <tr>
                    <td>Nro. Pedido: </td>
                    <td><input type="text" name="numPed" value="${np}" required readonly></td>
                    <td><button type="submit" class="btn btn-secondary py-0 mt-2" name="acc" value="BuscarPedido">Buscar</button></td>
                    <td>fecha: </td>
                    <td><input type="date" name="fec" value="" required></td>
                </tr>
                <tr>
                    <td>Cod. Cliente: </td>
                    <td><input type="text" size="8" name="codCli" value="${c.codCliente}" required readonly></td>
                        <c:url var="urlListar" value="/ControlPedido"><c:param name="op" value="ListarClientes" /></c:url>
                    <td><a class="btn btn-secondary py-0" href="${urlListar}">Listar Clientes</a></td>
                    <td>Nombre del cliente: </td>
                    <td><input type="text" size="20" name="nomCli" value="${c.nom}" readonly></td>
                    <td>DNI/RUC: </td>
                    <td><input type="text" size="10" name="dni" value="${c.dni}" readonly></td>
                </tr>
                <tr>
                    <td>Dirección: </td>
                    <td><input type="text" size="20" name="dir" value="${c.dir}" readonly></td>
                    <td>Celular: </td>
                    <td><input type="text" size="10" name="cel" value="${c.cel}" readonly></td>
                </tr>
            </table>
            <br>
            <h3>Detalles del pedido</h3>
            <br>
            <c:url var="urlListar" value="/ControlDetallePedido"><c:param name="op" value="ListarProductos"/></c:url>
            <p><a class="btn btn-dark py-0" href="${urlListar}">Listar Productos</a></p>
            <c:if test="${not empty sessionScope.pres and pres.tot!='' and pres.tot!='0.00'}">
                <c:set var="lis" value="${pres.lis}"/>
                <table>
                    <tr>
                        <td align="center">Codigo</td>
                        <td align="center">Nombre</td>
                        <td align="center">Descripción</td>
                        <td align="center">Precio</td>
                        <td align="center">Cantidad</td>
                        <td align="center">Sub Total</td>
                        <td align="center">IGV</td>
                        <td align="center">Total</td>
                    </tr>
                    <c:forEach var="producto" items="${lis}">
                        <c:set var="p" value="${producto}"/>
                        <tr>
                            <td><input type="text" name="cod" size="5" value="${p[0]}" readonly/></td>
                            <td><input type="text" size="15" value="${p[1]}" readonly/></td>
                            <td><input type="text" size="20" value="${p[2]}" readonly/></td>
                            <td><input type="text" size="5" value="${p[3]}" readonly/></td>
                            <td><input type="text" size="5" value="${p[4]}" readonly/></td>
                            <td><input type="text" size="5" value="${p[5]}" readonly/></td>
                            <td><input type="text" size="5" value="${p[6]}" readonly/></td>
                            <td><input type="text" size="5" value="${p[7]}" readonly/></td>
                                <c:url var="urlQuitar" value="/ControlDetallePedido"><c:param name="op" value="Quitar" /><c:param name="cod" value="${p[0]}"/></c:url>
                            <td><a class="btn btn-secondary py-0" href="${urlQuitar}">Quitar Producto</a></td>
                        <tr>
                        </c:forEach>
                        <td colspan="8" align="right">Sub Total: <input type="text" size="5" value="${pres.subTot}" readonly/></td> 
                    </tr>
                    <tr>
                        <td colspan="8" align="right">IGV 18%: <input type="text" size="5" value="${pres.igv}" readonly/></td> 
                    </tr>
                    <tr>
                        <td colspan="8" align="right">Total: <input type="text" size="5" value="${pres.tot}" readonly/></td> 
                    </tr>
                    <tr>
                        <td colspan="8" align="center"><input class="btn btn-success" type="submit" name="acc" value="Crear Pedido"/></td> 
                    </tr>
                </c:if>
            </table>
            <c:if test="${pre.tot=='0.00' or pres.tot==''}">
                <p>Añada productos al pedido para empezar.</p>
            </c:if>

        </form>
    </div>
    <c:if test="${param.msg == '1'}">
        <div class="text-center mt-4">Pedido creado con éxito: 
            <c:url var="urlListar" value="/ControlPedido"><c:param name="op" value="Listar"/></c:url>
            <a class="btn btn-secondary py-0" href="${urlListar}">Ver listado</a>
        </div>
    </c:if>
    <br>
    <div>
        <c:url var="urlSalir" value="/ControlPedido"><c:param name="op" value="Salir" /></c:url>
        <a class="btn btn-danger py-0" href="${urlSalir}">Regresar al menú de pedidos</a>
    </div>

</body>
</html>
