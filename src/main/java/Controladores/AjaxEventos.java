/*
 * 06-06-2019
 *  
 */
package Controladores;

import Daos.CentroTrabajoDao;
import Daos.CentroTrabajoDaoImpl;
import Daos.DemandaDao;
import Daos.DemandaDaoImpl;
import Daos.EventoVistaDao;
import Daos.EventoVistaDaoImpl;
import Daos.ProductoDao;
import Daos.ProductoDaoImpl;
import Daos.TamañoDao;
import Daos.TamañoDaoImpl;
import Modelos.Capacidad;
import Modelos.Demanda;
import Modelos.EventoVista;
import Modelos.JsonVista;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author David Herrera
 */
public class AjaxEventos extends HttpServlet {

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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        Gson gson = new Gson();

        EventoVistaDao eventoVistaDao = new EventoVistaDaoImpl();
        CentroTrabajoDao centroTrabajoDao = new CentroTrabajoDaoImpl();
        DemandaDao demandaDao = new DemandaDaoImpl();
        ProductoDao productoDao = new ProductoDaoImpl();
        TamañoDao tamañoDao = new TamañoDaoImpl();

        ArrayList<Demanda> demandas = demandaDao.getDemanda(productoDao.listarProductos(), tamañoDao.listarTamaños(), centroTrabajoDao.listarCentros());
        Demanda demanda1 = new Demanda(demandas.get(0));

        JsonVista jsonVista = new JsonVista();

        jsonVista.setDemanda(new Demanda(new Demanda(null, demandas.get(demandas.size() - 1).getTamaños())));
        System.out.println(request.getParameter("hora"));
        jsonVista.setEventosVista(eventoVistaDao.listarEventos(request.getParameter("fecha"), (request.getParameter("hora").equals("08:00:00")) ? "08:00:00" : request.getParameter("hora") + ":00", demandas, centroTrabajoDao.listarCentros()));
        jsonVista.setCentroTrabajos(centroTrabajoDao.listarCentros());
        out.print(gson.toJson(jsonVista));
        out.flush();
        out.close();

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
