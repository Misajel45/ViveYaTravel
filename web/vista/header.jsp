<%@page import="modelo.dto.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
    <link href="${pageContext.request.contextPath}/css/carrusel.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="contHeader">
        <div class="logo">
            <a href="index.jsp"><img class="logo" src="../" alt=""/></a>
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
            <a href="."><img class="carrito" src="../"/></a>
        </div>
        
        <div class="usua">
            <a href="iniciarSesion.jsp"><i class="fa-solid fa-user usuario"></i></a>
        </div>
        <ul>
                <li>
                    <p>
                        <% 
                            usuario cliente = (usuario) session.getAttribute("cliente");
                            if (cliente != null) {
                                out.print("Bienvenido " + cliente.getCorreoElectronico());
                            } else {
                                out.print("Bienvenido invitado");
                            }
                        %>
                    </p>
                </li>
                <li>
                    <% if (cliente != null) { %>
                        <div>
                            <a href="${pageContext.request.contextPath}/srvUsuario?accion=cerrar">Cerrar sesión</a>
                        </div>
                    <% } else { %>
                        <div>
                            <a href="iniciarSesion.jsp">Iniciar sesión</a>
                        </div>
                    <% } %>
                </li>
            </ul>
    </div>
</header>

