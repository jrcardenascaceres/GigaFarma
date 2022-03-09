package com.gigafarma.modelo;

import java.sql.Date;

public class Venta {

    private int ID_VENTA;
    private String ESTADO;
    private Date FEC_ALT;
    private int USU_ALT;
    private Date FEC_MOD;
    private int USU_MOD;
    private Date FEC_BAJ;
    private int USU_BAJ;
    private String DESCRIPCION;
    private Date FEC_ENTREGA;
    private String TIP_ENTREGA;
    private String DIRECCION;
    private String CORREO;
    private String TARJETA;
    private Respuesta respuesta;

    public int getID_VENTA() {
        return ID_VENTA;
    }

    public void setID_VENTA(int ID_VENTA) {
        this.ID_VENTA = ID_VENTA;
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

    public Date getFEC_MOD() {
        return FEC_MOD;
    }

    public void setFEC_MOD(Date FEC_MOD) {
        this.FEC_MOD = FEC_MOD;
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

    public Date getFEC_ENTREGA() {
        return FEC_ENTREGA;
    }

    public void setFEC_ENTREGA(Date FEC_ENTREGA) {
        this.FEC_ENTREGA = FEC_ENTREGA;
    }

    public String getTIP_ENTREGA() {
        return TIP_ENTREGA;
    }

    public void setTIP_ENTREGA(String TIP_ENTREGA) {
        this.TIP_ENTREGA = TIP_ENTREGA;
    }

    public String getDIRECCION() {
        return DIRECCION;
    }

    public void setDIRECCION(String DIRECCION) {
        this.DIRECCION = DIRECCION;
    }

    public String getCORREO() {
        return CORREO;
    }

    public void setCORREO(String CORREO) {
        this.CORREO = CORREO;
    }

    public String getTARJETA() {
        return TARJETA;
    }

    public void setTARJETA(String TARJETA) {
        this.TARJETA = TARJETA;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }

}
