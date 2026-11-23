
<%@page import="logica.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Horario"%>
<%@page import="logica.Controladora"%>
<%@page import="java.util.List"%>
<%@page import="logica.Odontologo"%>
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
                                <% Odontologo odont = (Odontologo) request.getSession().getAttribute("odontEditar");%>
                                
                                <form action="svEditodonto" method="POST">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "dni" id="dni" type="text" placeholder="Ingrese su dni" value="<%=odont.getDni()%>" required/>
                                                        <label for="inputUser">DNI</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <select class="form-control" id="especialidad" name="especialidad" value="<%=odont.getEspecialidad()%>" required>
                                                            <option value="">--- Seleccione---</option>
                                                            <option value="Odontologo">Odontologo</option>
                                                        </select>
                                                        <label for="inputUser">Especialidad</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "nombre" id="nombre" type="text" placeholder="Ingrese su nombre" value="<%=odont.getNombre()%>" required/>
                                                        <label for="inputUser">Nombre</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "apellidos" id="apellidos" type="text" placeholder="Ingrese sus apellidoss" value="<%=odont.getApellidos()%>" required/>
                                                        <label for="inputPassword">Apellidos</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-4">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "telefono" id="telefono" type="text" placeholder="Ingrese su nombre" value="<%=odont.getTelefono()%>" required/>
                                                        <label for="inputUser">Telefono/Celular</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "direccion" id="direccion" type="text" placeholder="Ingrese sus apellidoss" value="<%=odont.getDireccion()%>" required/>
                                                        <label for="inputUser">Direccion</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "fecha_nac" id="fecha_nac" type="date" placeholder="Ingrese sus apellidoss" value="<%=odont.getFecha_nac()%>" required/>
                                                        <label for="inputUser">fecha de nacimiento</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <%
                                                        Controladora control = new Controladora();
                                                        List<Horario>listaHorarios = new ArrayList<Horario>();
                                                        listaHorarios = control.getHorario();
                                                        %>     
                                                        <select class="form-control" id="horario" name="horario" value="<%=odont.getUnHorario()%>" required>
                                                            <option></option>
                                                            <%
                                                                for (Horario hor: listaHorarios) {
                                                                       %>
                                                                       <option value="<%=hor.getId_horario()%>"><%=hor.getHorario_inicio()%> <%=hor.getHorario_fin()%></option>
                                                                       <%
                                                                    }
                                                            %>
                                                        </select>
                                                        <label for="inputUser">asignar horarios</label>    
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <%
                                                        List<Usuario>listaUsuarios = new ArrayList<Usuario>();
                                                        listaUsuarios = control.getUsuario();
                                                        %>    
                                                        <select class="form-control" id="usuario" value="<%=odont.getUnUsuario()%>" name="usuario" required>
                                                            <option></option>
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
                                                            <button class="btn btn-primary btn-block" type="submit">Editar Odontologo</button>
                                                        </div>
                                                   </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="mt-4 md-0">
                                                        <div class="d-grid">
                                                            <a class="btn btn-danger btn-block" href="svOdontologo">Cancelar</a>
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

