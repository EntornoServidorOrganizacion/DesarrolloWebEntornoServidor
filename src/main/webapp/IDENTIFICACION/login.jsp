<%-- 
    Document   : login
    Created on : 14 oct. 2018, 11:56:08
    Author     : paco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/normalizer.css">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
        <title>LOGIN</title>
    </head>



    <body>
        <%
            //sesion.getAttribute("error")!=null? miSesion.getAttribute("error") : ""
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("error") != null) {
        %>
        <p><%=sesion.getAttribute("error")%></p>
        <%

            }

            Cookie[] cookies = request.getCookies();
            String usuario = new String();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("usuario")) {
                    usuario = cookies[i].getValue();
                    break;
                }
            }
            
            if (request.getParameter("recordar") != null) {
                Cookie cookie = new Cookie("usuario", usuario);
                cookie.setMaxAge(60*60*24);
                response.addCookie(cookie);
            }



        %>
        <form action="comprobacionLogin.jsp">

            <fieldset>

                <legend>Indentifícate</legend>

                Usuario: <input type="text" name="usuario"><br>
                Contraseña: <input type="password" name="contrasenia"><br>
                Recordar usuario<input type="checkbox" id="recordar" name="recordar" value="<%=usuario%>"><br>

                <button type="submit" name="botonCookie" value="Entrar">Entrar</button>
                <button type="submit" name="botonCookie" value="Menu"><a id="menuCookies" href="<%=request.getContextPath()%>/index.html">Menú</a> </button>
                <br>

            </fieldset>

        </form>
    </body>
</html>
