
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
                                            <th>Tipo de Responsable</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Direccion</th>
                                            <th>Telefono</th>
                                            <th>Fecha de nacimiento</th>
                                            <th width="10%">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Dni</th>
                                            <th>Tipo de Responsable</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Direccion</th>
                                            <th>Telefono</th>
                                            <th>Fecha de nacimiento</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <% List<Responsable>listaResponsables = (List) request.getSession().getAttribute("listaResponsables");%>
                                    <tbody>
                                        <% for (Responsable Res: listaResponsables){%>
                                        <tr>
                                            <td><%=Res.getId()%></td>
                                            <td><%=Res.getDni()%></td>
                                            <td><%=Res.getTipo_responsable()%></td>
                                            <td><%=Res.getNombre()%></td>
                                            <td><%=Res.getApellidos()%></td>
                                            <td><%=Res.getDireccion()%></td>
                                            <td><%=Res.getTelefono()%></td>
                                            <td><%=Res.getFecha_nac()%></td>
                                            <td>
                                                <form name="eliminar" action="svEliminarrespon" method="POST" style="float: left; margin-right: 10px">
                                                    <button class="btn btn-outline-danger btn-block" title="Eliminar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=Res.getId()%>">
                                                </form>
                                                <form name="editar" action="svEditrespon" method="GET">
                                                    <button class="btn btn-outline-info btn-block" title="Editar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=Res.getId()%>">
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

