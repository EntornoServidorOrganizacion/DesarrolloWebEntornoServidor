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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paco
 */
@WebServlet(name = "CicloVida", urlPatterns = {"/CicloVida"})
public class CicloVida extends HttpServlet {

    public CicloVida() {
        //super();
        System.out.println("Se crea el Servlet");
    }

    public void init(ServletConfig config) throws ServletException {
        System.out.println("Se está ejecutando: INIT" + config.getServletName());//para que me diga el nombre del servlet
        super.init();
    }

    public void service(HttpServletRequest request, HttpServletRequest response) throws ServletException, IOException {
        System.out.println("Se está ejecutando: SERVICE" + request.getServletPath() + ", " + response.getContextPath());
        super.service(request, (HttpServletResponse) response);
    }

    public void destroy() {
        System.out.println("Se está ejecutando: DESTROY");
    }
    
}
