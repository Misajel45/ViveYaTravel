<%@page import="modelo.dto.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
    <link href="${pageContext.request.contextPath}/css/carrusel.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="contHeader">
    <div class="logo">
        <a href="index.jsp"><img class="logo" src="${pageContext.request.contextPath}/images/logo.png" alt="Logo"/></a>
    </div>
    <div class="navbar">
        <nav>
            <ul class="menu">
                <li><a href="tours.jsp">TOURS</a></li>
                <li><a href="promociones.jsp">PROMOCIONES</a></li>
                <li><a href="nosotros.jsp">NOSOTROS</a></li>
            </ul>
        </nav>
    </div>
    <div class="carro">
        <a href="#"><img class="carrito" src="${pageContext.request.contextPath}/images/carrito.png" alt="Carrito"/></a>
    </div>
    <div class="usuario-container">
        <p class="bienvenido">
            <% 
                usuario cliente = (usuario) session.getAttribute("cliente");
                if (cliente != null) {
                    out.print("Hola " + cliente.getNombre());
                } else {
                    out.print("Bienvenido invitado");
                }
            %>
        </p>
        <div class="usuario">
            <% if (cliente != null) { %>
                <a href="${pageContext.request.contextPath}/srvUsuario?accion=cerrar"><i class="fa-solid fa-right-to-bracket cerrar"></i></a>
            <% } else { %>
                <a href="iniciarSesion.jsp"><i class="fa-solid fa-user usuario"></i></a>
            <% } %>
        </div>
    </div>
</div>

</header>

