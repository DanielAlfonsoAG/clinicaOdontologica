
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="css/estilos.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <main>
        <!--Contenedor de todo-->
        <div class="contenedor_Todo">
        <!--Caja-->
            <div class="cajas">
                <!--Caja Izquierda-->
                <div class="caja__Izquierda-Login">
                    <h3>¿Ya tienes cuenta?</h3>
                    <p>Incia sesión para entrar en la página</p>
                    <button id="btn_iniciar-sesion">Iniciar Sesión</button>
                </div>
                <!--CajaDerecha-->
                <div class="caja__Derecha-Registro">
                    <h3>¿Aun no tienes una cuenta?</h3>
                    <p>Registrate para que puedas inciar sesión</p>
                    <button id="btn_registrarse">Registrate</button>
                </div>
            </div>
            <!--Contenedor de los formularios de registro y login-->
            <div class="contenedor__login-registro">
               <!--Formulario de Login-->
               
              <form action="svLogin" method="POST" class="formulario__login">
                <h2>Iniciar Sesión</h2>
                <input type="text" placeholder="Usuario" id="usuario" name="usuario" required>
                <input type="password" placeholder="Contraseña" id="contrasenia" name="contrasenia" required>
                <button type="submit">Entrar</button>
                <br>
                    <%
                       boolean error = (boolean) request.getSession().getAttribute("error");
                       if (error == true) {
                               %>
                                <div class="alert alert-danger" role="alert">
                                    El Usuario o la contraseña son incorrectos!
                                </div>
                                <%
                           }
                   %>
                  
              </form>
                        
                <!--Formulario de Registro-->
              <form action="svUsuario" method="POST" class="formulario__Registro">
                <h2>Registrarse</h2>
                <input type="text" placeholder="Usuario" name="nombreusuario" id="nombreusuario" required>
                <input type="password" placeholder="Contraseña" name="contrasenia" id="contrasenia" required>
                <select class="form-control" id="rol" name="rol" required>
                    <option value="">--- Selecciona ---</option>
                    <option value="Paciente">Paciente</option>
                </select>
                <button type="submit">Registrarse</button>
              </form>
            </div>
        </div>

    </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/JavaScript.js"></script>
    </body>
</html>

