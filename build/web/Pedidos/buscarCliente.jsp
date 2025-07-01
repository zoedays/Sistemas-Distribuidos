<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Buscar Cliente</title>
    <style>
        body {
            background: linear-gradient(135deg, #e6f0fa, #f9fcff);
            font-family: 'Segoe UI', sans-serif;
            padding: 30px;
        }

        .container-clientes {
            max-width: 1000px;
            background: #ffffff;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 8px 28px rgba(0,0,0,0.15);
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            color: #003366;
            font-size: 34px;
            margin-bottom: 25px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 12px 10px;
            border: 1px solid #d0e7ff;
            text-align: center;
            vertical-align: middle;
        }

        table th {
            background-color: #007bff;
            color: #ffffff;
        }

        table tr:nth-child(even) {
            background-color: #fdfdfe;
        }

        table tr:nth-child(odd) {
            background-color: #f9fcff;
        }

        table input[type="text"] {
            width: 100%;
            padding: 7px 10px;
            border: 1px solid #c7e0f8;
            border-radius: 8px;
            background: #f0f8ff;
        }

        input[readonly] {
            background-color: #eaf4ff;
        }

        .btn {
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-secondary {
            background-color: #007bff;
            border: none;
            padding: 5px 12px;
        }

        .btn-secondary:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        .btn-danger {
            background-color: #d63031;
            border: none;
        }

        .btn-danger:hover {
            background-color: #b71c1c;
        }

        p {
            text-align: center;
            font-size: 17px;
            color: #555;
        }

        a {
            text-decoration: none;
            font-weight: 500;
            color: #007bff;
            transition: all 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container-clientes">
    <h1>Seleccione un Cliente</h1>

    <c:if test="${not empty sessionScope.lista}">
        <table>
            <tr>
                <th>Código</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Dirección</th>
                <th>DNI</th>
                <th>Celular</th>
                <th></th>
            </tr>
            <c:forEach var="cliente" items="${sessionScope.lista}">
                <form action="${pageContext.request.contextPath}/ControlPedido" method="POST">
                    <tr>
                        <td><input type="text" name="cod" size="5" value="${cliente.codCliente}" readonly/></td>
                        <td><input type="text" name="nom" size="20" value="${cliente.nom}" readonly/></td>
                        <td><input type="text" name="ape" size="20" value="${cliente.ape}" readonly/></td>
                        <td><input type="text" name="dir" size="30" value="${cliente.dir}" readonly/></td>
                        <td><input type="text" name="dni" size="10" value="${cliente.dni}" readonly/></td>
                        <td><input type="text" name="cel" size="10" value="${cliente.cel}" readonly/></td>
                        <td>
                            <input type="submit" class="btn btn-secondary" name="acc" value="Agregar Cliente"/>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty sessionScope.lista}">
        <p>No hay clientes registrados.</p>
    </c:if>

    <div class="text-center mt-4">
    <a href="${pageContext.request.contextPath}/Pedidos/gestionPedido.jsp" class="btn btn-danger">← Regresar al pedido</a>
</div>

</div>
</body>
</html>
