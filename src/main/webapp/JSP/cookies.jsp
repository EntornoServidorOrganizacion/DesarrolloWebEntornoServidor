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
            String valor = request.getParameter("valor");
            Cookie cookie = null;
            Cookie[] cookies = request.getCookies();

            //comprobar el array de cookies para ver si está vacio
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals(nombre)) {
                        cookie = cookies[i];
                        break;
                    }
                }//fin del for
            }//fin comprobación para saber si hay cookies

            //CREAR
            if (request.getParameter("botonCookie").equals("Crear")) { //Comprobamos si el botón es el de Crear

                if (cookie == null) { //Comprobar que la cookie está vacia, si está vacia, se crea la cookie
                    cookie = new Cookie(nombre, valor);
                    cookie.setMaxAge(60 * 60);//una hora de caducidad de la cookie
                    response.addCookie(cookie);
                    mensaje = "Se ha creado la cookie \"" + nombre + "\" con valor \"" + valor + "\"";
                } else {
                    mensaje = "La cookie \"" + nombre + "\" ya existe";
                }

            
            
            //VISUALIZAR  
            } else if (request.getParameter("botonCookie").equals("Visualizar")) {//Comprobamos si el botón es el de Visualizar
                
                    if (cookie != null) {//si la cookie del array tiene el mismo nombre que buscamos, nos la muestra
                        mensaje = "Esta es la cookie \"" + nombre + "\" con valor \"" + cookie.getValue() + "\"";
                    
                    } else {
                        mensaje = "La cookie \"" + nombre + "\" no existe";
                    }
                

            


            //MODIFICAR
            } else if (request.getParameter("botonCookie").equals("Modificar")) {//Comprobamos si el botón es el de Modificar
                
                    if (cookie != null) {
                        cookie.setValue(valor);
                        response.addCookie(cookie);
                        mensaje = "Se ha modificado la cookie \"" + nombre + " con valor \"" + valor + "\"";
                        
                    } else{
                        mensaje = "La cookie \"" + nombre + "\" no existe";
                    }
                
                
            




            //ELIMINAR    
            } else if (request.getParameter("botonCookie").equals("Eliminar")) {//Comprobamos si el botón es el de Eliminar
                
                    if (cookie != null) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                        mensaje = "Se ha eliminado la cookie \"" + nombre;
                        
                    }else{
                        mensaje = "La cookie \"" + nombre + "\" no existe";
                    }
                
            }

            //enviar la respuesta al menú inicial donde están las opciones
            response.sendRedirect("menuCookie.jsp?mensaje=" + mensaje);

        %>
    </body>
</html>
