/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gigafarma.servlets;

import com.gigafarma.dao.Negocio;
import com.gigafarma.modelo.Producto;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Control extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        switch (request.getParameter("accion")) {
            case "lisProductos":
                listarProductos(request, response);
                break;
            case "regProducto":
                registrarProducto(request, response);
                break;
            case "ediProducto":
                atualizarProducto(request, response);
                break;
            case "eliProducto":
                eliminarProducto(request, response);
                break;
        }
    }

    protected void listarProductos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        negocio.lisProductos();
        request.getRequestDispatcher("/Productos.jsp").forward(request, response);
    }

    protected void registrarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        p.setNOMBRE(request.getParameter("nombre"));
//        ----------------
//        String arch = getServletContext().getRealPath("/assets/img/productos/");
//        arch = arch.replaceAll("\\\\", "/");
//        int pos = arch.indexOf("target");
//        String res = arch.substring(0, pos - 1);
//        arch = res + "/src/main/webapp/files";
//        
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        factory.setSizeThreshold(1024);
//        factory.setRepository(new File(arch));
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        try {
//            List<FileItem> partes = upload.parseRequest(request);
//            for (FileItem item : partes) {
//                File file = new File(arch, item.getName());
//                item.write(file);
//            }
//            request.setAttribute("dato", "Archivo subido ok!!!");
//        } catch (Exception ex) {
//            request.setAttribute("dato", ex.getMessage());
//        }
//--------------------
        negocio.regProducto(p);
        request.getRequestDispatcher("/Productos.jsp").forward(request, response);
    }

    protected void atualizarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        p.setNOMBRE(request.getParameter("nom_producto"));
        negocio.actProducto(p);
    }

    protected void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        negocio.eliProducto(p);
        request.getRequestDispatcher("/Productos.jsp").forward(request, response);
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
