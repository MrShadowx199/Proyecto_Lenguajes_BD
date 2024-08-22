package org.example.model;

public class Personal {
    int idPersonal;
    String nombrePersonal;
    String primerApellido;
    String segundoApellido;
    String numeroPersonal;
    String direccionPersonal;
    String correoPersonal;
    int idDepartamento;

    public Personal(int idPersonal, String nombrePersonal, String primerApellido, String segundoApellido, String numeroPersonal, String direccionPersonal, String correoPersonal, int idDepartamento) {
        this.idPersonal = idPersonal;
        this.nombrePersonal = nombrePersonal;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.numeroPersonal = numeroPersonal;
        this.direccionPersonal = direccionPersonal;
        this.correoPersonal = correoPersonal;
        this.idDepartamento = idDepartamento;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getCorreoPersonal() {
        return correoPersonal;
    }

    public void setCorreoPersonal(String correoPersonal) {
        this.correoPersonal = correoPersonal;
    }

    public String getDireccionPersonal() {
        return direccionPersonal;
    }

    public void setDireccionPersonal(String direccionPersonal) {
        this.direccionPersonal = direccionPersonal;
    }

    public String getNumeroPersonal() {
        return numeroPersonal;
    }

    public void setNumeroPersonal(String numeroPersonal) {
        this.numeroPersonal = numeroPersonal;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getNombrePersonal() {
        return nombrePersonal;
    }

    public void setNombrePersonal(String nombrePersonal) {
        this.nombrePersonal = nombrePersonal;
    }

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
    }
}
