package com.gigafarma.modelo;

import java.sql.Date;

public class Persona {

    private int ID_PERSONA;
    private String ESTADO;
    private Date FEC_ALT;
    private int USU_ALT;
    private Date FEC_MOD;
    private int USU_MOD;
    private Date FEC_BAJ;
    private int USU_BAJ;
    private String OBSERVACION;
    private String TIP_DOCUMENTO;
    private String NUM_DOCUMENTO;
    private String NOMBRES;
    private String APE_PATERNO;
    private String APE_MATERNO;
    private String GENERO;
    private String UBIGEO;
    private String DOMICILIO;
    private String CORREO;
    private String PERFIL;
    private String USUARIO;
    private String CLAVE;
    private Respuesta respuesta;

    public int getID_PERSONA() {
        return ID_PERSONA;
    }

    public void setID_PERSONA(int ID_PERSONA) {
        this.ID_PERSONA = ID_PERSONA;
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

    public String getOBSERVACION() {
        return OBSERVACION;
    }

    public void setOBSERVACION(String OBSERVACION) {
        this.OBSERVACION = OBSERVACION;
    }

    public String getTIP_DOCUMENTO() {
        return TIP_DOCUMENTO;
    }

    public void setTIP_DOCUMENTO(String TIP_DOCUMENTO) {
        this.TIP_DOCUMENTO = TIP_DOCUMENTO;
    }

    public String getNUM_DOCUMENTO() {
        return NUM_DOCUMENTO;
    }

    public void setNUM_DOCUMENTO(String NUM_DOCUMENTO) {
        this.NUM_DOCUMENTO = NUM_DOCUMENTO;
    }

    public String getNOMBRES() {
        return NOMBRES;
    }

    public void setNOMBRES(String NOMBRES) {
        this.NOMBRES = NOMBRES;
    }

    public String getAPE_PATERNO() {
        return APE_PATERNO;
    }

    public void setAPE_PATERNO(String APE_PATERNO) {
        this.APE_PATERNO = APE_PATERNO;
    }

    public String getAPE_MATERNO() {
        return APE_MATERNO;
    }

    public void setAPE_MATERNO(String APE_MATERNO) {
        this.APE_MATERNO = APE_MATERNO;
    }

    public String getGENERO() {
        return GENERO;
    }

    public void setGENERO(String GENERO) {
        this.GENERO = GENERO;
    }

    public String getUBIGEO() {
        return UBIGEO;
    }

    public void setUBIGEO(String UBIGEO) {
        this.UBIGEO = UBIGEO;
    }

    public String getDOMICILIO() {
        return DOMICILIO;
    }

    public void setDOMICILIO(String DOMICILIO) {
        this.DOMICILIO = DOMICILIO;
    }

    public String getCORREO() {
        return CORREO;
    }

    public void setCORREO(String CORREO) {
        this.CORREO = CORREO;
    }

    public String getPERFIL() {
        return PERFIL;
    }

    public void setPERFIL(String PERFIL) {
        this.PERFIL = PERFIL;
    }

    public String getUSUARIO() {
        return USUARIO;
    }

    public void setUSUARIO(String USUARIO) {
        this.USUARIO = USUARIO;
    }

    public String getCLAVE() {
        return CLAVE;
    }

    public void setCLAVE(String CLAVE) {
        this.CLAVE = CLAVE;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }
}
