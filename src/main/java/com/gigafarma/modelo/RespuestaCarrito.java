package com.gigafarma.modelo;

import java.util.List;

public class RespuestaCarrito extends Respuesta {

    private List<Compra> compras;

    public List<Compra> getCompras() {
        return compras;
    }

    public void setCompras(List<Compra> compras) {
        this.compras = compras;
    }
}
