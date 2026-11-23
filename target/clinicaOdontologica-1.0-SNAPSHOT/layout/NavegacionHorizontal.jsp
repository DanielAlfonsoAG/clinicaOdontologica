
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="logica.Turno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.jsp">Clinica Odontologica</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Buscar..." aria-label="Buscar..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <%
            Controladora control = new Controladora();
            List<Turno> ListaEventos = new ArrayList<Turno>();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime fecha = LocalDateTime.now();
            String fechaFormateada = fecha.format(formatter);
            if (request.getSession().getAttribute("id_usuario") != null) {
                int idUsu = (int) request.getSession().getAttribute("id_usuario");
                ListaEventos = control.listaTurnosHoy(idUsu, fechaFormateada);
            }
            int nEventos = ListaEventos.size();

        %>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell" aria-hidden="true"></i>
                <%
                if (nEventos > 0) {%>
                <span class="badge badge-danger"><%= nEventos%></span> <!-- Muestra el número de notificaciones -->
                <% } %>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <% if (nEventos == 0) { %>
                <li><span class="dropdown-item">No hay notificaciones</span></li>
                    <% } else { %>
                    <%for (Turno tur1 : ListaEventos) {%>
                <li>
                    <form class="dropdown-item" name="MiCaso" action="svUnTurno" method="POST">
                        <button class="dropdown-item " title="Editar Registro">
                            <strong>Caso ID:</strong> <%= tur1.getId_turno()%> <br>
                            <strong>Fecha:</strong> <%= tur1.getFecha()%> <br>
                            <strong>Odontologo</strong> <%= tur1.getOdonto().getNombre()%> <br>
                            <strong>Paciente</strong> <%= tur1.getPacien().getNombre()%>
                        </button>
                        <input type="Hidden" name="id" value="<%=tur1.getId_turno()%>">
                    </form>
                </li>
                <li><hr class="dropdown-divider"></li>
                    <% } %>
                    <% }%>
            </ul>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i><%=request.getSession().getAttribute("usuario")%></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <form name="editar" action="svEditusu" method="GET">
                    <button class="dropdown-item" title="Editar Registro">
                        Editar Perfil
                    </button>
                    <input type="Hidden" name="id" value="<%=request.getSession().getAttribute("id_usuario")%>">
                </form>
                <form name="MisCasos" action="svMiTurno" method="POST">
                    <button class="dropdown-item" title="Editar Registro">
                        Mis Turnos
                    </button>
                    <input type="Hidden" name="id" value="<%=request.getSession().getAttribute("id_usuario")%>">
                </form>
                <li><a class="dropdown-item" href="svLogin">Cerrar sesión</a></li>
            </ul>
        </li>
    </ul>
</nav>
