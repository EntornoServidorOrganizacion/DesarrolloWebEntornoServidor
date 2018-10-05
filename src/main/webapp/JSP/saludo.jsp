<%-- 
    Document   : saludo
    Created on : 1 oct. 2018, 18:01:25
    Author     : paco
--%>

<%@page import="javafx.util.converter.LocalTimeStringConverter"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalTime"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/normalizer.css">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
        <title>Saludo</title>
    </head>
    <body>
        <%
            LocalTime horaActual = LocalTime.now();
            String nombre = request.getParameter("nombre");
            
            String bDias = "os días";
            String bTardes = "as tardes";
            String bNoches = "as noches";
            String saludo = "Buen";
            
            String sexo = request.getParameter("sexo");
            String h = "señor";
            String m = "señora/señorita";
            String hombreOmujer;
            
            if (horaActual.getHour() > 5 && horaActual.getHour() < 12) {
                saludo += bDias;
            } else if (horaActual.getHour() < 20) {
                saludo += bTardes;
            } else {
                saludo += bNoches;
            }
            
            if(sexo.equals("Hombre")){
                hombreOmujer = h;
            } else{
                hombreOmujer = m;
            }
        %>
        
        <h1><%= saludo %> <%= hombreOmujer %> <%= nombre %></h1>
        <a href="<%=request.getContextPath()%>/index.html">Menú</a>
    </body>
</html>
