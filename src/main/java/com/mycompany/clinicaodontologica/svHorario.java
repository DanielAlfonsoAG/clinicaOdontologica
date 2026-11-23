/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.clinicaodontologica;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Horario;
import logica.Controladora;

/**
 *
 * @author agude
 */
@WebServlet(name = "svHorario", urlPatterns = {"/svHorario"})
public class svHorario extends HttpServlet {
    
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Horario>listaHorarios = new ArrayList<Horario>();
        listaHorarios= control.getHorario();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaHorarios", listaHorarios);
        response.sendRedirect("verHorarios.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            RequestDispatcher Respuesta_Error = request.getRequestDispatcher("altaHorario.jsp");
            Respuesta_Error.forward(request, response);
        }
        else{
        control.crearHorario(horario_ini, horario_fin);
        response.sendRedirect("svHorario");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
