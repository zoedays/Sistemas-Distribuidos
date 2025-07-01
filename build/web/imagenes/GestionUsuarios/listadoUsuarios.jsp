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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Listado de Usuarios</title>

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
            padding-top: 60px;
        }

        .table thead {
            background-color: #00bcd4;
            color: white;
        }

        .table tbody tr td input {
            border: none;
            background: transparent;
            width: 100%;
            text-align: center;
        }

        .btn-volver {
            border-radius: 25px;
            padding: 8px 20px;
        }

        .mensaje {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            border-radius: 8px;
            font-weight: 500;
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
        <h2 class="text-center text-primary mb-4"><i class="bi bi-people-fill"></i> Lista de Usuarios</h2>

        <c:if test="${param.msg == '2'}">
            <div class="mensaje mb-3 text-center">
                <i class="bi bi-check-circle-fill me-2"></i>El usuario se eliminó satisfactoriamente.
            </div>
        </c:if>

        <c:if test="${not empty sessionScope.lista}">
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle text-center">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Username</th>
                            <th>Nombre completo</th>
                            <th>Rol</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${sessionScope.lista}">
                            <tr>
                                <td><input type="text" value="${usuario.codUsuario}" readonly></td>
                                <td><input type="text" value="${usuario.username}" readonly></td>
                                <td><input type="text" value="${usuario.nom}" readonly></td>
                                <td><input type="text" value="${usuario.perfil}" readonly></td>
                                <td><input type="text" value="${usuario.est}" readonly></td>
                                <c:url var="urlConsultar" value="/ControlUsuario">
                                    <c:param name="op" value="Consultar"/>
                                    <c:param name="cod" value="${usuario.codUsuario}"/>
                                </c:url>
                                <td>
                                    <a class="btn btn-sm btn-primary" href="${urlConsultar}">
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
            <div class="alert alert-warning text-center mt-4">
                <i class="bi bi-exclamation-circle me-2"></i>No hay usuarios registrados.
            </div>
        </c:if>

        <div class="text-center mt-4">
            <a href="menuGestionUsuarios.jsp" class="btn btn-outline-secondary btn-volver">
                <i class="bi bi-arrow-left-circle"></i> Volver al menú de gestión
            </a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
