/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicasaula;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paco
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String dia = request.getParameter("dia");
        String mes = request.getParameter("mes");
        String anio = request.getParameter("anio");
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/estilos.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Registro at " + request.getContextPath() + "</h1>");
            out.println("<a href='./index.html'>Menú</a>");

            //arrays de error
            int[] tError = {-1, -1, -1, -1};
            String[] mError = {request.getParameter("Nombre"), request.getParameter("FechaNac"), request.getParameter("Usuario"), request.getParameter("Contrasenia")};

            //recogemos los datos del formulario (ya no habrá que volver a tocar el formulario html)
            Map<String, String[]> parametros = request.getParameterMap();

            //recorremos el Map y vamos viendo si el parametro está vacio/incorrecto
            for (Map.Entry<String, String[]> entrada : parametros.entrySet()) {

                if (!entrada.getKey().startsWith("env")) {

                    //recorremos el array y si el parametro no está vacio, cambiamos el valor de -1 a 0
                    for (String names : mError) {
                        //con este¡os if vemos que los valores Nombre, Password y Usuario no estén vacios, si está vacios la posición correspondiente de array con cambia de valor
                        if (!request.getParameter("Nombre").equals("")) {
                            tError[0] = 0;
                        }
                        if (!request.getParameter("Usuario").equals("")) {
                            tError[2] = 0;
                        }
                        if (!request.getParameter("Password").equals("")) {
                            tError[3] = 0;
                        }
                        //COGEMOS Y COMPROBAMOS LAS FECHAS

                        if (!((dia.equals("Febrero")) && (Integer.parseInt(dia) == 29) && ((Integer.parseInt(anio)) % 4 != 0))) {
                            tError[1] = 0;
                        }
                        if (!((mes.equals("Febrero")) && (Integer.parseInt(dia) > 29))) {
                            tError[1] = 0;
                        }
                        if ((mes.equals("Enero")) || (mes.equals("Abril")) || (mes.equals("Mayo")) || (mes.equals("Julio")) || (mes.equals("Agosto")) || (mes.equals("Octubre")) || (mes.equals("Diciembre")) && (Integer.parseInt(dia) == 31)) {
                            tError[1] = 0;
                        }
                        if ((mes.equals("Marzo")) || (mes.equals("Junio")) || (mes.equals("Septiembre")) || (mes.equals("Noviembre")) && (Integer.parseInt(dia) == 3)) {
                            tError[1] = 0;
                        }
                    }

                    //si el array tError
                    if ((tError[0] == 0) && (tError[1] == 0) && (tError[2] == 0) && (tError[3] == 0)) {
                        out.println("<p>" + entrada.getKey() + ":");

                        for (String valor : entrada.getValue()) {
                            out.println("<strong>");
                            out.println(valor);
                            out.println("</strong>");
                        }
                        out.println("</p>");
                    }
                }
            }

            while ((tError[0] == 0) || (tError[1] == 0) || (tError[2] == 0) || (tError[3] == 0)) {
                //volvemos a hacer el formulario
                out.println("<form action=\"" + request.getContextPath() + "/Registro\" method=\"post\">");

                //INFORMACIÓN PERSONAL
                out.println("<fieldset>");
                out.println("<legend>Información personal</legend>");

                //Nombre
                if (tError[0] != -1) {
                    out.println("<label>*Nombre</label><input type=\"text\" name=\"Nombre\" value=\"" + parametros.get("Nombre") + "\">");
                } else {
                    out.println("<label>*Nombre</label><input type=\"text\" name=\"Nombre\" value=\"Error\">");
                }
                //Apellidos
                out.println("<label>Apellidos</label><input type=\"text\" name=\"Apellidos\" value=\"" + parametros.get("Apellidos") + "\">");

                //Sexo
                out.println("<label>Sexo:<input type=\"radio\" name=\"hombre\" value=\"" + parametros.get("hombre") + "\"Hombre</label>");
                out.println("<label><input type=\"radio\" name=\"mujer\" value=\"" + parametros.get("mujer") + "\"Mujer</label>");

                out.println("<label>Fecha de nacimiento</label>");

                if (tError[2] != -1) {
                    out.println("<select id=\"dia\" name=\"dia\">");
                    out.println("<option value=\"" + parametros.get(dia) + "\"></option>");
                    out.println("</select>");
                    out.println("<select id=\"mes\" name=\"mes\">");
                    out.println("<option value=\"" + parametros.get(mes) + "\"></option>");
                    out.println("</select>");
                    out.println("<select id=\"anio\" name=\"anio\">");
                    out.println("<option value=\"" + parametros.get(anio) + "\"></option>");
                    out.println("</select>");
                } else{
                    out.println("<select id=\"dia\" name=\"dia\">");
                    out.println("<option value=\"1\" selected>1</option>");
                    out.println("<option value=\"2\">2</option>");
                    out.println("<option value=\"3\">3</option>");
                    out.println("<option value=\"4\">4</option>");
                    out.println("<option value=\"5\">5</option>");
                    out.println("<option value=\"6\">6</option>");
                    out.println("<option value=\"7\">7</option>");
                    out.println("<option value=\"8\">8</option>");
                    out.println("<option value=\"9\">9</option>");
                    out.println("<option value=\"10\">10</option>");
                    out.println("<option value=\"11\">11</option>");
                    out.println("<option value=\"12\">12</option>");
                    out.println("<option value=\"13\">13</option>");
                    out.println("<option value=\"14\">14</option>");
                    out.println("<option value=\"15\">15</option>");
                    out.println("<option value=\"16\">16</option>");
                    out.println("<option value=\"17\">17</option>");
                    out.println("<option value=\"18\">18</option>");
                    out.println("<option value=\"19\">19</option>");
                    out.println("<option value=\"20\">20</option>");
                    out.println("<option value=\"21\">21</option>");
                    out.println("<option value=\"22\">22</option>");
                    out.println("<option value=\"23\">23</option>");
                    out.println("<option value=\"24\">24</option>");
                    out.println("<option value=\"25\">25</option>");
                    out.println("<option value=\"26\">26</option>");
                    out.println("<option value=\"27\">27</option>");
                    out.println("<option value=\"28\">28</option>");
                    out.println("<option value=\"29\">29</option>");
                    out.println("<option value=\"30\">30</option>");
                    out.println("<option value=\"31\">31</option>");
                    out.println("</select>");
                    
                    
                    out.println("<select id=\"mes\" name=\"mes\">");
                    out.println("<option value=\"Enero\" selected>Enero</option>");
                    out.println("<option value=\"Febrero\">Febrero</option>");
                    out.println("<option value=\"Marzo\">Marzo</option>");
                    out.println("<option value=\"Abril\">Abril</option>");
                    out.println("<option value=\"Mayo\">Mayo</option>");
                    out.println("<option value=\"Junio\">Junio</option>");
                    out.println("<option value=\"Julio\">Julio</option>");
                    out.println("<option value=\"Agosto\">Agosto</option>");
                    out.println("<option value=\"Septiembre\">Septiembre</option>");
                    out.println("<option value=\"Octubre\">Octubre</option>");
                    out.println("<option value=\"Noviembre\">Noviembre</option>");
                    out.println("<option value=\"Diciembre\">Diciembre</option>");
                    
                    out.println("</select>");
                    
                    
                    out.println("<select id=\"anio\" name=\"anio\">");
                    out.println("<option value=\"1979\" >1979</option>");
                    out.println("<option value=\"1980\" >1980</option>");
                    out.println("<option value=\"1981\" >1981</option>");
                    out.println("<option value=\"1982\" >1982</option>");
                    out.println("<option value=\"1983\" >1983</option>");
                    out.println("<option value=\"1985\" >1985</option>");
                    out.println("<option value=\"1986\" >1986</option>");
                    out.println("<option value=\"1987\" >1987</option>");
                    out.println("<option value=\"1988\" >1988</option>");
                    out.println("<option value=\"1989\" >1989</option>");
                    out.println("<option value=\"1990\" >1990</option>");
                    out.println("<option value=\"1991\" >1991</option>");
                    out.println("<option value=\"1992\" >1992</option>");
                    out.println("<option value=\"1993\" >1993</option>");
                    out.println("<option value=\"1994\" >1994</option>");
                    out.println("<option value=\"1995\" >1995</option>");
                    out.println("<option value=\"1996\" >1996</option>");
                    out.println("<option value=\"1997\" >1997</option>");
                    out.println("<option value=\"1998\" >1998</option>");
                    out.println("<option value=\"1999\" >1999</option>");
                    out.println("<option value=\"2000\" >2000</option>");

                    out.println("</select>");
                }


                out.println("</fieldset>");

                //DATOS DE ACCESO
                out.println("<fieldset>");
                out.println("<legend>Datos de acceso</legend>");
                //Usuario
                if (tError[3] != -1) {
                    out.println("<label>*Usuario</label><input type=\"text\" name=\"Usuario\" value=\"" + parametros.get("Usuario") + "\">");
                } else {
                    out.println("<label>*Usuario</label><input type=\"text\" name=\"Usuario\" value=\"Error\">");
                }
                //Contraseña
                if (tError[4] != -1) {
                    out.println("<label>*Nombre</label><input type=\"password\" name=\"Password\" value=\"" + parametros.get("password") + "\">");
                } else {
                    out.println("<label>*Nombre</label><input type=\"password\" name=\"Password\" value=\"Error\">");
                }
                out.println("</fieldset>");

                //INFORMACION GENERAL
                out.println("<fieldset>");
                out.println("<legend>Información general</legend>");
                out.println("<label>Preferencias:</label><label>Deporte</label><input type=\"checkbox\" name=\"Deporte\"><br>");
                out.println("<label>Lectura</label><input type=\"checkbox\" name=\"Lectura\"><br>");
                out.println("<label>Cine</label><input type=\"checkbox\" name=\"Cine\"><br>");
                out.println("<label>Viajes</label><input type=\"checkbox\" name=\"Viajes\"><br>");
                out.println("</fieldset>");

                //botones
                out.println("<button type=\"submit\" name=\"enviar\" value=\"Enviar\">Enviar</button>");
                out.println("<button type=\"reset\" name=\"limpiar\" value=\"Limpiar\">Limpiar</button>");
                out.println("</form>");
            }

            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    //con un boolean escribirá si tiene o no errores
    //HACERLO MEJOR EN EL DOPOST
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
