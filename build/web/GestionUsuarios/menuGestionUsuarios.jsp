<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gestión de Usuarios</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

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

        .container {
            padding-top: 80px;
        }

        .card-custom {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 1.5rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
            padding: 2rem;
            max-width: 700px;
            margin: 0 auto;
            text-align: center;
        }

        .card-custom h1 {
            font-size: 2.2rem;
            color: #007acc;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .btn-primary-custom {
            background-color: #00aaff;
            color: #fff;
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
            border: none;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary-custom:hover {
            background-color: #007bbd;
        }

        .btn-outline-custom {
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
        }

        .icon {
            font-size: 1.2rem;
            margin-right: 8px;
        }
    </style>

    <!-- Inactividad -->
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

    <div class="container">
        <div class="card-custom">
            <h1><i class="bi bi-person-gear icon"></i>Gestión de Usuarios</h1>

            <div class="d-grid gap-3 mt-4">
                <c:url var="urlListar" value="/ControlUsuario">
                    <c:param name="op" value="Listar"/>
                </c:url>
                <a href="${urlListar}" class="btn btn-primary-custom">
                    <i class="bi bi-list-ul icon"></i> Listar Usuarios
                </a>

                <c:url var="urlNuevo" value="/ControlUsuario">
                    <c:param name="op" value="Nuevo"/>
                </c:url>
                <a href="${urlNuevo}" class="btn btn-outline-primary btn-outline-custom">
                    <i class="bi bi-person-plus-fill icon"></i> Crear Nuevo Usuario
                </a>

                <a href="../index.jsp" class="btn btn-outline-secondary btn-outline-custom">
                    <i class="bi bi-arrow-left-circle icon"></i> Volver al Menú Principal
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
