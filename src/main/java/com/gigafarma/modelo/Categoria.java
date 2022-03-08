package com.gigafarma.modelo;

public class Categoria {

    private int idCategoria;
    private String categoria;
    private char estado;
    private String imagen;
    private Respuesta respuesta;

    public Categoria() {
    }

    public Categoria(int idCategoria, String categoria, char estado, String imagen, Respuesta respuesta) {
        this.idCategoria = idCategoria;
        this.categoria = categoria;
        this.estado = estado;
        this.imagen = imagen;
        this.respuesta = respuesta;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }

    
}
