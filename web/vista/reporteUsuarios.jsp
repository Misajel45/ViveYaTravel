<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Reporte usuarios</h1>
        <c:forEach var="u" items="${repUsuario}">
            <span>${u.getNombre()}</span>
        </c:forEach>
        <table class="tablaRep">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>NOMBRE</td>
                    <td>APELLIDO</td>
                    <td>TELÉFONO</td>
                    <td>DNI</td>
                    <td>CORREO</td>
                    <td>CONTRASEÑA</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${repUsuario}">
                <tr>
                    <td>${u.getIdUsuario()}</td>
                    <td>${u.getNombre()}</td>
                    <td>${u.getApellido()}</td>
                    <td>${u.getNroCelular()}</td>
                    <td>${u.getNroDni()}</td>
                    <td>${u.getCorreoElectronico()}</td>
                    <td>${u.getClave()}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
