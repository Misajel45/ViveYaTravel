<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- Importación de biblioteca de etiquetas JSTL -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tours</title>
        <%--Referenciar los estilos CSS --%>
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
                <!--Paquetes-->               
                <c:forEach var="p" items="${lista}"> <!--Bucle para recorrer la lista-->
                <div class="tour">  <!-- Contenedor -->
                    <img src="${pageContext.request.contextPath}/paquetes/${p.getImagen()}" alt="lugares"/>
                    <div class="info">
                        <!-- Para obtener los datos -->
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
    <!-- Traer el footer -- Incluir contenido JSP -->
    <jsp:include page="footer.jsp"/>
</html>
