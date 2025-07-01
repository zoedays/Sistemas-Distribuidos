<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú de Pedidos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Estilo -->
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

        .menu-container {
            background: #ffffffdd;
            max-width: 700px;
            margin: -30px auto 40px auto;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
        }

        .menu-container a {
            display: block;
            margin: 1rem auto;
            max-width: 300px;
        }

        .btn-custom {
            border-radius: 25px;
            font-weight: 600;
            padding: 10px 25px;
        }
    </style>

    <!-- JS para inactividad -->
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
        <h1><i class="bi bi-ui-checks-grid me-2"></i>Menú de Gestión de Pedidos</h1>
    </header>

    <main class="menu-container text-center">
        <c:url var="urlListar" value="/ControlPedido">
            <c:param name="op" value="ListarPedidos" />
        </c:url>
        <a href="${urlListar}" class="btn btn-primary btn-custom">
            <i class="bi bi-card-list me-1"></i>Listar Pedidos
        </a>

        <c:url var="urlNuevo" value="/ControlPedido">
            <c:param name="op" value="Nuevo" />
        </c:url>
        <a href="${urlNuevo}" class="btn btn-success btn-custom">
            <i class="bi bi-plus-circle me-1"></i>Crear Nuevo Pedido
        </a>

        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary btn-custom mt-3">
            <i class="bi bi-arrow-left-circle me-1"></i>Volver al menú principal
        </a>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
