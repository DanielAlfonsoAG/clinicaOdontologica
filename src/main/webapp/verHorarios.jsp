
<%@page import="java.util.List"%>
<%@page import="logica.Horario"%>
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
                                            <th>Fecha de inicio</th>
                                            <th>Fecha de fin</th>
                                            <th width="10%">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Fecha de inicio</th>
                                            <th>Fecha de fin</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <% List<Horario>listaHorarios = (List) request.getSession().getAttribute("listaHorarios");%>
                                    <tbody>
                                        <% for (Horario hor: listaHorarios){%>
                                        <tr>
                                            <td><%=hor.getId_horario()%></td>
                                            <td><%=hor.getHorario_inicio()%></td>
                                            <td><%=hor.getHorario_fin()%></td>
                                            <td>
                                                <form name="eliminar" action="svEliminarhorario" method="POST" style="float: left; margin-right: 10px">
                                                    <button class="btn btn-outline-danger btn-block" title="Eliminar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=hor.getId_horario()%>">
                                                </form>
                                                <form name="editar" action="svEdithorario" method="GET">
                                                    <button class="btn btn-outline-info btn-block" title="Editar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=hor.getId_horario()%>">
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

