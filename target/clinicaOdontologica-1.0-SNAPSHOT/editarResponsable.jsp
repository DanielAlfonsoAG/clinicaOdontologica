
<%@page import="logica.Responsable"%>
<%@page import="logica.Usuario"%>
<%@page import="logica.Horario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Controladora"%>
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
                            </div>
                            <div class="card-body">
                                <p>
                                    Seccion para modificar los datos de un usuario en el sistema
                                </p>
                                <% Responsable respon = (Responsable) request.getSession().getAttribute("responEditar");%>
                                <form action="svEditresponsable" method="POST">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "dni" id="dni" type="text" value="<%=respon.getDni()%>" placeholder="Ingrese su dni" required/>
                                                        <label for="inputUser">DNI</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <select class="form-control" id="responsable" name="responsable" value="<%=respon.getTipo_responsable()%>" required>
                                                            <option value="">--- Seleccione---</option>
                                                            <option value="Padre">Padre</option>
                                                            <option value="Madre">Madre</option>
                                                            <option value="Hermanos">Hermanos</option>
                                                            <option value="Familia del Padre">Familia del Padre</option>
                                                            <option value="Familia de la madre">Familia de la madre</option>
                                                            <option value="Familia externa">Familia externa</option>
                                                        </select>
                                                        <label for="inputUser">Responsable</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "nombre" id="nombre" type="text" value="<%=respon.getNombre()%>" placeholder="Ingrese su nombre" required/>
                                                        <label for="inputUser">Nombre</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "apellidos" id="apellidos" type="text" value="<%=respon.getApellidos()%>" placeholder="Ingrese sus apellidoss" required/>
                                                        <label for="inputPassword">Apellidos</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-4">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "telefono" id="telefono" type="text" value="<%=respon.getTelefono()%>" placeholder="Ingrese su nombre" required/>
                                                        <label for="inputUser">Telefono/Celular</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "direccion" id="direccion" type="text" value="<%=respon.getDireccion()%>" placeholder="Ingrese sus apellidoss" required/>
                                                        <label for="inputUser">Direccion</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "fecha_nac" id="fecha_nac" type="date" value="<%=respon.getFecha_nac()%>" placeholder="Ingrese sus apellidoss" required/>
                                                        <label for="inputUser">Fecha de nacimiento</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating">
                                                        <% 
                                                            String errorMessage = (String) request.getAttribute("errorMessage");
                                                            if (errorMessage != null) {
                                                        %>

                                                        <div style="color: red; font-weight: bold;">
                                                            <%=errorMessage %>
                                                        </div>
                                                        <% 
                                                            }
                                                        %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-3">
                                                    <div class="mt-4 md-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block" type="submit">Editar Responsable</button>
                                                        </div>
                                                   </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="mt-4 md-0">
                                                        <div class="d-grid">
                                                            <a class="btn btn-danger btn-block" href="svResponsable">Cancelar</a>
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

