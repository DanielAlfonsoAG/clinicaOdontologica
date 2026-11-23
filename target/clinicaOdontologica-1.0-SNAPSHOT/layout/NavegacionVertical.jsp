
<%@page contentType="text/html" pageEncoding="UTF-8"%>
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-ellipsis"></i></div>
                                Menú Principal
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                             <%
                                 String rol = (String) request.getSession().getAttribute("rol");
                                 if ("Admin".equals(rol) || "Paciente".equals(rol)) {
                                    %>   
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                <i class="fa-solid fa-user-check"></i> Autenticacion
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="svUsuario"><i class="fa-solid fa-user"></i> Ver Usuarios</a>
                                    <a class="nav-link" href="altaUsuario.jsp"><i class="fa-solid fa-user"></i> Alta Usuarios</a>
                                    <a class="nav-link" href="password.jsp"><i class="fa-solid fa-passport"></i> Recuperar Contraseña</a>
                                </nav>
                            </div>
                            <% }%>
                            <% if ("Admin".equals(rol) || "Secretario".equals(rol) || "Odontologo".equals(rol) || "Paciente".equals(rol)) {
                                    %> 
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Pacientes
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="svPaciente">Ver Pacientes</a>
                                    <% if ("Admin".equals(rol)) {
                                    %> 
                                    <a class="nav-link" href="altaPaciente.jsp">Alta Pacientes</a>
                                    <% }%>
                                </nav>
                            </div>
                            <% }%>
                            <% if ("Admin".equals(rol) || "Secretario".equals(rol)) {
                                    %> 
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Odontologos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="svOdontologo">Ver odontologos</a>
                                    <% if ("Admin".equals(rol)) {
                                    %> 
                                    <a class="nav-link" href="altaOdontologo.jsp">Alta Odontologos</a>
                                    <% }%>
                                </nav>
                            </div>
                            <% }%>
                            <% if ("Admin".equals(rol) || "Secretario".equals(rol) || "Odontologo".equals(rol) || "Paciente".equals(rol)) {
                                    %> 
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseturnos" aria-expanded="false" aria-controls="collapseturnos">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Turnos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseturnos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="svTurno">Ver Turnos</a>
                                    <% if ("Admin".equals(rol) || "Secretario".equals(rol) || "Odontologo".equals(rol)) {
                                    %> 
                                    <a class="nav-link" href="altaTurno.jsp">Alta Turnos</a>
                                    <% }%>
                                </nav>
                            </div>
                            <% }%>
                            <% if ("Admin".equals(rol) || "Odontologo".equals(rol)) {
                                    %> 
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHorarios" aria-expanded="false" aria-controls="collapseHorarios">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Horarios
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseHorarios" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="svHorario">Ver Horarios</a>
                                    <a class="nav-link" href="altaHorario.jsp">Alta Horarios</a>
                                </nav>
                            </div>
                            <% }%>
                            <% if ("Admin".equals(rol) || "Secretario".equals(rol)) {
                                    %> 
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseResponsable" aria-expanded="false" aria-controls="collapseResponsable">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Acudientes
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseResponsable" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="svResponsable">Ver Acudientes</a>
                                    <a class="nav-link" href="altaResponsable.jsp">Alta Acudientes</a>
                                </nav>
                            </div>
                            <% }%>
                            <% if ("Admin".equals(rol)) {
                                    %> 
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSecretarios" aria-expanded="false" aria-controls="collapseSecretarios">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Secretarios
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSecretarios" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="svSecretario">Ver Secretarios</a>
                                    <a class="nav-link" href="altaSecretario.jsp">Alta Secretarios</a>
                                </nav>
                            </div>
                            <% }%>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">logueado como:</div>
                        <%=request.getSession().getAttribute("usuario")%>
                        <%=rol%>
                    </div>
                </nav>
