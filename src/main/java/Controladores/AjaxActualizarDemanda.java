/*
 * 06-06-2019
 *  
 */
package Controladores;

import Daos.DemandaDao;
import Daos.DemandaDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author David Herrera
 */
public class AjaxActualizarDemanda extends HttpServlet {

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
        Integer a = Integer.parseInt(request.getParameter("P0"));
        Integer b = Integer.parseInt(request.getParameter("P1"));
        Integer c = Integer.parseInt(request.getParameter("P2"));
        Integer d = Integer.parseInt(request.getParameter("P3"));
        Integer e = Integer.parseInt(request.getParameter("P4"));
        Integer f = Integer.parseInt(request.getParameter("P5"));
        Integer g = Integer.parseInt(request.getParameter("P6"));
        Integer h = Integer.parseInt(request.getParameter("P7"));
        Integer i = Integer.parseInt(request.getParameter("P8"));
        DemandaDao demandaDao = new DemandaDaoImpl();
        demandaDao.insertarDemanda(a, b, c, d, e, f, g, h, i);
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
