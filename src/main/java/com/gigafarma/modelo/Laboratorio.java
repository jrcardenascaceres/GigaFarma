/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gigafarma.modelo;

public class Laboratorio {
    private int ID_LABORATORIO;
    private String ESTADO;
    private double FEC_ALT;
    private int USU_ALT;
    private double FEC_MOD;
    private int USU_MOD;
    private double FEC_BAJ;
    private int USU_BAJ;
    private String DESCRIPCION;
    private String NOMBRE;
    private Respuesta respuesta;

    public Laboratorio() {
    }

    public Laboratorio(int ID_LABORATORIO, String ESTADO, double FEC_ALT, int USU_ALT, double FEC_MOD, int USU_MOD, double FEC_BAJ, int USU_BAJ, String DESCPRICION, String NOMBRE) {
        this.ID_LABORATORIO = ID_LABORATORIO;
        this.ESTADO = ESTADO;
        this.FEC_ALT = FEC_ALT;
        this.USU_ALT = USU_ALT;
        this.FEC_MOD = FEC_MOD;
        this.USU_MOD = USU_MOD;
        this.FEC_BAJ = FEC_BAJ;
        this.USU_BAJ = USU_BAJ;
        this.DESCRIPCION = DESCRIPCION;
        this.NOMBRE = NOMBRE;
    }

    public int getID_LABORATORIO() {
        return ID_LABORATORIO;
    }

    public void setID_LABORATORIO(int ID_LABORATORIO) {
        this.ID_LABORATORIO = ID_LABORATORIO;
    }

    public String getESTADO() {
        return ESTADO;
    }

    public void setESTADO(String ESTADO) {
        this.ESTADO = ESTADO;
    }

    public double getFEC_ALT() {
        return FEC_ALT;
    }

    public void setFEC_ALT(double FEC_ALT) {
        this.FEC_ALT = FEC_ALT;
    }

    public int getUSU_ALT() {
        return USU_ALT;
    }

    public void setUSU_ALT(int USU_ALT) {
        this.USU_ALT = USU_ALT;
    }

    public double getFEC_MOD() {
        return FEC_MOD;
    }

    public void setFEC_MOD(double FEC_MOD) {
        this.FEC_MOD = FEC_MOD;
    }

    public int getUSU_MOD() {
        return USU_MOD;
    }

    public void setUSU_MOD(int USU_MOD) {
        this.USU_MOD = USU_MOD;
    }

    public double getFEC_BAJ() {
        return FEC_BAJ;
    }

    public void setFEC_BAJ(double FEC_BAJ) {
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

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }

    
}
