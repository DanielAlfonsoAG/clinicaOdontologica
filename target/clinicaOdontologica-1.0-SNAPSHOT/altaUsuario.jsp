
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="layout/header.jsp"/>
    <body class="sb-nav-fixed">
        
        <%@include file="layout/validarSesion.jsp"%>
        <jsp:include page="layout/NavegacionHorizontal.jsp"/>   
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="layout/NavegacionVertical.jsp"/>  
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Odontologia Saenz</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                Dientes cuidados vida arreglada
                                <h4>Alta Usuarios</h4>
                            </div>
                            <div class="card-body">
                                
                                <form action="svUsuario" method="POST">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "nombreusuario" id="nombreusuario" type="text" placeholder="Ingrese el nombre del usuario" required/>
                                                        <label for="inputUser">Nombre Usuario</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "contrasenia" id="contrasenia" type="password" placeholder="Ingrese la contraseña" required/>
                                                        <label for="inputPassword">Contraseña</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-3">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" id="rol" name="rol" required>
                                                            <option value="">--- Selecciona ---</option>
                                                            <option value="Admin">Admin</option>
                                                            <option value="Odontologo">Odontologo</option>
                                                            <option value="Secretario">Secretario</option>
                                                            <option value="Paciente">Paciente</option>
                                                        </select>
                                                   </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-3">
                                                    <div class="mt-4 md-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block" type="submit">Crear Usuario</button>
                                                        </div>
                                                   </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="mt-4 md-0">
                                                        <div class="d-grid">
                                                            <a class="btn btn-danger btn-block" href="svUsuario">Cancelar</a>
                                                        </div>
                                                   </div>
                                                </div>
                                            </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="layout/footer.jsp"/>
            </div>
        </div>
        <jsp:include page="layout/scripts.jsp"/>
    </body>
</html>

