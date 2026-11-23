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
import logica.Usuario;

/**
 *
 * @author agude
 */
@WebServlet(name = "svLogin", urlPatterns = {"/svLogin"})
public class svLogin extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.getSession().removeAttribute("usuario");
        request.getSession().invalidate();
        boolean error = false;
        HttpSession misession = request.getSession(true);
        misession.setAttribute("error", error);
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");
        int id_usuario = control.comprobarId(usuario, contrasenia);
        String rol = control.comprobarRol(usuario,contrasenia);
        boolean error = true;
        boolean validacion = false;
        HttpSession misession = request.getSession();
        validacion = control.comprobarAcceso(usuario,contrasenia);
        
        if (validacion) {
            error = false;
            misession.setAttribute("id_usuario", id_usuario);
            misession.setAttribute("usuario", usuario);
            misession.setAttribute("rol", rol);
            response.sendRedirect("index.jsp");
        }
        else{
        misession.setAttribute("error", error);
        response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
