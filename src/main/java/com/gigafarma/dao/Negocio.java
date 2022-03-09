package com.gigafarma.dao;

import com.gigafarma.modelo.Categoria;
import com.gigafarma.modelo.DetalleVenta;
import com.gigafarma.modelo.Laboratorio;
import com.gigafarma.modelo.Persona;
import com.gigafarma.modelo.Producto;
import com.gigafarma.modelo.Respuesta;
import com.gigafarma.modelo.Venta;
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
            String sql = "{CALL SP_INSERT_PRODUCTO(?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = cdb.getConnection().prepareCall(sql);
            cs.setInt(1, p.getUSU_ALT());
            cs.setString(2, p.getDESCRIPCION());
            cs.setString(3, p.getNOMBRE());
            cs.setInt(4, p.getID_LABORATORIO());
            cs.setInt(5, p.getID_CATEGORIA());
            cs.setDouble(6, p.getPRECIO());
            cs.setInt(7, p.getCANTIDAD());
            cs.setString(8, p.getIMAGEN());
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

    public String getNextCodProd() {
        String nextCodProd = "";
        try {
            String sql = "{CALL SP_NEXT_COD_PROD()}";
            cs = cdb.getConnection().prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                nextCodProd = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return nextCodProd;
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
            String sql = "{CALL SP_UPDATE_PRODUCTO(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = cdb.getConnection().prepareCall(sql);
            cs.setInt(1, p.getID_PRODUCTO());
            cs.setInt(2, p.getUSU_MOD());
            cs.setString(3, p.getDESCRIPCION());
            cs.setString(4, p.getNOMBRE());
            cs.setInt(5, p.getID_LABORATORIO());
            cs.setInt(6, p.getID_CATEGORIA());
            cs.setDouble(7, p.getPRECIO());
            cs.setInt(8, p.getCANTIDAD());
            cs.setString(9, p.getIMAGEN());
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

    public List<Producto> lisProductosTop() {
        List<Producto> productos = new ArrayList();
        try {
            String sql = "SELECT ID_PRODUCTO, NOMBRE, DESCRIPCION, ID_LABORATORIO, ID_CATEGORIA, PRECIO, CANTIDAD, IMAGEN FROM gigafarma.producto WHERE ESTADO = 'A';";
            ps = cdb.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
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

    public Laboratorio obtenerLabXId(int idLab) {
        Laboratorio l = new Laboratorio();
        Respuesta r = new Respuesta();
        try {
            String sql = "SELECT ID_LABORATORIO, DESCRIPCION, NOMBRE FROM gigafarma.laboratorio WHERE ID_LABORATORIO = ?";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setInt(1, idLab);
            rs = ps.executeQuery();
            if (rs.next()) {
                l.setIdlab(rs.getInt(1));
                l.setDeslab(rs.getString(2));
                l.setNomlab(rs.getString(3));
                r.setEstado(true);
                r.setMensaje("Laboratorio encontrado.");
                r.setTipo("success");
            } else {
                r.setMensaje("El laboratorio no existe.");
                r.setTipo("warn");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        l.setRespuesta(r);
        return l;
    }

    public List<Laboratorio> lisLab() {
        List<Laboratorio> lista = new ArrayList();
        try {
            String sql = "SELECT ID_LABORATORIO, ESTADO, DESCRIPCION, NOMBRE FROM LABORATORIO";
            ps = cdb.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Laboratorio l = new Laboratorio();
                l.setIdlab(rs.getInt(1));
                l.setEstado(rs.getString(2));
                l.setDeslab(rs.getString(3));
                l.setNomlab(rs.getString(4));
                lista.add(l);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return lista;
    }

    public Categoria regCategoria(Categoria c) {
        Respuesta r = new Respuesta();
        try {
            String sql = "INSERT into gigafarma.categoria (CATEGORIA,IMAGEN) values (?,?)";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setString(1, c.getCategoria());
            ps.setString(2, c.getImagen());
            if (ps.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Categoria registrada.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede registrar la categoria.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        c.setRespuesta(r);
        return c;
    }

    public List<Categoria> lisCategorias() {
        List<Categoria> categorias = new ArrayList();
        try {
            String sql = "SELECT * from gigafarma.categoria WHERE estado = 'A'";
            ps = cdb.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            Categoria c;
            while (rs.next()) {
                c = new Categoria();
                c.setIdCategoria(rs.getInt(1));
                c.setCategoria(rs.getString(2));
                c.setImagen(rs.getString(4));
                categorias.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return categorias;
    }

    public Categoria actCategoria(Categoria c) {
        Respuesta r = new Respuesta();
        try {
            String sql = "UPDATE gigafarma.categoria SET CATEGORIA=?,IMAGEN=? WHERE ID_CATEGORIA=?";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setString(1, c.getCategoria());
            ps.setString(2, c.getImagen());
            ps.setInt(3, c.getIdCategoria());
            if (ps.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Categoria actualizada.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede actualizar la categoria.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        c.setRespuesta(r);
        return c;
    }

    public Categoria eliCategoria(Categoria c) {
        Respuesta r = new Respuesta();
        try {
            String sql = "UPDATE gigafarma.categoria SET ESTADO=? WHERE ID_CATEGORIA=?";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setString(1, String.valueOf(c.getEstado()));
            ps.setInt(2, c.getIdCategoria());
            if (ps.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Categoria Eliminada.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede eliminar la categoria.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        c.setRespuesta(r);
        return c;
    }

    public Categoria obtenerCategoriaXCod(int codigo) {
        Categoria c = new Categoria();
        Respuesta r = new Respuesta();
        try {
            String sql = "SELECT ID_CATEGORIA, CATEGORIA,IMAGEN FROM gigafarma.categoria WHERE ESTADO = 'A' AND ID_CATEGORIA = ?";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                c.setIdCategoria(rs.getInt(1));
                c.setCategoria(rs.getString(2));
                c.setImagen(rs.getString(3));
                r.setEstado(true);
                r.setMensaje("Categoria encontrada.");
                r.setTipo("success");
            } else {
                r.setMensaje("La Categoria no existe.");
                r.setTipo("warn");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        c.setRespuesta(r);
        return c;
    }

    public List<Producto> obtenerListProdXCate(int idCategoria) {
        List<Producto> productos = new ArrayList();
        try {
            String sql = "SELECT ID_PRODUCTO, NOMBRE, DESCRIPCION, ID_LABORATORIO, ID_CATEGORIA, PRECIO, CANTIDAD, IMAGEN FROM gigafarma.producto WHERE ID_CATEGORIA =? AND ESTADO ='A'";
            ps = cdb.getConnection().prepareStatement(sql);
            ps.setInt(1, idCategoria);
            rs = ps.executeQuery();
            Producto p;
            if (rs.next()) {
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
            } else {
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return productos;
    }

    public String getNextCodCate() {
        String nextCodCate = "";
        try {
            String sql = "{CALL SP_NEXT_COD_CATE()}";
            cs = cdb.getConnection().prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                nextCodCate = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return nextCodCate;
    }

    public Venta regVenta(Venta v) {
        Respuesta r = new Respuesta();
        try {
            String sql = "{CALL SP_INSERT_VENTA(?, ?, ?, ?, ?, ?)}";
            cs = cdb.getConnection().prepareCall(sql);
            cs.setInt(1, v.getUSU_ALT());
            cs.setString(2, v.getDESCRIPCION());
            cs.setString(3, v.getCORREO());
            cs.setString(4, v.getDIRECCION());
            cs.setString(5, v.getTARJETA());
            cs.setString(6, v.getTIP_ENTREGA());
            if (cs.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Venta registrado.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede registrar la venta.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        v.setRespuesta(r);
        return v;
    }

    public DetalleVenta regDetVenta(int idVenta, int idProd, double precio, int cantidad) {
        DetalleVenta dv = new DetalleVenta();
        Respuesta r = new Respuesta();
        try {
            String sql = "{CALL SP_INSERT_DETVENTA(?, ?, ?, ?, ?, ?)}";
            cs = cdb.getConnection().prepareCall(sql);
            cs.setInt(1, idVenta);
            cs.setInt(2, idProd);
            cs.setDouble(3, precio);
            cs.setInt(4, cantidad);
            if (cs.executeUpdate() > 0) {
                r.setEstado(true);
                r.setMensaje("Venta registrado.");
                r.setTipo("success");
            } else {
                r.setMensaje("No se puede registrar la venta.");
                r.setTipo("error");
            }
        } catch (SQLException e) {
            r.setMensaje(e.getMessage());
            r.setTipo("error");
        } finally {
            close();
        }
        dv.setRespuesta(r);
        return dv;
    }
}
