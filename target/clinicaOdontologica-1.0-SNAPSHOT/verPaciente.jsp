
<%@page import="logica.Paciente"%>
<%@page import="logica.Responsable"%>
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
                                            <th>Dni</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Direccion</th>
                                            <th>Telefono</th>
                                            <th>Fecha de nacimiento</th>
                                            <th>Tipo de sangre</th>
                                            <th>Eps</th>
                                            <th>Responsable</th>
                                            <th width="10%">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Dni</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Direccion</th>
                                            <th>Telefono</th>
                                            <th>Fecha de nacimiento</th>
                                            <th>Tipo de sangre</th>
                                            <th>Eps</th>
                                            <th>Responsable</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <% 
//                                        Responsable res = (Responsable) request.getAttribute("responsable");
                                        List<Paciente>listaPacientes = (List) request.getSession().getAttribute("listaPacientes");
                                    %>
                                    <tbody>
                                        <% for (Paciente pac: listaPacientes ){%>
                                        <tr>
                                            <td><%=pac.getId()%></td>
                                            <td><%=pac.getDni()%></td>
                                            <td><%=pac.getNombre()%></td>
                                            <td><%=pac.getApellidos()%></td>
                                            <td><%=pac.getDireccion()%></td>
                                            <td><%=pac.getTelefono()%></td>
                                            <td><%=pac.getFecha_nac()%></td>
                                            <td><%=pac.getTipo_sangre()%></td>
                                            <td><%=pac.isEps()%></td>
                                            <td><%=pac.getUnResponsable().getNombre()%></td>
                                            <td>
                                                <% String rol = (String) request.getSession().getAttribute("rol");
                                                    if ("Admin".equals(rol)) {
                                                %> 
                                                <form name="eliminar" action="svEliminarpacien" method="POST" style="float: left; margin-right: 10px">
                                                    <button class="btn btn-outline-danger btn-block" title="Eliminar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id_pacien" id="id_pacien" value="<%=pac.getId()%>">
                                                </form>
                                                <% }%>
                                                <form name="editar" action="svEditpacien" method="GET">
                                                    <button class="btn btn-outline-info btn-block" title="Editar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id_pacien" id="id_pacien" value="<%=pac.getId()%>">
                                                </form>
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

