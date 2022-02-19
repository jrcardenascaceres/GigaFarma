package com.gigafarma.modelo;

import java.sql.Date;

public class Producto {

    private int ID_PRODUCTO;
    private String ESTADO;
    private Date FEC_ALT;
    private int USU_ALT;
    private Date FEC_MOD;
    private int USU_MOD;
    private Date FEC_BAJ;
    private int USU_BAJ;
    private String DESCRIPCION;
    private String NOMBRE;
    private int ID_LABORATORIO;
    private int ID_CATEGORIA;
    private double PRECIO;
    private int CANTIDAD;
    private String IMAGEN;
    private Respuesta respuesta;

    public int getID_PRODUCTO() {
        return ID_PRODUCTO;
    }

    public void setID_PRODUCTO(int ID_PRODUCTO) {
        this.ID_PRODUCTO = ID_PRODUCTO;
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

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public int getID_LABORATORIO() {
        return ID_LABORATORIO;
    }

    public void setID_LABORATORIO(int ID_LABORATORIO) {
        this.ID_LABORATORIO = ID_LABORATORIO;
    }

    public int getID_CATEGORIA() {
        return ID_CATEGORIA;
    }

    public void setID_CATEGORIA(int ID_CATEGORIA) {
        this.ID_CATEGORIA = ID_CATEGORIA;
    }

    public double getPRECIO() {
        return PRECIO;
    }

    public void setPRECIO(double PRECIO) {
        this.PRECIO = PRECIO;
    }

    public int getCANTIDAD() {
        return CANTIDAD;
    }

    public void setCANTIDAD(int CANTIDAD) {
        this.CANTIDAD = CANTIDAD;
    }

    public String getIMAGEN() {
        return IMAGEN;
    }

    public void setIMAGEN(String IMAGEN) {
        this.IMAGEN = IMAGEN;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }
}
