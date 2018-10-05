/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicasaula;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paco
 */
@WebServlet(name = "Cliente", urlPatterns = {"/Cliente"}, initParams = {
    @WebInitParam(name = "Param1", value = "Hola"), @WebInitParam(name = "Param2", value = "Mundo")})
public class Cliente extends HttpServlet {
    
   

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
            out.println("<title>Servlet Cliente</title>"); 
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/estilos.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cliente at " + request.getContextPath() + "</h1>");
            out.println("<h1>Metodo: " + request.getMethod() + "</h1>");
            out.println("<h1>Informacion del Path: " + request.getPathInfo() + "</h1>");
            out.println("<h1>Usuario remoto: " + request.getRemoteUser() + "</h1>");
            out.println("<h1>Nombre del servidor: " + request.getServerName() + "</h1>");
            out.println("<h1>Protocolo: " + request.getProtocol() + "</h1>");
            out.println("<h1>Dirección remota: " + request.getRemoteAddr() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }
    
    public Cliente() {
        super();
    }

    public void init(ServletConfig config, HttpServletResponse response) throws ServletException, IOException {
        super.init();
        PrintWriter out = response.getWriter();
        out.println("<p>Parametro 1: " + config.getInitParameter("Param1") + "</p>");
        out.println("<p>Parametro 2: " + config.getInitParameter("Param2") + "</p>");
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
