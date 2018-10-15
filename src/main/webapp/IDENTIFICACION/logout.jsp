<%-- 
    Document   : logout
    Created on : 14 oct. 2018, 11:56:24
    Author     : paco
--%>


<%@page import="java.time.format.TextStyle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate(); //esto cierra la sesión
    response.sendRedirect("login.jsp"); //no redirige al login principal
// TODO LO QUE ESTÁ DEBAJO DE ESTA SENTENCIA NO SE EJECUTA YA QUE SE HA DELEGADO EL CONTROL A login.jsp
    //HORA
    Calendar fechaActual = Calendar.getInstance();
    int hora = fechaActual.get(Calendar.HOUR_OF_DAY);
    int minutos = fechaActual.get(Calendar.MINUTE);
    int segundos = fechaActual.get(Calendar.SECOND);

    //FECHA
    int dia = LocalDate.now().getDayOfMonth();
    Month mes = LocalDate.now().getMonth();
    int anio = LocalDate.now().getYear();
    
    DayOfWeek diaSemana = LocalDate.now().getDayOfWeek();//dia de la semana

    //imprimir fecha
    String fecha = diaSemana.getDisplayName(TextStyle.FULL, new Locale("es", "ES")) + ", " 
            + dia + " de " + mes.getDisplayName(TextStyle.FULL, new Locale("es", "ES")) + " de " 
            + anio + " a las " + hora + ":" + minutos + ":" + segundos;

    fecha = fecha.replace(" ", "%20");
    
    response.addCookie(new Cookie("fecha", fecha));
%>

