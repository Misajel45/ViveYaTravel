<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
    </head>
    <body>
        <div class="formularioRegistro">
            <h1>Registrarse</h1>
            <p>Es rápido y fácil</p>
            <form  method="post">
                <div class="registro">
                    <input type="text" name="nombre" id="nombre" required>
                    <label>Nombre</label>
                </div>
                <div class="registro">
                    <input type="text" name="apellido" id="apellido" required>
                    <label>Apellido</label>
                </div>
                <div class="registro">
                    <input type="text" name="celular" id="celular" required>
                    <label>Celular</label>
                </div>
                <div class="registro">
                    <input type="text" name="dni" id="dni" required>
                    <label>Numero de DNI</label>
                </div>
                <div class="registro">
                    <input type="text" name="correoElectronico" id="correoElectronico" required>
                    <label>CorreoElectronico</label>
                </div>
                <div class="registro">
                    <input type="password" name="password" id="password" required>
                    <label>Contraseña</label>
                </div>
                <input type="submit" name="registrar" id="Registrar" value="iniciar">
            </form>
        </div>
    </body>
</html>
