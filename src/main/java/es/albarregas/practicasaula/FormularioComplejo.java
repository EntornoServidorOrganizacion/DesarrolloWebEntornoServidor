/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicasaula;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
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
@WebServlet(name = "FormularioComplejo", urlPatterns = {"/FormularioComplejo"})
public class FormularioComplejo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, boolean correcto)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FormularioComplejo</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/estilos.css\">");
            //meter meta con charset=TFF-8
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FormularioComplejo at " + request.getContextPath() + "</h1>");
            out.println("<a href='./index.html'>Menú</a>");
            //getParameterMap
            /*if (!correcto) {
                out.println("<p>No se han introducido datos</p>");
            } else {
                Map<String, String[]> parametros = request.getParameterMap();
                Iterator<Map.Entry<String, String[]>> nombre = parametros.entrySet().iterator();
                while (nombre.hasNext()) {
                    Map.Entry<String, String[]> entry = nombre.next();
                    //System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
                    if (!entry.equals("env")) {
                        //out.println(nombre + " - <strong>" + request.getParameter(nombre) + "</strong><br/>");
                        out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
                    }
                }
            }*/
            Map<String, String[]> parametros = request.getParameterMap();
            for(Map.Entry<String, String[]> entrada : parametros.entrySet()){
                if(!entrada.getKey().startsWith("env")){
                    out.println("<p>" + entrada.getKey()+":");
                    
                    for(String valor : entrada.getValue()){
                        out.println("<strong>");
                        out.println(valor);
                        out.println("</strong>");  
                    }
                    out.println("</p>");
                }
            }
            
            
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
        boolean correcto = true;
        processRequest(request, response, correcto);
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
        boolean correcto = false;
        processRequest(request, response, correcto);
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
