<%-- 
    Document   : menuCookie
    Created on : 4 oct. 2018, 21:17:11
    Author     : paco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/normalizer.css">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
        <title>Menú cookie</title>
    </head>
    <body>
        <div>
            <h1>CONTROL DE COOKIES</h1>
            <form action="../JSP/cookies.jsp" method="post">

                <fieldset>
                    <label>Nombre de la cookie:</label><input  name="nombre" type="text" required><br>
                    <label>Valor de la cookie:</label><input  name="valor" type="text"><br>
                    <br>
                    <br>
                    <button type="submit" name="botonCookie" value="Crear">Crear</button>
                    <button type="submit" name="botonCookie" value="Visualizar">Visualizar</button>
                    <button type="submit" name="botonCookie" value="Modificar">Modificar</button>
                    <button type="submit" name="botonCookie" value="Eliminar">Eliminar</button>
                    <button type="submit" name="botonCookie" value="Menu"><a id="menuCookies" href="<%=request.getContextPath()%>/index.html">Menú</a> </button>
                    <br>
                    <br>
                    <%
                        //String mensaje = (request.getParameter("mensaje") != null)?request.getParameter("mensaje"):"";
                        String mensaje;
                        if (request.getParameter("mensaje") != null) {
                            mensaje = request.getParameter("mensaje");
                        } else {
                            mensaje = "";
                        }

                    %>
                    <p><%=mensaje%></p>

                </fieldset>

            </form>

        </div>
    </body>
</html>
