<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Detalle de Pedido</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f0f8ff;
            font-family: 'Segoe UI', sans-serif;
        }
        .container-custom {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            margin-top: 50px;
        }
        table input {
            border: none;
            background: transparent;
            width: 100%;
        }
        h1, h3 {
            color: #0077b6;
        }
        th, td {
            vertical-align: middle !important;
        }
    </style>
</head>
<body>

<div class="container container-custom">
    <h1 class="mb-4 text-center">Detalle del Pedido</h1>

    <c:set var="rp" value="${sessionScope.resuPedido}" />
    <c:set var="p" value="${rp.pedido}" />
    <c:set var="c" value="${rp.cliente}" />

    <!-- Datos del pedido y cliente -->
    <div class="row g-3 mb-4">
        <div class="col-md-3">
            <label class="form-label">Nro. Pedido:</label>
            <input type="text" class="form-control" value="${p.numPedido}" readonly>
        </div>
        <div class="col-md-3">
            <label class="form-label">Fecha:</label>
            <input type="date" class="form-control" value="${p.fec}" readonly>
        </div>
        <div class="col-md-3">
            <label class="form-label">Cod. Cliente:</label>
            <input type="text" class="form-control" value="${c.codCliente}" readonly>
        </div>
        <div class="col-md-3">
            <label class="form-label">Nombre del cliente:</label>
            <input type="text" class="form-control" value="${c.nom}" readonly>
        </div>
        <div class="col-md-3">
            <label class="form-label">DNI/RUC:</label>
            <input type="text" class="form-control" value="${c.dni}" readonly>
        </div>
        <div class="col-md-6">
            <label class="form-label">Dirección:</label>
            <input type="text" class="form-control" value="${c.dir}" readonly>
        </div>
        <div class="col-md-3">
            <label class="form-label">Celular:</label>
            <input type="text" class="form-control" value="${c.cel}" readonly>
        </div>
    </div>

    <!-- Tabla de detalles -->
    <h3 class="mt-5 mb-3">Detalles del Pedido</h3>
    <div class="table-responsive">
        <table class="table table-bordered align-middle">
            <thead class="table-light">
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Sub Total</th>
                    <th>IGV</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="lin" items="${rp.detPedido}">
                    <tr>
                        <td><input type="text" value="${lin[0]}" readonly></td>
                        <td><input type="text" value="${lin[1]}" readonly></td>
                        <td><input type="text" value="${lin[2]}" readonly></td>
                        <td><input type="text" value="${lin[3]}" readonly></td>
                        <td><input type="text" value="${lin[4]}" readonly></td>
                        <td><input type="text" value="${lin[5]}" readonly></td>
                        <td><input type="text" value="${lin[6]}" readonly></td>
                        <td><input type="text" value="${lin[7]}" readonly></td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7" class="text-end fw-bold">Sub Total:</td>
                    <td><input type="text" value="${rp.subTotal}" readonly></td>
                </tr>
                <tr>
                    <td colspan="7" class="text-end fw-bold">IGV 18%:</td>
                    <td><input type="text" value="${rp.igv}" readonly></td>
                </tr>
                <tr>
                    <td colspan="7" class="text-end fw-bold">Total:</td>
                    <td><input type="text" value="${rp.total}" readonly></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Botón de regreso -->
    <div class="text-end mt-4">
        <c:url var="urlSalir" value="/ControlPedido">
            <c:param name="op" value="ListarPedidos" />
        </c:url>
        <a class="btn btn-danger" href="${urlSalir}">Regresar al listado de pedidos</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
