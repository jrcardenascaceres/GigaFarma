package com.gigafarma.modelo;

import java.sql.Date;

public class DetalleVenta {

    private int ID_DVENTA;
    private String ESTADO;
    private Date FEC_ALT;
    private int USU_ALT;
    private Date FEC_MODL;
    private int USU_MOD;
    private Date FEC_BAJ;
    private int USU_BAJ;
    private String DESCRIPCION;
    private int VENTA;
    private int PRODUCTO;
    private Double PRECIO;
    private int CANTIDAD;
    private Respuesta respuesta;

    public int getID_DVENTA() {
        return ID_DVENTA;
    }

    public void setID_DVENTA(int ID_DVENTA) {
        this.ID_DVENTA = ID_DVENTA;
    }

    public String getESTADO() {
        return ESTADO;
    }

    public void setESTADO(String ESTADO) {
        this.ESTADO = ESTADO;
    }

    public Date getFEC_ALT() {
        return FEC_ALT;
    }

    public void setFEC_ALT(Date FEC_ALT) {
        this.FEC_ALT = FEC_ALT;
    }

    public int getUSU_ALT() {
        return USU_ALT;
    }

    public void setUSU_ALT(int USU_ALT) {
        this.USU_ALT = USU_ALT;
    }

    public Date getFEC_MODL() {
        return FEC_MODL;
    }

    public void setFEC_MODL(Date FEC_MODL) {
        this.FEC_MODL = FEC_MODL;
    }

    public int getUSU_MOD() {
        return USU_MOD;
    }

    public void setUSU_MOD(int USU_MOD) {
        this.USU_MOD = USU_MOD;
    }

    public Date getFEC_BAJ() {
        return FEC_BAJ;
    }

    public void setFEC_BAJ(Date FEC_BAJ) {
        this.FEC_BAJ = FEC_BAJ;
    }

    public int getUSU_BAJ() {
        return USU_BAJ;
    }

    public void setUSU_BAJ(int USU_BAJ) {
        this.USU_BAJ = USU_BAJ;
    }

    public String getDESCRIPCION() {
        return DESCRIPCION;
    }

    public void setDESCRIPCION(String DESCRIPCION) {
        this.DESCRIPCION = DESCRIPCION;
    }

    public int getVENTA() {
        return VENTA;
    }

    public void setVENTA(int VENTA) {
        this.VENTA = VENTA;
    }

    public int getPRODUCTO() {
        return PRODUCTO;
    }

    public void setPRODUCTO(int PRODUCTO) {
        this.PRODUCTO = PRODUCTO;
    }

    public Double getPRECIO() {
        return PRECIO;
    }

    public void setPRECIO(Double PRECIO) {
        this.PRECIO = PRECIO;
    }

    public int getCANTIDAD() {
        return CANTIDAD;
    }

    public void setCANTIDAD(int CANTIDAD) {
        this.CANTIDAD = CANTIDAD;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }
}
