<%-- 
    Document   : cookies
    Created on : 4 oct. 2018, 21:19:32
    Author     : paco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            String mensaje = null;
            String nombre = request.getParameter("nombre");
            Cookie cookie = null;
            Cookie[] cookies = request.getCookies();
            
            //comprobar el array de cookies para ver si está vacio
            if(cookies != null){
                for (int i = 0; i < cookies.length; i++) {
                        if(cookies[i].getName().equals(nombre)){
                           cookie = cookies[i];
                           break; 
                        }
                    }
            }//fin comprobación para saber si hay cookies
            

            //opción de crear cookie
            



            //opcion de visualizar cookie
            




            //opcion de modificar cookie
            




            //opcion de eliminar cookie
        %>
    </body>
</html>
