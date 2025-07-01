<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap y fuentes -->
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
            padding: 50px 20px;
            text-align: center;
        }

        .menu-container {
            max-width: 600px;
            background: #ffffffee;
            margin: -40px auto 40px auto;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
        }

        .btn-custom {
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 600;
            margin: 10px 5px;
        }
    </style>

    <!-- Tiempo de inactividad -->
    <script>
        let tiempoInactivo = 5 * 60 * 1000; // 5 minutos
        let temporizador;

        function reiniciarTemporizador() {
            clearTimeout(temporizador);
            temporizador = setTimeout(() => {
                window.location.href = '../CerrarSesion.jsp';
            }, tiempoInactivo);
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

    <!-- Encabezado Hero -->
    <header class="hero-header">
        <h1><i class="bi bi-box-seam-fill me-2"></i>Gestión de Productos</h1>
    </header>

    <!-- Menú -->
    <main class="menu-container text-center">
        <c:url var="urlListar" value="/ControlProducto"><c:param name="op" value="Listar"/></c:url>
        <a href="${urlListar}" class="btn btn-primary btn-custom">
            <i class="bi bi-list-ul me-1"></i> Listar Productos
        </a>

        <c:url var="urlNuevo" value="/ControlProducto"><c:param name="op" value="Nuevo"/></c:url>
        <a href="${urlNuevo}" class="btn btn-success btn-custom">
            <i class="bi bi-plus-circle me-1"></i> Crear Nuevo Producto
        </a>

        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-secondary btn-custom">
            <i class="bi bi-arrow-left-circle me-1"></i> Volver al Menú Principal
        </a>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
