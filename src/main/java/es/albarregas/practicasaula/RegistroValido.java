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
@WebServlet(name = "RegistroValido", urlPatterns = {"/RegistroValido"})
public class RegistroValido extends HttpServlet {

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
            int[] tError = {-1};//array de 4 posiciones mejor que poner -1 cuatro veces
            String[] mError = {request.getParameter("Nombre")};

            Map<String, String[]> parametros = request.getParameterMap();//request.getParameterMap()
            String dia = parametros.get("dia")[0];
            String mes = parametros.get("mes")[0];
            String anio = parametros.get("anio")[0];
            String fecha = "La fecha es: " + dia + "/" + mes + "/" + anio;
            
            
            
             if (tError[0] == -1) {
                out.println("<form action=\"" + request.getContextPath() + "/Registro\" method=\"post\">");

                //INFORMACIÓN PERSONAL
                out.println("<fieldset>");
                out.println("<legend>Información personal</legend>");
                //Nombre
                if (true) {
                    out.println("<label>*Nombre</label><input type=\"text\" name=\"Nombre\" value=\"" + parametros.get("Nombre") + "\">");
                } else {
                    out.println("<label>*Nombre</label><input type=\"text\" name=\"Nombre\" value=\"Error\">");
                }
                //Apellidos
                if (true) {
                    out.println("<label>Apellidos</label><input type=\"text\" name=\"Apellidos\" value=\"" + parametros.get("Apellidos") + "\">");

                } else {
                    out.println("<label>Apellidos</label><input type=\"text\" name=\"Apellidos\" value=\"" + parametros.get("Apellidos") + "\">");

                }
                out.println("</fieldset>");

                //botones
                out.println("<button type=\"submit\" name=\"enviar\" value=\"Enviar\">Enviar</button>");
                out.println("<button type=\"reset\" name=\"limpiar\" value=\"Limpiar\">Limpiar</button>");
                out.println("</form>");
            }
            
            
            
            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroValido at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

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
