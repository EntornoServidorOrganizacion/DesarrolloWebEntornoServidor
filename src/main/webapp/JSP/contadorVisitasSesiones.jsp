<%-- 
    Document   : contadorVisitasSesiones
    Created on : 10 oct. 2018, 13:22:16
    Author     : paco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/normalizer.css">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
        <title>CONTADOR DE VISITAS SESIONES</title>
        <script>
            function myFunction() {
                location.reload();
            }
        </script>
    </head>
    <%
        int contador = 0;
        String mensajeVisitas = "NUMERO DE VISITAS RECIBIDAS:  ";
        HttpSession sesion = request.getSession(); //crear sesión
        sesion.setAttribute("contadorVisitas", 1);

        if (request.getParameter("botonSesion") != null) {
            if(request.getParameter("botonSesion").equals("Recargar")){
                contador++;
                sesion.setAttribute("contadorVisitas", 1+contador);
                mensajeVisitas += ""+session.getAttribute("contadorVisitas");
                
            }
            if (request.getParameter("botonSesion").equals("Eliminar") && request.getParameterValues("Eliminar")!=null) {
                sesion.removeAttribute("contadorVisitas");
                 mensajeVisitas = "Se ha eliminado la sesión";
                //sesion.invalidate();
            }

        }


    %>
    <body>
        <h1>CONTADOR DE VISITAS COOKIES</h1>
        <form action="contadorVisitasSesiones.jsp" method="post">

            <fieldset>
                <%=mensajeVisitas%>

                <br>
                <br>

                <button type="submit" name="botonSesion" value="Recargar"><a id="menuCookies" onclick="myFunction()">Recargar</a> </button>
                <input type="checkbox" name="botonSesion" value="Eliminar">Eliminar</input>
                <button type="submit" name="botonSesion" value="Menu"><a id="menuCookies" href="<%=request.getContextPath()%>/index.html">Menú</a> </button>
                <br>
                <br>

            </fieldset>

        </form>
    </body>
</html>
