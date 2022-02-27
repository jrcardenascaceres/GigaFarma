package com.gigafarma.servlets;

import com.gigafarma.dao.Negocio;
import com.gigafarma.modelo.Persona;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Control.class.getName());
    Negocio negocio = new Negocio();

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
        switch (request.getParameter("accion")) {
            case "login":
                login(request, response);
                break;
        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        Persona p = negocio.Login(usuario, clave);
        if (p.getRespuesta().isEstado()) {
            HttpSession session = request.getSession();
            session.setAttribute("idUsuario", p.getID_PERSONA());
            session.setAttribute("numDocumento", p.getNUM_DOCUMENTO());
            session.setAttribute("nombres", p.getNOMBRES());
            session.setAttribute("apaterno", p.getAPE_PATERNO());
            session.setAttribute("amaterno", p.getAPE_MATERNO());
            session.setAttribute("genero", p.getGENERO());
            session.setAttribute("correo", p.getCORREO());
            session.setAttribute("perfil", p.getPERFIL());
        }
        PrintWriter out = response.getWriter();
        out.println(new Gson().toJson(p));
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
