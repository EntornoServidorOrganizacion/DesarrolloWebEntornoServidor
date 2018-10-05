<%-- 
    Document   : edadPersona
    Created on : 2 oct. 2018, 16:21:47
    Author     : paco
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/normalizer.css">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
        <title>Edad persona</title>
    </head>
    <body>
        <%
            String nombre = request.getParameter("nombre");

            //fecha introducida por el cliente
            String fechaNacimiento = request.getParameter("fechaNac");

            //pasar el String de la fecha a LocalDate
            LocalDate fechaNac = LocalDate.parse(fechaNacimiento);
            int year = fechaNac.getYear();
            int month = fechaNac.getMonthValue();
            int dayOfMonth = fechaNac.getDayOfMonth();
            fechaNac = LocalDate.of(year, month, dayOfMonth);

            //fecha actual de sistema
            LocalDate hoy = LocalDate.now();
            //ver of(int year, int month, int dayOfMonth)

            //Period calcula el tiempo de diferencia entre dos fechas
            Period periodo = Period.between(fechaNac, hoy);

            int dias = periodo.getDays();
            int meses = periodo.getMonths();
            int anios = periodo.getYears();

            String diceEdad = "tienes ";

            /*if (anios == 1) {
                diceEdad += "tienes " + anios + " año ";
            } else if (anios > 1) {
                diceEdad += "tienes " + anios + " años ";
            }
            if (meses == 1) {
                diceEdad += meses + " mes ";
            } else if (meses > 1) {
                diceEdad += meses + " meses ";
            }
            if (dias == 1) {
                diceEdad += dias + " día";
            } else if (dias > 1) {
                diceEdad += dias + " días";
            }*/

            //no hay meses ni dias
            if (anios != 0 && meses == 0 && dias == 0) {
                if (anios == 1) {
                    diceEdad +=  + anios + " año ";
                } else if (anios > 1) {
                    diceEdad +=  + anios + " años ";
                }
            }

            //no hay días
            if (anios != 0 && meses != 0 && dias == 0) {
                if (anios == 1) {
                    diceEdad +=  + anios + " año ";
                } else if (anios > 1) {
                    diceEdad +=  + anios + " años ";
                }
                if (meses == 1) {
                    diceEdad += meses + " mes ";
                } else if (meses > 1) {
                    diceEdad += meses + " meses ";
                }
            }

            //no hay años ni meses
            if (anios == 0 && meses == 0 && dias != 0) {
                if (dias == 1) {
                    diceEdad += dias + " día";
                } else if (dias > 1) {
                    diceEdad += dias + " días";
                }
            }
            
            //no hay años
            if (anios == 0 && meses != 0 && dias != 0){
                if (meses == 1) {
                    diceEdad += meses + " mes ";
                } else if (meses > 1) {
                    diceEdad += meses + " meses ";
                }
                if (dias == 1) {
                    diceEdad += dias + " día";
                } else if (dias > 1) {
                    diceEdad += dias + " días";
                }
            }
            
            //no hay meses
            if (anios != 0 && meses == 0 && dias != 0){
                if (anios == 1) {
                    diceEdad +=  + anios + " año ";
                } else if (anios > 1) {
                    diceEdad +=  + anios + " años ";
                }
                if (dias == 1) {
                    diceEdad += dias + " día";
                } else if (dias > 1) {
                    diceEdad += dias + " días";
                }
            }
            
            //HAY UN FALLO EN LOS MESES


        %>



        <%            /**
             * Si la fecha introducida es posterior a la fecha actual, deberá
             * indicar que la persona no ha nacido. Para ello podemos comparar
             * con isBefore o isAfter o isEqual
             */
            String noNacido = null;
            if (hoy.isBefore(fechaNac)) {
                noNacido = "todavía no has nacido";
        %>
        <h1>Hola <%=nombre%> <%=noNacido%></h1>
        <%
        } else {
        %>
        <h1>Hola <%=nombre%> <%=diceEdad%> de edad</h1>
        <%
            }
        %>

        <a href="<%=request.getContextPath()%>/index.html">Menú</a>
    </body>
</html>
