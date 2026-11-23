/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.clinicaodontologica;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;

/**
 *
 * @author agude
 */
@WebServlet(name = "svEditusu", urlPatterns = {"/svEditusu"})
public class svEditusu extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
        Usuario usu = control.traerUsuario(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("usuEditar", usu);
    response.sendRedirect("editarUsuario.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String nombreusuario = request.getParameter("nombreusuario");
        String contrasenia = request.getParameter("contrasenia");
        String rol = request.getParameter("rol");
        Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar");
        usu.setNombreusuario(nombreusuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
       
        control.editarUsuario(usu);
        response.sendRedirect("svUsuario");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
