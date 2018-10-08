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
        <script>
            function myFunction() {
                location.reload();
            }
        </script>

    </head>
    <body>
        <%
            
            int contadorVisitas = 0;
            Cookie miCookie = null;
            Cookie[] cookies = request.getCookies();

            //cookie.getMaxAge();
            //comprobar el array de cookies para ver si está vacio
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("LaCookieCreada")) {
                        miCookie = cookies[i];
                        break;
                    }
                }//fin del for
            }//fin comprobación para saber si hay cookies

            if (miCookie == null) {
                miCookie = new Cookie("LaCookieCreada", "1");
                miCookie.setMaxAge(60 * 60);//una hora de caducidad de la cookie
                response.addCookie(miCookie);
            }
            

            String mensajeVisitas = "HAS VISITADO LA PAGINA " + miCookie.getValue() + " VECES";

            /**
             * crear un if para ver si está definida la cookie. Si no existe la
             * cookie, sería la primera visita, dar al valor de 1, crear la
             * cookie (dar el valor) Si la cookie existe debe mostrar el número
             * de visitas, incrementar en 1 el contador,
             *
             */

        %>
        <h1>CONTADOR DE VISITAS COOKIES</h1>
        <form action="../JSP/contadorVisitasCookies.jsp" method="post">

            <fieldset>
                <%=mensajeVisitas%>
                <br>
                <br>

                <button type="submit" name="boton" value="Recargar"><a id="menuCookies" onclick="myFunction()">Recargar</a> </button>
                <button type="submit" name="boton" value="Eliminar">Eliminar</button>
                <button type="submit" name="boton" value="Menu"><a id="menuCookies" href="<%=request.getContextPath()%>/index.html">Menú</a> </button>
                <br>
                <br>
            </fieldset>

        </form>
    </body>

</html>

