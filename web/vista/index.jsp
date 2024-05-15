<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/carrusel.css" rel="stylesheet" type="text/css"/>
    </head>
    <jsp:include page="header.jsp"/>
    <body>
        <main>
        </main>

        <!-- carrusel de imagenes -->
        <div class="carrusel-body">
            <div class="contenedor-carrusel">
                <div class="carruseles" id="slider">
                    <section class="slider-section">
                        <img src="${pageContext.request.contextPath}/img/1.jpg" alt="Machu Pichu"/>
                    </section>
                    <section class="slider-section">
                        <img src="${pageContext.request.contextPath}/img/2.jpg" alt="Ica"/>
                    </section>
                    <section class="slider-section">
                        <img src="${pageContext.request.contextPath}/img/3.jpg" alt="Castillo de Chancay"/>
                    </section>
                </div>
                <div class="btn-left"><i class='bx bxs-chevron-left'></i></i></div>
                <div class="btn-right"><i class='bx bxs-chevron-right'></i></div>
            </div>
        </div>
        
    </body>
    <script src="${pageContext.request.contextPath}/js/carrusel.js" type="text/javascript"></script>
    <jsp:include page="footer.jsp"/>
</html>
