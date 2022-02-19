package com.gigafarma.dao;

import com.gigafarma.modelo.Persona;
import com.gigafarma.modelo.Producto;
import com.gigafarma.modelo.Respuesta;
import com.gigafarma.utill.ConnectionDB;
import java.util.*;
import java.sql.*;

public class Negocio {

    private static ConnectionDB cdb;
    private static PreparedStatement ps = null;
    private static CallableStatement cs = null;
    private static ResultSet rs = null;

    public Negocio() {
        cdb = ConnectionDB.newInstance();
    }

    private void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (cdb != null) {
                cdb.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar conexion :" + e.getMessage());
        }
    }

    public Persona Login(String usuario, String clave) {
        Persona p = new Persona();
        Respuesta r = new Respuesta();
        try {
            String sql = "SELECT id_persona, num_documento, nombres, ape_paterno, ape_materno, genero, correo, perfil FROM gigafarma.persona WHERE estado='A' AND (correo=? OR usuario=?) AND clave=?;";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, usuario);
            ps.setString(3, clave);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setID_PERSONA(rs.getInt(1));
                p.setNUM_DOCUMENTO(rs.getString(2));
                p.setNOMBRES(rs.getString(3));
                p.setAPE_PATERNO(rs.getString(4));
                p.setAPE_MATERNO(rs.getString(5));
                p.setGENERO(rs.getString(6));
                p.setCORREO(rs.getString(7));
                p.setPERFIL(rs.getString(8));
                r.setEstado(true);
                r.setMensaje("Bienvenido a GigaFarma.");
                r.setTipo("success");
            } else {
                r.setMensaje("El usuario o la clave no coincide.");
                r.setTipo("warn");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        p.setRespuesta(r);
        return p;
    }

    public Producto regProducto(Producto p) {
        Respuesta r = new Respuesta();
        try {
            String sql = "{CALL SP_INSERT_PRODUCTO(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = cdb.getConnection().prepareCall(sql);
            cs.setString(1, p.getESTADO());
            cs.setInt(2, p.getUSU_ALT());
            cs.setString(3, p.getDESCRIPCION());
            cs.setString(4, p.getNOMBRE());
            cs.setInt(5, p.getID_LABORATORIO());
            cs.setInt(6, p.getID_CATEGORIA());
            cs.setDouble(7, p.getPRECIO());
            cs.setInt(8, p.getCANTIDAD());
            cs.setString(9, p.getIMAGEN());
            if (cs.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Producto registrado.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede registrar el producto.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        p.setRespuesta(r);
        return p;
    }

    public List<Producto> lisProductos() {
        List<Producto> productos = new ArrayList();
        try {
            String sql = "{CALL SP_SELECT_PRODUCTOS()}";
            cs = cdb.getConnection().prepareCall(sql);
            rs = cs.executeQuery();
            Producto p;
            while (rs.next()) {
                p = new Producto();
                p.setID_PRODUCTO(rs.getInt(1));
                p.setNOMBRE(rs.getString(2));
                p.setDESCRIPCION(rs.getString(3));
                p.setID_LABORATORIO(rs.getInt(4));
                p.setID_CATEGORIA(rs.getInt(5));
                p.setPRECIO(rs.getDouble(6));
                p.setCANTIDAD(rs.getInt(7));
                p.setIMAGEN(rs.getString(8));
                productos.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return productos;
    }

    public Producto actProducto(Producto p) {
        Respuesta r = new Respuesta();
        try {
            String sql = "{CALL SP_UPDATE_PRODUCTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = cdb.getConnection().prepareCall(sql);
            cs.setInt(1, p.getID_PRODUCTO());
            cs.setString(2, p.getESTADO());
            cs.setInt(3, p.getUSU_MOD());
            cs.setString(4, p.getDESCRIPCION());
            cs.setString(5, p.getNOMBRE());
            cs.setInt(6, p.getID_LABORATORIO());
            cs.setInt(7, p.getID_CATEGORIA());
            cs.setDouble(8, p.getPRECIO());
            cs.setInt(9, p.getCANTIDAD());
            cs.setString(10, p.getIMAGEN());
            if (cs.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Producto actualizado.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede actualizar el producto.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        p.setRespuesta(r);
        return p;
    }

    public Producto eliProducto(Producto p) {
        Respuesta r = new Respuesta();
        try {
            String sql = "{CALL SP_DELETE_PRODUCTO(?, ?, ?)}";
            cs = cdb.getConnection().prepareCall(sql);
            cs.setInt(1, p.getID_PRODUCTO());
            cs.setString(2, p.getESTADO());
            cs.setInt(3, p.getUSU_BAJ());
            if (cs.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Producto eliminado.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede eliminar el producto.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        p.setRespuesta(r);
        return p;
    }

    public Producto obtenerProductoXId(int idProducto) {
        Producto p = new Producto();
        Respuesta r = new Respuesta();
        try {
            String sql = "SELECT ID_PRODUCTO, NOMBRE, DESCRIPCION, ID_LABORATORIO, ID_CATEGORIA, PRECIO, CANTIDAD, IMAGEN FROM gigafarma.producto WHERE ESTADO = 'A' AND ID_PRODUCTO = ?;";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setInt(1, idProducto);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setID_PRODUCTO(rs.getInt(1));
                p.setNOMBRE(rs.getString(2));
                p.setDESCRIPCION(rs.getString(3));
                p.setID_LABORATORIO(rs.getInt(4));
                p.setID_CATEGORIA(rs.getInt(5));
                p.setPRECIO(rs.getDouble(6));
                p.setCANTIDAD(rs.getInt(7));
                p.setIMAGEN(rs.getString(8));
                r.setEstado(true);
                r.setMensaje("Producto encontrado.");
                r.setTipo("success");
            } else {
                r.setMensaje("El producto no existe.");
                r.setTipo("warn");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        p.setRespuesta(r);
        return p;
    }
}
