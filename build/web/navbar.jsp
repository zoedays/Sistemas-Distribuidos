<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<nav class="navbar navbar-expand-lg navbar-white bg-white p-3 header-nav">
    <div class="container-fluid px-3">
        <a href="" class="text-decoration-none color-logo pe-5">
            <h1 class="text-start color-logo fs-2">Menú Principal</h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar2" aria-controls="offcanvasNavbar2" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end text-bg-white" tabindex="-1" id="offcanvasNavbar2" aria-labelledby="offcanvasNavbar2Label">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbar2Label">Navegación</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1">
                    <c:if test="${sessionScope.usuAut.perfil == '1'}">
                        <li class="nav-item">
                            <a class="nav-link mx-1 my-1 fw-semibold" href="${pageContext.request.contextPath}/GestionUsuarios/menuGestionUsuarios.jsp">Gestión de Usuarios</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.usuAut.perfil == '1' or sessionScope.usuAut.perfil == '0'}">
                        <li class="nav-item">
                            <a class="nav-link mx-1 my-1" href="${pageContext.request.contextPath}/Clientes/menuClientes.jsp">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-1 my-1" href="${pageContext.request.contextPath}/Productos/menuProductos.jsp">Producto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-1 my-1" href="${pageContext.request.contextPath}/Pedidos/menuPedidos.jsp">Pedidos</a>
                        </li>
                    </c:if>
                    <li class="nav-item dropdown mx-1 my-1">
                        <div class="btn-group btn-primary">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                Mi perfil
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end text-center">
                                <li>
                                    <c:url var="urlLogout" value="/ControlUsuario"><c:param name="op" value="CerrarSesion"/></c:url>
                                    <a class="dropdown-item" href="${urlLogout}">Cerrar Sesion</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
