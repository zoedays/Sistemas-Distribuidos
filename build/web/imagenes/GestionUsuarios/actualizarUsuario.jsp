<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Usuario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #f4f7fa, #e9edf1);
            color: #333;
        }

        .header {
            background-color: #1e88e5;
            color: white;
            padding: 30px 20px;
            text-align: center;
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .header .header-content {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
        }

        .header i {
            font-size: 2rem;
        }

        .form-container {
            background: white;
            max-width: 700px;
            margin: 40px auto;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }

        label {
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }

        .form-control-password {
            position: relative;
        }

        .form-control-password input {
            padding-right: 40px;
        }

        .form-control-password .toggle-password {
            position: absolute;
            right: 10px;
            top: 10px;
            cursor: pointer;
            color: #888;
        }

        .btn-primary {
            background-color: #1e88e5;
            border: none;
            font-weight: 600;
        }

        .btn-primary:hover {
            background-color: #1565c0;
        }

        .btn-secondary {
            background-color: #9e9e9e;
            border: none;
            font-weight: 600;
        }

        .btn-secondary:hover {
            background-color: #757575;
        }

        .msg-success {
            color: #2e7d32;
            background-color: #e8f5e9;
            padding: 12px 20px;
            border-radius: 8px;
            margin-top: 15px;
            text-align: center;
        }

        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: white;
            border: 2px solid #1e88e5;
            color: #1e88e5;
            padding: 10px 18px;
            border-radius: 10px;
            font-weight: 600;
            transition: 0.3s ease-in-out;
            text-decoration: none;
        }

        .btn-back:hover {
            background-color: #1e88e5;
            color: white;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

    <div class="header">
        <div class="header-content">
            <i class="bi bi-pencil-square"></i>
            <h1 class="mb-0">Actualizar Usuario</h1>
        </div>
    </div>

    <div class="form-container">
        <c:set var="u" value="${sessionScope.usu}"/>
        <form action="${pageContext.request.contextPath}/ControlUsuario" method="POST"> 

            <label for="txtCod">Código:</label>
            <input type="text" name="txtCod" value="${u.codUsuario}" readonly>

            <label for="selEst">Estado:</label>
            <select name="selEst">
                <option value="1" <c:if test="${u.est == 'Activo'}">selected</c:if>>Activo</option>
                <option value="0" <c:if test="${u.est == 'Inactivo'}">selected</c:if>>Inactivo</option>
            </select>

            <label for="txtUsn">Username:</label>
            <input type="text" name="txtUsn" value="${u.username}" required>

            <label for="txtNom">Nombre completo:</label>
            <input type="text" name="txtNom" value="${u.nom}" required>

            <label for="txtPass">Contraseña:</label>
            <div class="form-control-password">
                <input type="password" name="txtPass" id="txtPass" placeholder="">
                <i class="bi bi-eye-slash toggle-password" id="togglePass"></i>
            </div>

            <label for="txtRol">Perfil:</label>
            <select name="txtRol">
                <option value="0" <c:if test="${u.perfil == 'Empleado'}">selected</c:if>>Empleado</option>
                <option value="1" <c:if test="${u.perfil == 'Administrador'}">selected</c:if>>Administrador</option>
            </select>

            <div class="d-flex justify-content-between">
                <button class="btn btn-primary" type="submit" name="acc" value="Actualizar">
                    Guardar Cambios
                </button>
                <button class="btn btn-secondary" type="submit" name="acc" value="Eliminar">
                    Eliminar Usuario
                </button>
            </div>

            <c:if test="${param.msg == '1'}">
                <div class="msg-success mt-4">
                    <i class="bi bi-check-circle-fill"></i> Usuario actualizado con éxito
                </div>
            </c:if>

            <div class="text-center mt-4">
                <c:url var="urlListar" value="/ControlUsuario"><c:param name="op" value="Listar"/></c:url>
                <a href="${urlListar}" class="btn-back">
                    <i class="bi bi-arrow-left-circle"></i> Regresar al listado de usuarios
                </a>
            </div>
        </form>
    </div>

    <script>
        const passwordInput = document.getElementById('txtPass');
        const toggleIcon = document.getElementById('togglePass');

        toggleIcon.addEventListener('click', () => {
            const type = passwordInput.type === 'password' ? 'text' : 'password';
            passwordInput.type = type;
            toggleIcon.classList.toggle('bi-eye');
            toggleIcon.classList.toggle('bi-eye-slash');
        });
    </script>

</body>
</html>