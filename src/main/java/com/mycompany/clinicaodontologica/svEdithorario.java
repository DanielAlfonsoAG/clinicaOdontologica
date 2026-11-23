/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.clinicaodontologica;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Turno;
import logica.Responsable;

/**
 *
 * @author agude
 */
@WebServlet(name = "svEdithorario", urlPatterns = {"/svEdithorario"})
public class svEdithorario extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
        Horario hor = control.traerHorario(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("horarioEditar", hor);
    response.sendRedirect("editarHorario.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String horario_ini = request.getParameter("horarioini");
        String horario_fin = request.getParameter("horariofin");
        String errorMessage = null;
        try {
            LocalDateTime fecha_ini = LocalDateTime.parse(horario_ini, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            LocalDateTime fecha_fin = LocalDateTime.parse(horario_fin, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            LocalDateTime fecha_hoy = LocalDateTime.now();
            
            if (fecha_ini.isBefore(fecha_hoy) || fecha_fin.isBefore(fecha_hoy)) {
                errorMessage = "El inicio del horario o el fin del horario no puede ser antes de la fecha actual.";
            }
            if (fecha_fin.isBefore(fecha_ini)) {
                errorMessage = "El inicio del horario no puede ser despues del final del horario";
            }
        //generamos los mensajes de error de la fecha
        } catch (NumberFormatException  e) {
            errorMessage = "La fecha ingresada es inválida. Asegúrate de ingresar una fecha válida.";
        }
        //Enviamos el error al index
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher Respuesta_Error = request.getRequestDispatcher("editarHorario.jsp");
            Respuesta_Error.forward(request, response);
        }
        else{
            Horario hor = (Horario) request.getSession().getAttribute("HorarioEditar");
            hor.setHorario_inicio(horario_ini);
            hor.setHorario_fin(horario_fin);
        control.editarHorario(hor);
        response.sendRedirect("svHorario");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
