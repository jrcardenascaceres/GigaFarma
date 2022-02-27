/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gigafarma.servlets;

import com.gigafarma.dao.Negocio;
import com.gigafarma.modelo.Producto;
import com.google.gson.Gson;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

@MultipartConfig
public class Control extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Control.class.getName());
    Negocio negocio = new Negocio();
    // Subir directorio de almacenamiento de archivos
    private static final String UPLOAD_DIRECTORY = "assets" + File.separator + "img" + File.separator + "productos";

    // Cargar configuración
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

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
            case "lisProductos":
                listarProductos(request, response);
                break;
            case "regProducto":
                registrarProducto(request, response);
                break;
            case "actProducto":
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
        HttpSession sesionOk = request.getSession();
        p.setUSU_ALT(Integer.parseInt(sesionOk.getAttribute("idUsuario").toString()));
        p.setDESCRIPCION(request.getParameter("descripcion"));
        p.setNOMBRE(request.getParameter("nombre"));
        p.setID_CATEGORIA(Integer.parseInt(request.getParameter("categoria")));
        p.setID_LABORATORIO(Integer.parseInt(request.getParameter("laboratorio")));
        p.setPRECIO(Double.parseDouble(request.getParameter("precio")));
        p.setCANTIDAD(Integer.parseInt(request.getParameter("cantidad")));

        Part part = request.getPart("imagen");

        String fileName = part.getSubmittedFileName();
        String extension = "";
        int index = fileName.lastIndexOf('.');
        if (index > 0) {
            extension = fileName.substring(index + 1);
        }
        fileName = negocio.getNextCodProd() + "." + extension;
        p.setIMAGEN(fileName);
        Producto pr = negocio.regProducto(p);
        if (pr.getRespuesta().isEstado()) {
            InputStream is = part.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
            String filePath = uploadPath + File.separator + fileName;
            FileOutputStream fos = new FileOutputStream(filePath);
            fos.write(data);
            fos.close();
        }
        PrintWriter pw = response.getWriter();
        pw.println(new Gson().toJson(pr));
    }

    protected void atualizarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        HttpSession sesionOk = request.getSession();
        p.setID_PRODUCTO(Integer.parseInt(request.getParameter("idProducto")));
        p.setUSU_MOD(Integer.parseInt(sesionOk.getAttribute("idUsuario").toString()));
        p.setDESCRIPCION(request.getParameter("descripcion"));
        p.setNOMBRE(request.getParameter("nombre"));
        p.setID_CATEGORIA(Integer.parseInt(request.getParameter("categoria")));
        p.setID_LABORATORIO(Integer.parseInt(request.getParameter("laboratorio")));
        p.setPRECIO(Double.parseDouble(request.getParameter("precio")));
        p.setCANTIDAD(Integer.parseInt(request.getParameter("cantidad")));

        Part part = request.getPart("imagen");

        String fileName = part.getSubmittedFileName();
        boolean isUpdate = false;
        if (fileName.isEmpty()) {
           fileName = request.getParameter("prevImg"); 
        } else {
            String extension = "";
            int index = fileName.lastIndexOf('.');
            if (index > 0) {
                extension = fileName.substring(index + 1);
            }
            String preName = FilenameUtils.removeExtension(request.getParameter("prevImg"));
            fileName = preName + "." + extension;
            isUpdate = true;
        }
        p.setIMAGEN(fileName);
        Producto pr = negocio.actProducto(p);
        if (pr.getRespuesta().isEstado() && isUpdate) {
            InputStream is = part.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
            String filePath = uploadPath + File.separator + fileName;
            FileOutputStream fos = new FileOutputStream(filePath);
            fos.write(data);
            is.close();
            fos.close();
        }
        PrintWriter pw = response.getWriter();
        pw.println(new Gson().toJson(pr));
    }

    protected void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        HttpSession sesionOk = request.getSession();
        p.setID_PRODUCTO(Integer.parseInt(request.getParameter("idProducto")));
        p.setESTADO("E");
        p.setUSU_BAJ(Integer.parseInt(sesionOk.getAttribute("idUsuario").toString()));
        
        PrintWriter pw = response.getWriter();
        pw.println(new Gson().toJson(negocio.eliProducto(p)));
        request.getRequestDispatcher("/productos.jsp").forward(request, response);
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
