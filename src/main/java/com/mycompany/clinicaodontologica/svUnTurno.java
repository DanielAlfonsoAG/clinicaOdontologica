/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.clinicaodontologica;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Turno;

/**
 *
 * @author agude
 */
@WebServlet(name = "svUnTurno", urlPatterns = {"/svUnTurno"})
public class svUnTurno extends HttpServlet {
    
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String turno =request.getParameter("id");
        
        if (turno!= null && !turno.isEmpty()) {
            int idTurno = Integer.parseInt(turno);
            Turno tur = control.traerTurno(idTurno);
            HttpSession misession = request.getSession();
            misession.setAttribute("listaTurnos", tur);
            response.sendRedirect("verUnTurno.jsp");
        }
        else {
    // Manejar el caso donde el parámetro es nulo o vacío
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro idUsu es inválido o no proporcionado.");
}
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
