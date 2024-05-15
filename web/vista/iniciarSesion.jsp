<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/inicioSesion.css" rel="stylesheet" type="text/css"/>
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <div class="formulario">
        <h1>Inicio de sesion</h1>
        <form method="post">
            <div class="user">
                <input type="text" required>
                <label>Correo Electronico</label>
            </div>
            <div class="user">
                <input type="password" required>
                <label>Contraseña</label>
            </div>
            <div class="recordar">¿Olvidaste tu contraseña?</div>
            <input type="submit" value="iniciar">
            <div class="registrarse">
                Crear <a href="#">cuenta</a>
            </div>
        </form>
        </div>
    </body>
</html>
