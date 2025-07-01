<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Cliente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Estilos y fuentes -->
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

    <!-- Validaciones JS -->
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

    <header class="hero-header">
        <h1><i class="bi bi-person-gear me-2"></i>Actualizar Cliente</h1>
    </header>

    <main class="form-container">
        <c:set var="c" value="${sessionScope.cli}"/>
        <form action="${pageContext.request.contextPath}/ControlCliente" method="POST">
            <div class="mb-3">
                <label>Código</label>
                <input type="text" class="form-control" name="txtCod" value="${c.codCliente}" readonly>
            </div>

            <div class="mb-3">
                <label>Estado</label>
                <select class="form-select" name="selEst">
                    <option value="1" <c:if test="${c.est == 'Activo'}">selected</c:if>>Activo</option>
                    <option value="0" <c:if test="${c.est == 'Inactivo'}">selected</c:if>>Inactivo</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Nombres</label>
                <input type="text" class="form-control" name="txtNom" value="${c.nom}" required
                       pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" onkeypress="soloLetras(event)" title="Solo letras y espacios">
            </div>

            <div class="mb-3">
                <label>Apellidos</label>
                <input type="text" class="form-control" name="txtApe" value="${c.ape}" required
                       pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" onkeypress="soloLetras(event)" title="Solo letras y espacios">
            </div>

            <div class="mb-3">
                <label>Dirección</label>
                <input type="text" class="form-control" name="txtDir" value="${c.dir}" required>
            </div>

            <div class="mb-3">
                <label>DNI</label>
                <input type="text" class="form-control" name="txtDni" maxlength="8" value="${c.dni}" required
                       pattern="\\d{8}" onkeypress="soloNumeros(event)" title="Solo números, exactamente 8 dígitos">
            </div>

            <div class="mb-3">
                <label>Teléfono</label>
                <input type="text" class="form-control" name="txtTel" maxlength="7" value="${c.tel}"
                       pattern="\\d{6,7}" onkeypress="soloNumeros(event)" title="Solo números (6-7 dígitos)">
            </div>

            <div class="mb-3">
                <label>Celular</label>
                <input type="text" class="form-control" name="txtCel" maxlength="9" value="${c.cel}" required
                       pattern="\\d{9}" onkeypress="soloNumeros(event)" title="Solo números, exactamente 9 dígitos">
            </div>

            <div class="text-center">
                <button class="btn btn-primary btn-custom" type="submit" name="acc" value="Actualizar">
                    <i class="bi bi-save"></i> Guardar cambios
                </button>
                <button class="btn btn-danger btn-custom" type="submit" name="acc" value="Eliminar">
                    <i class="bi bi-trash"></i> Eliminar Cliente
                </button>
            </div>

            <c:if test="${param.msg == '1'}">
                <div class="text-center mt-3 text-success fw-semibold">Cliente actualizado con éxito</div>
            </c:if>

            <div class="text-center mt-3">
                <c:url var="urlListar" value="/ControlCliente"><c:param name="op" value="Listar"/></c:url>
                <a href="${urlListar}" class="btn btn-outline-secondary btn-custom">
                    <i class="bi bi-arrow-left-circle me-1"></i> Regresar al listado de clientes
                </a>
            </div>
        </form>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
