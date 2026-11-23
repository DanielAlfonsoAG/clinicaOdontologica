
<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
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
                                <h4>Alta Turnos</h4>
                            </div>
                            <div class="card-body">
                                <form action="svTurno" method="POST">
                                            <div class="row mb-3">
                                                <div class="col-md-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" name = "fecha" id="fecha" type="date" placeholder="Ingrese la fecha" required/>
                                                        <label for="inputUser">Fecha del turno</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-3">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name = "hora" id="hora" type="time" placeholder="Ingrese su nombre" required/>
                                                        <label for="inputUser">Hora del turno</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" id="tratamiento" name="tratamiento" required>
                                                            <option value="">--- Selecciona ---</option>
                                                            <option value="Operatoria">Operatoria</option>
                                                            <option value="Exodoncia">Exodoncia</option>
                                                            <option value="Endodoncia">Endodoncia</option>
                                                            <option value="Rehabilitación">Rehabilitación</option>
                                                            <option value="sellantes y fluor">sellantes y fluor</option>
                                                        </select>
                                                        <label for="inputUser">Tratamiento</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                    <%
                                                    Controladora control = new Controladora();
                                                    List<Odontologo>listaOdontologos = new ArrayList<Odontologo>();
                                                    listaOdontologos = control.getOdontologos();
                                                    %>    
                                                        <select class="form-control" id="id_odonto" name="odontologo" required>
                                                            <option value="">--- Seleccione---</option>
                                                            <%
                                                                for (Odontologo odont: listaOdontologos) {
                                                                       %>
                                                                       <option value="<%=odont.getId()%>"><%=odont.getNombre()%> <%=odont.getApellidos()%></option>
                                                                       <%
                                                                    }
                                                            %>
                                                        </select>
                                                        <label for="inputUser">Odontologo</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                    <%
                                                    List<Paciente>listaPacientes = new ArrayList<Paciente>();
                                                    listaPacientes = control.getPacientes();
                                                    %>    
                                                        <select class="form-control" id="id_pacien" name="paciente" required>
                                                            <option value="">--- Seleccione---</option>
                                                            <%
                                                                for (Paciente pac: listaPacientes) {
                                                                       %>
                                                                       <option value="<%=pac.getId()%>"><%=pac.getDni()%> - <%=pac.getNombre()%> <%=pac.getApellidos()%></option>
                                                                       <%
                                                                    }
                                                            %>
                                                        </select>
                                                        <label for="inputUser">Paciente</label>
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
                                                            <button class="btn btn-primary btn-block" type="submit">Crear Turno</button>
                                                        </div>
                                                   </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="mt-4 md-0">
                                                        <div class="d-grid">
                                                            <a class="btn btn-danger btn-block" href="svTurno">Cancelar</a>
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

