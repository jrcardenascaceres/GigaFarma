package com.gigafarma.modelo;

public class Laboratorio {

    private int idlab;
    private String estado;
    private String deslab;
    private String nomlab;
    private Respuesta respuesta;
    
    public int getIdlab() {
        return idlab;
    }

    public void setIdlab(int idlab) {
        this.idlab = idlab;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDeslab() {
        return deslab;
    }

    public void setDeslab(String deslab) {
        this.deslab = deslab;
    }

    public String getNomlab() {
        return nomlab;
    }

    public void setNomlab(String nomlab) {
        this.nomlab = nomlab;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }    
}
