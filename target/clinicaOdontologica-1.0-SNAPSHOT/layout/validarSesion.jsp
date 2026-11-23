
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession misession = request.getSession();
    String Usuario = (String) request.getSession().getAttribute("usuario");
    
    if (Usuario == null) {
            boolean error = false;
            misession.setAttribute("error", error);
            response.sendRedirect("login.jsp");
        }
    
%>