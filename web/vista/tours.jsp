<%--Librerias --%>
<%@page import="modelo.dao.PaqueteDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="servicios.conexiones.ConectarBD"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/tours.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <%-- Traer header --%>
    <jsp:include page="header.jsp"/>
    
    <body>
        <h1 class="tCat">Crea recuerdos...</h1>
        
        <div class="contenedor">
            <div class="contenedor-paquetes">
                <!--Paquete-->
                <c:forEach var="p" items="${lista}">
                <div class="tour">
                    <img src="${pageContext.request.contextPath}/paquetes/${p.getImagen()}" alt="lugares"/>
                    <div class="info">
                        <h2>${p.getNombrePaquete()}</h2>
                        <p>${p.getDescripcionPaquete()}</p>
                        <div class="precio">
                            <p>S/.${p.getPrecioPaquete()}</p>
                        </div>
                        <button class="reservar">RESERVAR</button>   
                    </div>
                </div> 
                </c:forEach>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp"/>
</html>
