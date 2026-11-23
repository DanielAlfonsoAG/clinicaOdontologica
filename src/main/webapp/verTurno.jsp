
<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
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
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Tratamiento</th>
                                            <th>Nombre y Apellidos del Odontologo</th>
                                            <th>Nombre y Apellidos del Paciente</th>
                                            <th width="10%">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Tratamiento</th>
                                            <th>Nombre y Apellidos del Odontologo</th>
                                            <th>Nombre y Apellidos del Paciente</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <% List<Turno>listaTurnos = (List) request.getSession().getAttribute("listaTurnos");%>
                                    <tbody>
                                        <% for (Turno tur: listaTurnos){%>
                                        <tr>
                                            <td><%=tur.getId_turno()%></td>
                                            <td><%=tur.getFecha()%></td>
                                            <td><%=tur.getHora()%></td>
                                            <td><%=tur.getTratamiento()%></td>
                                            <td><%=tur.getOdonto().getNombre()%> <%=tur.getOdonto().getApellidos()%></td>
                                            <td><%=tur.getPacien().getNombre()%> <%=tur.getPacien().getApellidos()%></td>
                                            <td>
                                                <% String rol = (String) request.getSession().getAttribute("rol");
                                                    if ("Admin".equals(rol) || "Secretario".equals(rol) || "Odontologo".equals(rol)) {
                                                %>
                                                <form name="eliminar" action="svEliminarturno" method="POST" style="float: left; margin-right: 10px">
                                                    <button class="btn btn-outline-danger btn-block" title="Eliminar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=tur.getId_turno()%>">
                                                </form>
                                                <% }%>  
                                                <% if ("Admin".equals(rol) || "Secretario".equals(rol)) {
                                                %>
                                                <form name="editar" action="svEditturn" method="GET">
                                                    <button class="btn btn-outline-info btn-block" title="Editar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=tur.getId_turno()%>">
                                                </form>
                                                 <% }%>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
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

