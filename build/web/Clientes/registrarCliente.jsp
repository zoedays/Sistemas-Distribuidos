<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Cliente</title>
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

        .form-container {
            max-width: 700px;
            background: #ffffffee;
            margin: -40px auto 40px auto;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
        }

        .btn-custom {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 600;
            margin: 5px;
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

    <!-- Validación de teclado -->
    <script>
        function soloLetras(e) {
            const tecla = e.key;
            const regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$/;
            if (!regex.test(tecla)) {
                e.preventDefault();
            }
        }

        function soloNumeros(e) {
            const tecla = e.key;
            if (!/^\d$/.test(tecla)) {
                e.preventDefault();
            }
        }
    </script>
</head>

<body>
    <%@ include file="../navbar.jsp" %>

    <!-- Encabezado -->
    <header class="hero-header">
        <h1><i class="bi bi-person-plus-fill me-2"></i>Registrar Nuevo Cliente</h1>
    </header>

    <!-- Formulario -->
    <main class="form-container">
        <form action="${pageContext.request.contextPath}/ControlCliente" method="POST">
            <div class="mb-3">
                <label>Nombres</label>
                <input type="text" class="form-control" name="txtNom" required
                       pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" onkeypress="soloLetras(event)" title="Solo letras y espacios">
            </div>

            <div class="mb-3">
                <label>Apellidos</label>
                <input type="text" class="form-control" name="txtApe" required
                       pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" onkeypress="soloLetras(event)" title="Solo letras y espacios">
            </div>

            <div class="mb-3">
                <label>Dirección</label>
                <input type="text" class="form-control" name="txtDir" required>
            </div>

            <div class="mb-3">
                <label>DNI</label>
                <input type="text" class="form-control" name="txtDni" maxlength="8" required
                       pattern="\\d{8}" onkeypress="soloNumeros(event)" title="Solo números (8 dígitos)">
            </div>

            <div class="mb-3">
                <label>Teléfono</label>
                <input type="text" class="form-control" name="txtTel" maxlength="7"
                       pattern="\\d{6,7}" onkeypress="soloNumeros(event)" title="Solo números (6-7 dígitos)">
            </div>

            <div class="mb-3">
                <label>Celular</label>
                <input type="text" class="form-control" name="txtCel" maxlength="9" required
                       pattern="\\d{9}" onkeypress="soloNumeros(event)" title="Solo números (9 dígitos)">
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-custom" name="acc" value="Crear">
                    <i class="bi bi-save"></i> Crear cliente
                </button>
            </div>
        </form>

        <!-- Mensaje -->
        <c:if test="${param.msg == '1'}">
            <div class="text-center mt-4 text-success fw-semibold">
                Cliente creado con éxito: 
                <c:url var="urlListar" value="/ControlCliente"><c:param name="op" value="Listar"/></c:url>
                <a href="${urlListar}" class="btn btn-outline-success btn-sm ms-2">Ver listado</a>
            </div>
        </c:if>

        <!-- Volver -->
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/Clientes/menuClientes.jsp" class="btn btn-outline-secondary btn-custom">
                <i class="bi bi-arrow-left-circle me-1"></i> Volver al menú de clientes
            </a>
        </div>
    </main>

    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
