<%-- 
    Document   : cookies
    Created on : 4 oct. 2018, 21:19:32
    Author     : paco
--%>

<%@page import="javax.ws.rs.core.Response"%>
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
            if(request.getParameter("botonCookie").equals("Crear")){
                if(cookies==null){
                    cookie = new Cookie(nombre,cookie.getValue());
                    cookie.setMaxAge(60*60);//una hora de caducidad de la cookie
                    response.addCookie(cookie);
                    mensaje = "Se ha creado la cookie " + nombre + " con valor " + cookie.getValue();
                }
            } else{
                mensaje = "La cookie ya está creada";
            }



            //opcion de visualizar cookie
            if(request.getParameter("botonCookie").equals("Visualizar")){
                if(cookies!=null){
                   mensaje = "Esta es la cookie " + nombre + " con valor " + cookie.getValue();
                }
            } else{
                mensaje = "No existe esta cookie";
            }




            //opcion de modificar cookie
            if(request.getParameter("botonCookie").equals("Modificar")){
                if(cookies!=null){
                    cookie = new Cookie(cookie.getName(),cookie.getValue());
                    cookie.setValue(cookie.getValue());
                    response.addCookie(cookie);
                    mensaje = "Se ha modificado la cookie " + nombre + " con valor " + cookie.getValue();
                }
            } else{
                mensaje = "No existe esta cookie";
            }




            //opcion de eliminar cookie
            if(request.getParameter("botonCookie").equals("Eliminar")){
                if(cookies!=null){
                    
                }
            }
            

            response.sendRedirect("menuCookie.jsp?mensaje" + mensaje);
        %>
    </body>
</html>
