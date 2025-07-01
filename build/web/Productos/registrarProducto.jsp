<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Producto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap y fuentes -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
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
            padding: 40px 20px;
            text-align: center;
        }

        .form-container {
            background: #ffffffee;
            max-width: 700px;
            margin: -30px auto 40px auto;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 123, 255, 0.15);
        }

        .form-label {
            font-weight: 600;
        }

        .btn-custom {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 600;
        }

        .text-success {
            font-weight: bold;
        }
    </style>

    <!-- Inactividad (5 min) -->
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

    <!-- Validación JS -->
    <script>
        function soloDecimal(e) {
            const charCode = e.which ? e.which : e.keyCode;
            const charStr = String.fromCharCode(charCode);
            if (!/^[0-9.]$/.test(charStr)) {
                e.preventDefault();
            }
        }

        document.addEventListener("DOMContentLoaded", () => {
            const precio = document.getElementById("txtPre");
            if (precio) {
                precio.addEventListener("keypress", soloDecimal);
            }
        });
    </script>
</head>

<body>
    <%@ include file="../navbar.jsp" %>

    <header class="hero-header">
        <h1><i class="bi bi-plus-circle me-2"></i>Registrar Producto</h1>
    </header>

    <main class="form-container">
        <form action="${pageContext.request.contextPath}/ControlProducto" method="POST">
            <div class="mb-3">
                <label for="txtNom" class="form-label">Nombre:</label>
                <input type="text" class="form-control" name="txtNom" id="txtNom" required
                       placeholder="Ingrese nombre del producto">
            </div>

            <div class="mb-3">
                <label for="txtDes" class="form-label">Descripción:</label>
                <input type="text" class="form-control" name="txtDes" id="txtDes" required
                       placeholder="Ingrese una descripción">
            </div>

            <div class="mb-3">
                <label for="txtPre" class="form-label">Precio:</label>
                <input type="number" step="0.01" min="0" class="form-control" name="txtPre" id="txtPre" required
                       placeholder="Ej. 9.90">
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary btn-custom" name="acc" value="Crear">
                    <i class="bi bi-check-circle me-1"></i>Crear producto
                </button>
            </div>
        </form>

        <c:if test="${param.msg == '1'}">
            <div class="text-success text-center mt-4">
                Producto creado con éxito:
                <c:url var="urlListar" value="/ControlProducto"><c:param name="op" value="Listar"/></c:url>
                <a href="${urlListar}" class="btn btn-outline-success btn-sm ms-2">Ver listado</a>
            </div>
        </c:if>

        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/Productos/menuProductos.jsp" class="btn btn-outline-secondary btn-custom">
                <i class="bi bi-arrow-left-circle me-1"></i>Volver al menú de productos
            </a>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
