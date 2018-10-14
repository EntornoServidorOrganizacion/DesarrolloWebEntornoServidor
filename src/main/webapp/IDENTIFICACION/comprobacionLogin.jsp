<%-- 
    Document   : logout
    Created on : 14 oct. 2018, 11:56:33
    Author     : paco
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String usuario = request.getParameter("usuario");
    String contrasenia = request.getParameter("contrasenia");
    HttpSession sesion = request.getSession();

    if (usuario.equals("paco") && contrasenia.equals("1234")) { //estos deben ser los valores de los atributos
        //si son esos los introducidos, nos vamos al menú del user
        sesion.setAttribute("usuario", usuario);
        response.sendRedirect("menuUsuario.jsp");
    } else { //si no son correctos los valores, muestra un mensaje de error

        sesion.setAttribute("error", "Usuario y/o contrasenia incorrectos.Vuelve a intentarlo.");
        response.sendRedirect("login.jsp");
    }
%>
