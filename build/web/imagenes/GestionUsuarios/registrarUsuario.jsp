<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Usuario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .form-container {
            background-color: #ffffffcc;
            padding: 2rem 2.5rem;
            border-radius: 1.5rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
            max-width: 500px;
            width: 100%;
        }

        .form-container h1 {
            font-size: 1.8rem;
            font-weight: 700;
            color: #007acc;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-label {
            font-weight: 600;
        }

        .btn-custom {
            background-color: #00aaff;
            color: #fff;
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 600;
            border: none;
        }

        .btn-custom:hover {
            background-color: #007bbd;
        }

        .message {
            text-align: center;
            margin-top: 1rem;
            color: green;
            font-weight: 600;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
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

    <!-- Solo letras en campo Nombre -->
    <script>
        function soloLetras(e) {
            const tecla = e.key;
            const letras = /^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$/;
            if (!letras.test(tecla)) {
                e.preventDefault();
            }
        }
    </script>
</head>

<body>
    <div class="form-container">
        <h1><i class="bi bi-person-plus-fill me-2"></i>Registrar Usuario</h1>

        <form action="${pageContext.request.contextPath}/ControlUsuario" method="POST">
            <div class="mb-3">
                <label for="txtUsn" class="form-label">Username</label>
                <input type="text" class="form-control" name="txtUsn" minlength="6" required>
            </div>
            <div class="mb-3">
                <label for="txtNom" class="form-label">Nombre completo</label>
                <input type="text" class="form-control" name="txtNom" minlength="2" required
                       pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+"
                       title="Solo se permiten letras y espacios"
                       onkeypress="soloLetras(event)">
            </div>
            <div class="mb-3">
                <label for="txtPass" class="form-label">Contraseña</label>
                <input type="password" class="form-control" name="txtPass" minlength="6" required>
            </div>
            <div class="mb-3">
                <label for="txtRol" class="form-label">Perfil</label>
                <select name="txtRol" class="form-select">
                    <option value="0" selected>Empleado</option>
                    <option value="1">Administrador</option>
                </select>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-custom" name="acc" value="Crear">
                    <i class="bi bi-check2-circle me-1"></i>Crear Cuenta
                </button>
            </div>
        </form>

        <c:if test="${param.msg == '1'}">
            <div class="message">
                Usuario creado con éxito.
                <c:url var="urlListar" value="/ControlUsuario"><c:param name="op" value="Listar"/></c:url>
                <br><a href="${urlListar}">Ver listado</a>
            </div>
        </c:if>

        <!-- Botón de regreso mejorado -->
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/GestionUsuarios/menuGestionUsuarios.jsp"
               class="btn btn-outline-info rounded-pill px-4 py-2 fw-semibold shadow-sm">
                <i class="bi bi-arrow-left-circle me-2"></i>Volver al menú de usuarios
            </a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
