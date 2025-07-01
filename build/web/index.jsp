<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Supermercado - Menú Principal</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

    <!-- Estilos personalizados -->
    <style>
        body {
            font-family: 'Quicksand', sans-serif;
            background: url('https://www.transparenttextures.com/patterns/diagmonds-light.png'),
                        linear-gradient(to right, #e0f7fa, #b2ebf2);
            background-blend-mode: soft-light;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .hero-header {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            padding: 60px 20px;
            text-align: center;
            position: relative;
        }

        .hero-header h1 {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .hero-header p {
            font-size: 1.2rem;
            font-weight: 400;
        }

        .hero-icon {
            font-size: 3rem;
            margin-bottom: 15px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
            padding: 2rem;
            text-align: center;
            margin-top: -40px;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .card p {
            font-size: 1.1rem;
            color: #555;
        }

        .btn-custom {
            background-color: #00aaff;
            color: #fff;
            border-radius: 25px;
            padding: 10px 20px;
            transition: all 0.3s ease-in-out;
        }

        .btn-custom:hover {
            background-color: #007bbd;
            color: #fff;
        }

        .icono {
            font-size: 2rem;
            margin-right: 8px;
        }

        .navbar-custom {
            background-color: #0088cc;
        }

        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: #fff;
        }

        .navbar-custom .nav-link:hover {
            color: #e0f7ff;
        }
    </style>

    <!-- Script de cierre por inactividad -->
    <script>
        let tiempoInactivo = 5 * 60 * 1000; // 5 minutos
        let temporizador;

        function reiniciarTemporizador() {
            clearTimeout(temporizador);
            temporizador = setTimeout(() => {
                window.location.href = 'CerrarSesion.jsp';
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
    <%@ include file="navbar.jsp" %>

    <!-- Encabezado Hero -->
    <header class="hero-header">
        <div class="hero-icon">
            <i class="bi bi-shop-window"></i>
        </div>
        <h1>Bienvenido a SuperMarket+</h1>
        <p>Tu tienda en línea de confianza — fácil, rápida y siempre disponible</p>
    </header>

    <!-- JS Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
