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
import logica.Usuario;
import logica.Controladora;

/**
 *
 * @author agude
 */
@WebServlet(name = "svUsuario", urlPatterns = {"/svUsuario"})
public class svUsuario extends HttpServlet {
    
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario>listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios= control.getUsuario();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaUsuarios", listaUsuarios);
        response.sendRedirect("verUsuarios.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreusuario = request.getParameter("nombreusuario");
        String contrasenia = request.getParameter("contrasenia");
        String rol = request.getParameter("rol");
        
        control.crearUsuario(nombreusuario, contrasenia, rol);
        response.sendRedirect("svUsuario");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
