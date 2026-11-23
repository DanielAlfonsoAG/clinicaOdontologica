/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.clinicaodontologica;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
import logica.Controladora;
import logica.Secretario;
import logica.Usuario;


/**
 *
 * @author agude
 */
@WebServlet(name = "svSecretario", urlPatterns = {"/svSecretario"})
public class svSecretario extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    List<Secretario>listaSecretarios = new ArrayList<Secretario>();
        listaSecretarios= control.getSecretario();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaSecretarios", listaSecretarios);
        response.sendRedirect("verSecretarios.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechanac = request.getParameter("fecha_nac");
        String Sector = request.getParameter("sector");
        int id_usuario = Integer.parseInt(request.getParameter("usuario"));
        
        Usuario usuario = control.traerUsuario(id_usuario);
        String errorMessage = null;
        //En esta seccion nos ayuda a validar que los datos no tengan fechas anteriores, que la hora de inicio y fin sean coherentes y 
        //que en el espacio de trabajo se tenga que seleccionar una parte de su contenido osea que no este vacio.
        try {
            LocalDate fecha_nacimiento = LocalDate.parse(fechanac, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate fecha_hoy = LocalDate.now();
            
            if (fecha_nacimiento.isAfter(fecha_hoy)) {
                errorMessage = "La fecha del la nacimiento no puede ser despues a la fecha actual.";
            }
        //generamos los mensajes de error de la fecha
        } catch (NumberFormatException  e) {
            errorMessage = "La fecha ingresada es inválida. Asegúrate de ingresar una fecha válida.";
        }
        //Enviamos el error al index
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher Respuesta_Error = request.getRequestDispatcher("altaSecretario.jsp");
            Respuesta_Error.forward(request, response);
        }
        else{
        control.crearSectretario(dni, nombre, apellidos, telefono, direccion, fechanac, Sector, usuario);
        
        response.sendRedirect("svSecretario");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
