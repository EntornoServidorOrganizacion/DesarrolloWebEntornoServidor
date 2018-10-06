<%-- 
    Document   : contadorVisitasCookies
    Created on : 5 oct. 2018, 16:15:19
    Author     : paco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/normalizer.css">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
        <title>CONTADOR DE VISITAS COOKIES</title>
    </head>
    <body>
        <h1>CONTADOR DE VISITAS COOKIES</h1>
            <form action="../JSP/contadorVisitasCookies.jsp" method="post">

            <fieldset>
                <label>Nombre de la cookie:</label><br>
                <label>Valor de la cookie:</label><br>
                <br>
                <br>
                <button type="submit" name="botonCookie" value="Recargar">Recargar</button>
                <button type="submit" name="botonCookie" value="Eliminar">Eliminar</button>
                <button type="submit" name="botonCookie" value="Menu"><a id="menuCookies" href="<%=request.getContextPath()%>/index.html">Menú</a> </button>
                
                <br>
                <br>
                 <%
                    String mensaje = (request.getParameter("mensaje") != null)?request.getParameter("mensaje"):"";
                  %>
                  
            </fieldset>
                 
        </form>
    </body>
</html>
