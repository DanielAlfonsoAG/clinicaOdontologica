
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Responsable"%>
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
                                <h4>Alta Pacientes</h4>
                            </div>
                            <div class="card-body">
                                <form action="svPaciente" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <div class="form-floating">
                                                <input class="form-control" name = "dni" id="dni" type="text" placeholder="Ingrese su dni" required/>
                                                <label for="inputUser">DNI</label>
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
                                                <input class="form-control" name = "apellidos" id="apellidos" type="text" placeholder="Ingrese sus apellidos" required/>
                                                <label for="inputPassword">Apellidos</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name = "telefono" id="telefono" type="text" placeholder="Ingrese su telefono" required/>
                                                <label for="inputUser">Telefono/Celular</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name = "direccion" id="direccion" type="text" placeholder="Ingrese su direccion" required/>
                                                <label for="inputUser">Direccion</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name = "fecha_nac" id="fecha_nac" type="date" placeholder="Ingrese su fecha de nacimiento" required/>
                                                <label for="inputUser">Fecha de Nacimiento</label>
                                            </div>
                                        </div>
                                        <input type="hidden" id="esMayorDeEdad" name="esMayorDeEdad" value="false">
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select class="form-control" id="eps" name="eps" required>
                                                    <option value="">--- Selecciona ---</option>
                                                    <option value="true">Tiene</option>
                                                    <option value="false">No tiene</option>
                                                </select>
                                                <label for="inputUser">EPS</label>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <select class="form-control" id="tiposangre" name="tiposangre" required>
                                                    <option value="">--- Selecciona ---</option>
                                                    <option value="A+">A+</option>
                                                    <option value="B+">B+</option>
                                                    <option value="AB+">AB+</option>
                                                    <option value="O+">O+</option>
                                                    <option value="A-">A-</option>
                                                    <option value="B-">B-</option>
                                                    <option value="AB-">AB-</option>
                                                    <option value="O-">O-</option>
                                                </select>
                                                <label for="inputUser">Tipo de Sangre y RH</label>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                    String esMayorDeEdadParam = request.getParameter("esMayorDeEdad");
                                    boolean esMayorDeEdad = esMayorDeEdad = Boolean.parseBoolean(esMayorDeEdadParam); // Valor por defecto
                                    if (esMayorDeEdadParam == null) {
                                        esMayorDeEdad = false;
                                    }
                                    %>  
                                    <% if (!esMayorDeEdad) { %>
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <%  
                                                    Controladora control = new Controladora();
                                                    List<Responsable> listaResponsable = new ArrayList<Responsable>();
                                                    listaResponsable = control.getResponsable();
                                                %>    
                                                <select class="form-control" id="responsable" name="responsable" required>
                                                    <option value="">--- Seleccione---</option>
                                                    <%
                                                        for (Responsable res : listaResponsable) {
                                                    %>
                                                    <option value="<%=res.getId()%>"><%=res.getNombre()%> <%=res.getApellidos()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                                <label for="inputUser">Responsable</label>
                                            </div>
                                        </div>
                                    </div>
                                                <% } %>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <div class="form-floating">
                                                <%
                                                    String errorMessage = (String) request.getAttribute("errorMessage");
                                                    if (errorMessage != null) {
                                                %>

                                                <div style="color: red; font-weight: bold;">
                                                    <%=errorMessage%>
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
                                                    <button class="btn btn-primary btn-block" type="submit">Crear Paciente</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="mt-4 md-0">
                                                <div class="d-grid">
                                                    <a class="btn btn-danger btn-block" href="svPaciente">Cancelar</a>
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
            <script src="js/Date.js"></script>
        <jsp:include page="layout/scripts.jsp"/>
    </body>
</html>

