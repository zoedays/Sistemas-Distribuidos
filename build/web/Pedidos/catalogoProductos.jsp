<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Productos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom right, #f0f7ff, #e4efff);
            font-family: 'Segoe UI', sans-serif;
            padding: 30px;
        }

        .catalogo-container {
            max-width: 1100px;
            background: #ffffff;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.15);
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            color: #003366;
            font-size: 36px;
            margin-bottom: 30px;
            position: relative;
        }

        h1::after {
            content: "";
            width: 120px;
            height: 3px;
            background: #007bff;
            position: absolute;
            left: 50%;
            bottom: -12px;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
            margin-bottom: 30px;
        }

        table th {
            background: linear-gradient(to right, #007bff, #3399ff);
            color: #ffffff;
            padding: 14px 10px;
            border: none;
            border-radius: 8px 8px 0 0;
            text-align: center;
            font-size: 16px;
        }

        table td {
            background: #f5faff;
            padding: 12px 10px;
            border: 1px solid #d0e7ff;
            text-align: center;
            vertical-align: middle;
            border-radius: 8px;
        }

        table input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #c7e0f8;
            border-radius: 6px;
            background: #f0f8ff;
            font-size: 14px;
        }

        input[readonly] {
            background-color: #eaf4ff;
        }

        .btn {
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-secondary {
            background-color: #007bff;
            color: #fff;
            padding: 6px 14px;
        }

        .btn-secondary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-danger {
            background-color: #d63031;
            color: #fff;
            padding: 8px 20px;
        }

        .btn-danger:hover {
            background-color: #b71c1c;
            transform: scale(1.05);
        }

        p {
            text-align: center;
            font-size: 17px;
            color: #555;
        }

        .text-center {
            text-align: center;
        }

        a {
            text-decoration: none;
        }

        /* botón sin sobrepuesto */
        .btn-no-overlay {
            background-color: transparent;
            border: none;
            color: #003366;
            font-weight: 500;
            padding: 5px 10px;
            transition: all 0.3s ease;
        }

        .btn-no-overlay:hover {
            color: #0056b3;
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="catalogo-container">
    <h1>Catálogo de Productos</h1>

    <c:if test="${not empty sessionScope.lisPro}">
        <table>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th></th>
            </tr>
            <c:forEach var="lisPro" items="${sessionScope.lisPro}">
                <form action="${pageContext.request.contextPath}/ControlDetallePedido" method="POST">
                    <tr>
                        <td><input type="text" name="cod" value="${lisPro.codProducto}" readonly/></td>
                        <td><input type="text" name="nom" value="${lisPro.nom}" readonly/></td>
                        <td><input type="text" name="des" value="${lisPro.des}" readonly/></td>
                        <td><input type="text" name="pre" value="${lisPro.pre}" readonly/></td>
                        <td><input type="text" name="can" value="" required/></td>
                        <td><input type="submit" class="btn btn-secondary" name="acc" value="Agregar Producto"/></td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty sessionScope.lisPro}">
        <p>No hay productos registrados.</p>
    </c:if>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/Pedidos/gestionPedido.jsp" class="btn btn-danger">Cancelar</a>
    </div>
</div>
</body>
</html>
