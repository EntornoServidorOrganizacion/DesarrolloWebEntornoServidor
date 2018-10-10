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

            //comprobar el array de cookies para ver si está vacio
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("LaCookieCreada")) {
                        miCookie = cookies[i];
                        break;
                    }
                }//fin del for
            }//fin comprobación para saber si hay cookies

            String mensajeVisitas = "HAS VISITADO LA PAGINA " ;
            if (miCookie == null) {
                miCookie = new Cookie("LaCookieCreada", "1");
                miCookie.setMaxAge(60 * 60);//una hora de caducidad de la cookie
                response.addCookie(miCookie); //añadir cookie
                miCookie.setVersion(0); //establece la versión de protocolo. Si es 0 cumple con Netscape
                miCookie.setSecure(false); //false: se envia en cualquier protocolo HTTPS o SSL
                mensajeVisitas += ""+miCookie.getValue();

            } else {
                if (request.getParameter("boton") != null) {
                    if (request.getParameter("boton").equals("Recargar")) {
                        contadorVisitas = Integer.parseInt(miCookie.getValue());
                        contadorVisitas++;
                        miCookie.setValue(contadorVisitas + "");
                        response.addCookie(miCookie);
                        mensajeVisitas += ""+miCookie.getValue();

                    } else if (request.getParameter("boton").equals("Eliminar")) {
                        miCookie.setMaxAge(0);
                        response.addCookie(miCookie);
                        mensajeVisitas = "Se ha eliminado la cookie";
                        contadorVisitas = 0;

                    }
                }
            }
            //session.invalidate(); //comprobar qué hace
            
        %>
        <h1>CONTADOR DE VISITAS COOKIES</h1>
        <form action="contadorVisitasCookies.jsp" method="post">

            <fieldset>
                <%=mensajeVisitas%>
                <%
                    if (miCookie != null) {
                        if (miCookie.getValue().equals("1")) {
                                %> VEZ<%
                        } else {
                                %> VECES<%
                          }
                      }
                %>
                <br>
                <br>
                <br>
                Nombre: <%=miCookie.getName()%><br>
                Segura: <%=miCookie.getSecure()%><br>
                Versión: <%=miCookie.getVersion()%>
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

