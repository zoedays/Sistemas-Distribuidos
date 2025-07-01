<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>
    
<h1>Detalles del pedido</h1>
<c:if test="${not empty sessionScope.pres and pres.tot!='' and pres.tot!='0.00'}">
    <c:set var="lis" value="${pres.lis}"/>
    <table>
        <tr>
            <td align="center">Codigo</td>
            <td align="center">Nombre</td>
            <td align="center">Descripción</td>
            <td align="center">Precio</td>
            <td align="center">Cantidad</td>
            <td align="center">Sub Total</td>
            <td align="center">IGV</td>
            <td align="center">Total</td>
        </tr>
        <c:forEach var="producto" items="${lis}">
            <c:set var="p" value="${producto}"/>
            <tr>
            <form action="${pageContext.request.contextPath}/ControlDetallePedido" method="POST">
                <td><input type="text" name="cod" size="5" value="${p[0]}" readonly/></td>
                <td><input type="text" size="15" value="${p[1]}" readonly/></td>
                <td><input type="text" size="20" value="${p[2]}" readonly/></td>
                <td><input type="text" size="5" value="${p[3]}" readonly/></td>
                <td><input type="text" size="5" value="${p[4]}" readonly/></td>
                <td><input type="text" size="5" value="${p[5]}" readonly/></td>
                <td><input type="text" size="5" value="${p[6]}" readonly/></td>
                <td><input type="text" size="5" value="${p[7]}" readonly/></td>
                <td><input type="submit" name="acc" value="Quitar Producto"/></td>
        </c:forEach>
        <tr>
            <td colspan="8" align="right">Sub Total: <input type="text" size="5" value="${pres.subTot}" readonly/></td> 
        </tr>
        <tr>
            <td colspan="8" align="right">IGV 18%: <input type="text" size="5" value="${pres.igv}" readonly/></td> 
        </tr>
        <tr>
            <td colspan="8" align="right">Total: <input type="text" size="5" value="${pres.tot}" readonly/></td> 
        </tr>
    </table>
</c:if>

<c:if test="${pre.tot=='0.00' or pres.tot==''}">
    <p>Añada productos al pedido para empezar.</p>
</c:if>
<c:url var="urlListar" value="/ControlDetallePedido"><c:param name="op" value="ListarProductos"/></c:url>
<p><a href="${urlListar}">Listar Productos</a></p>
<br>
<div><a href="${pageContext.request.contextPath}/Pedidos/menuPedidos.jsp">Regresar al menú de productos</a></div>
