<%-- 
    Document   : menuUsuario
    Created on : 14 oct. 2018, 11:56:42
    Author     : paco
--%>

<%@ page session="true" %>
<%
    
    HttpSession sesion = request.getSession();
    String usuario = (String) sesion.getAttribute("usuario");

%>
<%-- NO CONTROLAS EL ÚLTIMO ACCESO --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/normalizer.css">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
        <title>LOGIN</title>
        <%-- LOS ESTILOS EN UN FICHERO EXTERNO --%>
        <style>
            body{

                background-color: #F0FFF1;
            }
            #titulo{
                font-size: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            #formulario{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            #tabla{
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 5%;
            }
            td{
                width: 15px;
                height: 15px;
            }



            #azul{
                border: none;
                background:#1485CC;
                border-radius: 15px 15px;
                width: 150px;
                height: 30px;
            }
            #rojo{
                border: none;
                background:#B21212;
                border-radius: 15px 15px;
                width: 150px;
                height: 30px;
            }
            #verde{
                border: none;
                background:#00FC19;
                border-radius: 15px 15px;
                width: 150px;
                height: 30px;
            }
            #amarillo{
                border: none;
                background:#FFFC19;
                border-radius: 15px 15px;
                width: 150px;
                height: 30px;
            }
            #blanco{
                border: none;
                background:white;
                border-radius: 15px 15px;
                width: 150px;
                height: 30px;
            }
            button{
                margin-left: -30px;
            }
        </style>
    </head>
    <body>
        <h1>Hola <%=usuario%></h1><br>
        <button type="submit" name="botonCookie" value="login"><a id="menuCookies" href="login.jsp">Cerrar sesión</a></button>


        <div id="titulo">
            <h3>PintaMAX 2000</h3>
        </div>
        <div id="formulario">

            <form>
                <button type="button" id="azul" value="blue" onclick="cambioColor('#1485CC')"></button>
                <button type="button" id="rojo" value="red" onclick="cambioColor('#B21212')"></button>
                <button type="button" id="verde" value="green" onclick="cambioColor('#00FC19')"></button>
                <button type="button" id="amarillo" value="yellow" onclick="cambioColor('#FFFC19')"></button>
                <button type="button" id="blanco" value="white" onclick="cambioColor('white')"></button>
            </form>
        </div>

        <div id="tabla">
            <table border="1">
                <script>

                    let miColor = '#fff';
                    function cambioColor(color) {
                        miColor = color;
                    }
                    function change(color) {
                        color.style.backgroundColor = miColor;

                    }

                    for (let i = 0; i <= 30; i++) {
                        document.write('<tr></tr>');

                        for (let j = 0; j <= 30; j++) {
                            document.write('<td onmouseover="change(this);"></td>');
                        }

                    }



                </script>

            </table>
        </div>


    </body>
</html>
