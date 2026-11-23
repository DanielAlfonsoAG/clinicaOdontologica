
<%@page import="logica.Secretario"%>
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
                                            <th>Sector</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Direccion</th>
                                            <th>Telefono</th>
                                            <th>Fecha de nacimiento</th>
                                            <th>Usuarios</th>
                                            <th width="10%">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Dni</th>
                                            <th>Sector</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Direccion</th>
                                            <th>Telefono</th>
                                            <th>Fecha de nacimiento</th>
                                            <th>Usuarios</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <% List<Secretario>listaSecretarios = (List) request.getSession().getAttribute("listaSecretarios");%>
                                    <tbody>
                                        <% for (Secretario secre: listaSecretarios){%>
                                        <tr>
                                            <td><%=secre.getId()%></td>
                                            <td><%=secre.getDni()%></td>
                                            <td><%=secre.getSector()%></td>
                                            <th><%=secre.getNombre()%></th>
                                            <td><%=secre.getApellidos()%></td>
                                            <td><%=secre.getDireccion()%></td>
                                            <td><%=secre.getTelefono()%></td>
                                            <td><%=secre.getFecha_nac()%></td>
                                            <td><%=secre.getUnUsuario().getNombreusuario()%></td>
                                            <td>
                                                <form name="eliminar" action="svEliminarsecretario" method="POST" style="float: left; margin-right: 10px">
                                                    <button class="btn btn-outline-danger btn-block" title="Eliminar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=secre.getId()%>">
                                                </form>
                                                <form name="editar" action="svEditsecretario" method="GET">
                                                    <button class="btn btn-outline-info btn-block" title="Editar Registro">
                                                        
                                                    </button>
                                                    <input type="Hidden" name="id" value="<%=secre.getId()%>">
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

