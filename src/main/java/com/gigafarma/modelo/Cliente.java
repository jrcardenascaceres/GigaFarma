
package com.gigafarma.modelo;


public class Cliente 
{
    private String CodCliente;
    private String NomyApe;
    private String Correo;
    private String Usuario;
    private String Contraseña;
    private int dni;

    public Cliente() {
    }

    public Cliente(String CodCliente, String NomyApe, String Correo, String Usuario, String Contraseña, int dni) {
        this.CodCliente = CodCliente;
        this.NomyApe = NomyApe;
        this.Correo = Correo;
        this.Usuario = Usuario;
        this.Contraseña = Contraseña;
        this.dni = dni;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getCodCliente() {
        return CodCliente;
    }

    public void setCodCliente(String CodCliente) {
        this.CodCliente = CodCliente;
    }

    public String getNomyApe() {
        return NomyApe;
    }

    public void setNomyApe(String NomyApe) {
        this.NomyApe = NomyApe;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    
    
            
    
}
