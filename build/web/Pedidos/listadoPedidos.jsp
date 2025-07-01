<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Pedidos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Estilos Bootstrap + Fuentes -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Quicksand', sans-serif;
            background: url('https://www.transparenttextures.com/patterns/diagmonds-light.png'),
                        linear-gradient(to right, #e0f7fa, #b2ebf2);
            background-blend-mode: soft-light;
            min-height: 100vh;
        }

        .hero-header {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            padding: 40px 20px;
            text-align: center;
        }

        .content-box {
            background: #ffffffdd;
            margin: -30px auto 40px auto;
            padding: 2rem;
            max-width: 95%;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 8px;
            text-align: center;
            border: 1px solid #dee2e6;
        }

        .btn-back {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 20px;
            border-radius: 25px;
        }
    </style>

    <!-- JS para cerrar por inactividad -->
    <script>
        let inactividad = 5 * 60 * 1000; // 5 minutos
        let temporizador;

        function reiniciarTemporizador() {
            clearTimeout(temporizador);
            temporizador = setTimeout(() => {
                window.location.href = '../CerrarSesion.jsp';
            }, inactividad);
        }

        window.onload = reiniciarTemporizador;
        document.onmousemove = reiniciarTemporizador;
        document.onkeypress = reiniciarTemporizador;
        document.onclick = reiniciarTemporizador;
        document.onscroll = reiniciarTemporizador;
    </script>
</head>

<body>
    <%@ include file="../navbar.jsp" %>

    <header class="hero-header">
        <h1><i class="bi bi-list-check me-2"></i>Lista de Pedidos</h1>
    </header>

    <main class="content-box">
        <c:if test="${param.msg == '2'}">
            <div class="alert alert-success text-center">El pedido se eliminó satisfactoriamente.</div>
        </c:if>

        <c:if test="${not empty sessionScope.lisPedidos}">
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th>N° Pedido</th>
                            <th>ID Cliente</th>
                            <th>Nombre</th>
                            <th>Fecha</th>
                            <th>Sub Total</th>
                            <th>IGV</th>
                            <th>Total</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="lp" items="${sessionScope.lisPedidos}">
                            <tr>
                                <td><input type="text" class="form-control-plaintext text-center" readonly value="${lp[0]}"/></td>
                                <td><input type="text" class="form-control-plaintext text-center" readonly value="${lp[1]}"/></td>
                                <td><input type="text" class="form-control-plaintext text-center" readonly value="${lp[2]}"/></td>
                                <td><input type="text" class="form-control-plaintext text-center" readonly value="${lp[3]}"/></td>
                                <td><input type="text" class="form-control-plaintext text-center" readonly value="${lp[4]}"/></td>
                                <td><input type="text" class="form-control-plaintext text-center" readonly value="${lp[5]}"/></td>
                                <td><input type="text" class="form-control-plaintext text-center" readonly value="${lp[6]}"/></td>
                                <td>
                                    <c:url var="urlConsultar" value="/ControlPedido">
                                        <c:param name="op" value="Consultar"/>
                                        <c:param name="cod" value="${lp[0]}" />
                                    </c:url>
                                    <a class="btn btn-sm btn-outline-primary" href="${urlConsultar}">
                                        <i class="bi bi-eye-fill me-1"></i>Detalles
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <c:if test="${empty sessionScope.lisPedidos}">
            <div class="alert alert-info text-center">No hay pedidos registrados.</div>
        </c:if>

        <div class="text-center">
            <a href="${pageContext.request.contextPath}/Pedidos/menuPedidos.jsp" class="btn btn-secondary btn-back">
                <i class="bi bi-arrow-left-circle me-1"></i>Volver al menú de pedidos
            </a>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
