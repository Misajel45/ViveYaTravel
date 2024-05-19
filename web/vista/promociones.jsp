<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- Importación de biblioteca de etiquetas JSTL -->
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
    <jsp:include page="header.jsp"/>
    <body>
        <h1 class="tCat">¡Aprovecha las promociones!</h1>
        <div class="contenedor">
            <div class="contenedor-paquetes">
                <!--Promociones-->
                <c:forEach var="o" items="${promociones}"> <!--Bucle para recorrer la lista-->
                <div class="tour">
                     <!-- Para obtener los datos -->
                    <img src="${pageContext.request.contextPath}/paquetes/${o.getImagen()}" alt="lugares"/>
                    <div class="info">
                        <h2>${o.getNombrePaquete()}</h2>
                        <p>${o.getDescripcionPaquete()}</p>
                        <div class="precio">
                            <p>S/.${o.getPrecioPaquete()}</p>
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
