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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
                            </div>
                            <!-- Boton modal -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">+</button>
                            <!--Modal--> 
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-scrollables">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">${p.getNombrePaquete()}</h1>
                                        </div>
                                        <div class="modal-body">
                                            <p>${p.getDetallePaquete()}</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                            <button type="button" class="btn btn-primary">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>                        
                    </div> 
                </c:forEach>
            </div>
        </div>
    </body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Traer el footer -- Incluir contenido JSP -->
    <jsp:include page="footer.jsp"/>
</html>
