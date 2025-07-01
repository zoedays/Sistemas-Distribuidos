<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Productos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap y estilos -->
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

        .table-container {
            background: #ffffffee;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
            max-width: 1000px;
            margin: -40px auto 40px auto;
        }

        table input {
            border: none;
            background-color: transparent;
            font-weight: 500;
        }

        .btn-custom {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 600;
        }
    </style>

    <!-- Tiempo de inactividad -->
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

    <header class="hero-header">
        <h1><i class="bi bi-box-seam-fill me-2"></i>Listado de Productos</h1>
    </header>

    <main class="table-container">
        <c:if test="${param.msg == '2'}">
            <div class="alert alert-success text-center">El producto se eliminó satisfactoriamente.</div>
        </c:if>

        <c:if test="${not empty sessionScope.lista}">
            <div class="table-responsive">
                <table class="table table-hover align-middle text-center">
                    <thead class="table-primary">
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="producto" items="${sessionScope.lista}">
                            <tr>
                                <td><input type="text" size="5" value="${producto.codProducto}" readonly/></td>
                                <td><input type="text" size="20" value="${producto.nom}" readonly/></td>
                                <td><input type="text" size="25" value="${producto.des}" readonly/></td>
                                <td><input type="text" size="8" value="${producto.pre}" readonly/></td>
                                <td><input type="text" size="10" value="${producto.est}" readonly/></td>
                                <td>
                                    <c:url var="urlConsultar" value="/ControlProducto">
                                        <c:param name="op" value="Consultar"/>
                                        <c:param name="cod" value="${producto.codProducto}" />
                                    </c:url>
                                    <a class="btn btn-outline-primary btn-sm" href="${urlConsultar}">
                                        <i class="bi bi-search"></i> Detalles
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <c:if test="${empty sessionScope.lista}">
            <div class="text-center text-muted">No hay productos registrados.</div>
        </c:if>

        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/Productos/menuProductos.jsp" class="btn btn-outline-secondary btn-custom">
                <i class="bi bi-arrow-left-circle me-1"></i> Volver al menú de productos
            </a>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
