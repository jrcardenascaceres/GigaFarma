
package com.gigafarma.modelo;


public class Empleado 
{

    private String CodEmpleado;
    private String NomyApe;
    private String Sexo;
    private String Correo;
    private String Usuario;
    private String Contraseña;
    private int dni;

    public Empleado() {
    }

    public Empleado(String CodEmpleado, String NomyApe, String Sexo, String Correo, String Usuario, String Contraseña, int dni) {
        this.CodEmpleado = CodEmpleado;
        this.NomyApe = NomyApe;
        this.Sexo = Sexo;
        this.Correo = Correo;
        this.Usuario = Usuario;
        this.Contraseña = Contraseña;
        this.dni = dni;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getCodEmpleado() {
        return CodEmpleado;
    }

    public void setCodEmpleado(String CodEmpleado) {
        this.CodEmpleado = CodEmpleado;
    }

    public String getNomyApe() {
        return NomyApe;
    }

    public void setNomyApe(String NomyApe) {
        this.NomyApe = NomyApe;
    }

    public String getSexo() {
        return Sexo;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }
   
   
}
