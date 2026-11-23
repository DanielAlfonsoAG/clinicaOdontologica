/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.clinicaodontologica;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
@WebServlet(name = "svEditturn", urlPatterns = {"/svEditturn"})
public class svEditturn extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
        Turno turn = control.traerTurno(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("turnoEditar", turn);
    response.sendRedirect("editarTurno.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String tratamiento = request.getParameter("tratamiento");
        int idOdonto = Integer.parseInt(request.getParameter("odontologo"));
        int idPacien = Integer.parseInt(request.getParameter("paciente"));
        
        Odontologo odont = control.traerOdontologo(idOdonto);
        Paciente pacien = control.traerPaciente(idPacien);
        String errorMessage = null;
        //En esta seccion nos ayuda a validar que los datos no tengan fechas anteriores, que la hora de inicio y fin sean coherentes y 
        //que en el espacio de trabajo se tenga que seleccionar una parte de su contenido osea que no este vacio.
        try {
            LocalDate fechas = LocalDate.parse(fecha, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalTime horas = LocalTime.parse(hora,DateTimeFormatter.ISO_LOCAL_TIME);
            LocalDateTime fechaHoraReserva = LocalDateTime.of(fechas, horas);
            LocalDateTime fecha_hoy = LocalDateTime.now();
            
            if (fechaHoraReserva.isBefore(fecha_hoy)) {
                errorMessage = "La fecha del tratamiento no puede ser antes de la fecha actual.";
            }
        //generamos los mensajes de error de la fecha
        } catch (NumberFormatException  e) {
            errorMessage = "La fecha ingresada es inválida. Asegúrate de ingresar una fecha válida.";
        }
        //Enviamos el error al index
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher Respuesta_Error = request.getRequestDispatcher("editarTurno.jsp");
            Respuesta_Error.forward(request, response);
        }
        else{
            Turno turn = (Turno) request.getSession().getAttribute("turnoEditar");

            turn.setFecha(fecha);
            turn.setHora(hora);
            turn.setTratamiento(tratamiento);
            turn.setOdonto(odont);
            turn.setPacien(pacien);

            control.editarTurno(turn);
            response.sendRedirect("svTurno");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
