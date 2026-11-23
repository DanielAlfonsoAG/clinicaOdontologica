<%@page import="logica.Usuario"%>
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
                                <h4>Alta Secretario</h4>
                            </div>
                            <div class="card-body">
                                <form action="svSecretario" method="POST">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "dni" id="dni" type="text" placeholder="Ingrese su dni" required/>
                                                        <label for="inputUser">DNI</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <select class="form-control" id="sector" name="sector" required>
                                                            <option value="">--- Seleccione---</option>
                                                            <option value="Usaquen">Usaquén</option>
                                                            <option value="Chapinero">Chapinero</option>
                                                            <option value="Kennedy">Kennedy</option>
                                                            <option value="Santa Fe">Santa Fe</option>
                                                            <option value="San Cristobal">San Cristobal</option>
                                                            <option value="Usme">Usme</option>
                                                            <option value="Tunjuelito">Tunjuelito</option>
                                                            <option value="Engativá">Engativá</option>
                                                            <option value="Barrios Unidos">Barrios Unidos</option>
                                                            <option value="Bosa">Bosa</option>
                                                            <option value="Suba">Suba</option>
                                                            <option value="Fontibon">Fontibón</option>
                                                            <option value="Teusaquillo">Teusaquillo</option>
                                                            <option value="Antonio Nariño">Antonio Nariño</option>
                                                            <option value="Los Martires">Los Mártires</option>
                                                            <option value="Puente Aranda">Puente Aranda</option>
                                                            <option value="La Candelaria">La Candelaria</option>
                                                            <option value="Rafael Uribe Uribe">Rafael Uribe Uribe</option>
                                                            <option value="Ciudad Bolívar">Ciudad Bolívar</option>
                                                            <option value="Sumapaz">Sumapaz</option>
                                                        </select>
                                                        <label for="inputUser">Sector</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "nombre" id="nombre" type="text" placeholder="Ingrese su nombre" required/>
                                                        <label for="inputUser">Nombre</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "apellidos" id="apellidos" type="text" placeholder="Ingrese sus apellidoss" required/>
                                                        <label for="inputPassword">Apellidos</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-4">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "telefono" id="telefono" type="text" placeholder="Ingrese su nombre" required/>
                                                        <label for="inputUser">Telefono/Celular</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "direccion" id="direccion" type="text" placeholder="Ingrese sus apellidoss" required/>
                                                        <label for="inputUser">Direccion</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "fecha_nac" id="fecha_nac" type="date" placeholder="Ingrese sus apellidoss" required/>
                                                        <label for="inputUser">Fecha de nacimiento</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <%
                                                        Controladora control = new Controladora();
                                                        List<Usuario>listaUsuarios = new ArrayList<Usuario>();
                                                        listaUsuarios = control.getUsuario();
                                                        %>    
                                                        <select class="form-control" id="usuario" name="usuario" required>
                                                            <option value="">--- Seleccione---</option>
                                                            <%
                                                                for (Usuario usu: listaUsuarios) {
                                                                       %>
                                                                       <option value="<%=usu.getId_usuario()%>"><%=usu.getNombreusuario()%></option>
                                                                       <%
                                                                    }
                                                            %>
                                                        </select>    
                                                        <label for="inputUser">asignar usuario</label>
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
                                                            <button class="btn btn-primary btn-block" type="submit">Crear Secretario</button>
                                                        </div>
                                                   </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="mt-4 md-0">
                                                        <div class="d-grid">
                                                            <a class="btn btn-danger btn-block" href="svSecretario">Cancelar</a>
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

