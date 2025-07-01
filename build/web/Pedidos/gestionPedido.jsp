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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Registrar Pedido</title>
        <style>
            body {
                background: linear-gradient(135deg, #e6f0fa, #f9fcff);
                font-family: 'Segoe UI', sans-serif;
                padding: 30px;
            }

            .login-container {
                max-width: 1200px;
                background: #ffffff;
                border-radius: 18px;
                padding: 35px;
                box-shadow: 0 8px 28px rgba(0,0,0,0.15);
                margin: 0 auto;
            }

            h1 {
                text-align: center;
                color: #003366;
                font-size: 36px;
                margin-bottom: 30px;
                border-bottom: 2px solid #007bff;
                padding-bottom: 10px;
            }

            h3 {
                color: #0056b3;
                margin-top: 30px;
                border-bottom: 1px solid #b6d4fe;
                padding-bottom: 8px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 25px;
            }

            table td {
                padding: 12px 10px;
                border: 1px solid #d0e7ff;
                vertical-align: middle;
            }

            table input[type="text"], table input[type="date"] {
                width: 100%;
                padding: 8px 10px;
                border: 1px solid #c7e0f8;
                border-radius: 8px;
                background: #f0f8ff;
            }

            input[readonly] {
                background-color: #eaf4ff;
            }

            table tr:nth-child(even) {
                background-color: #fdfdfe;
            }

            table tr:nth-child(odd) {
                background-color: #f9fcff;
            }

            .btn {
                border-radius: 10px;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .btn-dark {
                background-color: #003366;
                border: none;
            }

            .btn-dark:hover {
                background-color: #00264d;
                transform: scale(1.03);
            }

            .btn-secondary {
                background-color: #007bff;
                border: none;
            }

            .btn-secondary:hover {
                background-color: #0056b3;
                transform: scale(1.03);
            }

            .btn-success {
                background-color: #00b894;
                border: none;
            }

            .btn-success:hover {
                background-color: #00997a;
                transform: scale(1.03);
            }

            .btn-danger {
                background-color: #d63031;
                border: none;
            }

            .btn-danger:hover {
                background-color: #b71c1c;
                transform: scale(1.03);
            }

            .text-center {
                text-align: center;
            }

            .mt-4 {
                margin-top: 1.5rem;
            }

            p {
                text-align: center;
                font-size: 17px;
                color: #555;
            }

            /* Para eliminar sobrepuesto azul de cualquier botón tipo "Mi Perfil" */
            .btn-outline-primary {
                background-color: transparent;
                color: #003366;
                border: 1px solid #003366;
            }

            .btn-outline-primary:hover {
                background-color: #003366;
                color: #fff;
            }

            .table-total {
                background-color: #d0e7ff;
                font-weight: bold;
            }

            a, button {
                transition: all 0.3s ease;
            }
        </style>
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
                        <td><!--<button type="submit" class="btn btn-secondary py-0 mt-2" name="acc" value="BuscarPedido">Buscar</button>--></td>
                        <td>Fecha: </td>
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

                <h3>Detalles del pedido</h3>

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
                                <td><input type="text" size="5" value="${p[0]}" readonly/></td>
                                <td><input type="text" size="15" value="${p[1]}" readonly/></td>
                                <td><input type="text" size="20" value="${p[2]}" readonly/></td>
                                <td><input type="text" size="5" value="${p[3]}" readonly/></td>
                                <td><input type="text" size="5" value="${p[4]}" readonly/></td>
                                <td><input type="text" size="5" value="${p[5]}" readonly/></td>
                                <td><input type="text" size="5" value="${p[6]}" readonly/></td>
                                <td><input type="text" size="5" value="${p[7]}" readonly/></td>
                                <c:url var="urlQuitar" value="/ControlDetallePedido"><c:param name="op" value="Quitar"/><c:param name="cod" value="${p[0]}"/></c:url>
                                <td><a class="btn btn-secondary py-0" href="${urlQuitar}">Quitar</a></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="8" align="right" class="table-total">Sub Total: <input type="text" size="5" value="${pres.subTot}" readonly/></td> 
                        </tr>
                        <tr>
                            <td colspan="8" align="right" class="table-total">IGV 18%: <input type="text" size="5" value="${pres.igv}" readonly/></td> 
                        </tr>
                        <tr>
                            <td colspan="8" align="right" class="table-total">Total: <input type="text" size="5" value="${pres.tot}" readonly/></td> 
                        </tr>
                        <tr>
                            <td colspan="8" align="center"><input class="btn btn-success" type="submit" name="acc" value="Crear Pedido"/></td> 
                        </tr>
                    </table>
                </c:if>

                <c:if test="${pre.tot=='0.00' or pres.tot==''}">
                    <p>Añada productos al pedido para empezar.</p>
                </c:if>
            </form>

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
        </div>
    </body>
</html>
