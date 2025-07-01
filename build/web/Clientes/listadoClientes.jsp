<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Clientes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap, Icons y fuente -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Quicksand', sans-serif;
            background: url('https://www.transparenttextures.com/patterns/diagmonds-light.png'),
                        linear-gradient(to right, #e0f7fa, #b2ebf2);
            background-blend-mode: soft-light;
            margin: 0;
            padding: 0;
            min-height: 100vh;
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

        .table-container {
            max-width: 95%;
            margin: -40px auto 40px auto;
            background-color: #ffffffee;
            padding: 2rem;
            border-radius: 1.5rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }

        .btn-back {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
        }

        .btn-back:hover {
            background-color: #dee2e6;
        }

        .alert-msg {
            text-align: center;
            margin-bottom: 1rem;
            color: green;
            font-weight: bold;
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

    <!-- Encabezado -->
    <header class="hero-header">
        <h1><i class="bi bi-people-fill me-2"></i>Listado de Clientes</h1>
    </header>

    <main class="table-container">
        <c:if test="${param.msg == '2'}">
            <div class="alert-msg">El cliente se eliminó satisfactoriamente.</div>
        </c:if>

        <c:if test="${not empty sessionScope.lista}">
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th>Código</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Dirección</th>
                            <th>DNI</th>
                            <th>Teléfono</th>
                            <th>Celular</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="${sessionScope.lista}">
                            <tr>
                                <td>${cliente.codCliente}</td>
                                <td>${cliente.nom}</td>
                                <td>${cliente.ape}</td>
                                <td>${cliente.dir}</td>
                                <td>${cliente.dni}</td>
                                <td>${cliente.tel}</td>
                                <td>${cliente.cel}</td>
                                <td>${cliente.est}</td>
                                <td>
                                    <c:url var="urlConsultar" value="/ControlCliente">
                                        <c:param name="op" value="Consultar"/>
                                        <c:param name="cod" value="${cliente.codCliente}"/>
                                    </c:url>
                                    <a href="${urlConsultar}" class="btn btn-sm btn-primary">
                                        <i class="bi bi-eye-fill"></i> Detalles
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <c:if test="${empty sessionScope.lista}">
            <p class="text-center text-muted">No hay clientes registrados.</p>
        </c:if>

        <div class="text-center">
            <a href="${pageContext.request.contextPath}/Clientes/menuClientes.jsp" class="btn btn-outline-secondary btn-back">
                <i class="bi bi-arrow-left-circle me-2"></i>Volver al menú de clientes
            </a>
        </div>
    </main>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
