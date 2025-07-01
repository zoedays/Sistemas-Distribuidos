<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Clientes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS & Icons -->
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
            margin: 0;
        }

        .hero-header {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            padding: 60px 20px;
            text-align: center;
        }

        .hero-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .hero-header p {
            font-size: 1.1rem;
            font-weight: 400;
        }

        .hero-icon {
            font-size: 3rem;
            margin-bottom: 15px;
        }

        .menu-container {
            max-width: 600px;
            background-color: #ffffffee;
            margin: -40px auto 40px auto;
            padding: 2rem;
            border-radius: 1.5rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
            text-align: center;
        }

        .menu-container a {
            display: block;
            margin: 10px 0;
            font-weight: 600;
        }

        .btn-menu {
            border-radius: 25px;
            padding: 10px 20px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #007bbd;
        }

        .btn-outline-info:hover {
            background-color: #b2ebf2;
        }

        .btn-outline-secondary:hover {
            background-color: #dee2e6;
        }
    </style>

    <!-- Inactividad -->
    <script>
        let tiempoInactivo = 5 * 60 * 1000;
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
        <div class="hero-icon">
            <i class="bi bi-person-lines-fill"></i>
        </div>
        <h1>Gestión de Clientes</h1>
        <p>Administra eficientemente a tus clientes registrados</p>
    </header>

    <!-- Contenido Principal -->
    <div class="menu-container">
        <c:url var="urlListar" value="/ControlCliente"><c:param name="op" value="Listar"/></c:url>
        <a href="${urlListar}" class="btn btn-primary btn-menu">
            <i class="bi bi-card-list me-2"></i> Listar Clientes
        </a>

        <c:url var="urlNuevo" value="/ControlCliente"><c:param name="op" value="Nuevo"/></c:url>
        <a href="${urlNuevo}" class="btn btn-outline-info btn-menu">
            <i class="bi bi-person-plus-fill me-2"></i> Crear Nuevo Cliente
        </a>

        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-secondary btn-menu">
            <i class="bi bi-arrow-left-circle me-2"></i>Volver al Menú Principal
        </a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
