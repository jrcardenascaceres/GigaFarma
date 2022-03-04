package com.gigafarma.modelo;

public class Compra extends Producto {

    private int cantidad;

    public double total() {
        return cantidad * super.getPRECIO();
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
