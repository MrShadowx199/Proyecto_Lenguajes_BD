package org.example.model;

public class Paciente {

    private int idPaciente;
    private String nombrePaciente;
    private String primerApellido;
    private String segundoApellido;
    private String numeroPaciente;
    private String direccionPaciente;
    private String correoPaciente;

    public Paciente(int idPaciente, String nombrePaciente, String primerApellido, String segundoApellido, String numeroPaciente, String direccionPaciente, String correoPaciente) {
        this.idPaciente = idPaciente;
        this.nombrePaciente = nombrePaciente;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.numeroPaciente = numeroPaciente;
        this.direccionPaciente = direccionPaciente;
        this.correoPaciente = correoPaciente;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public String getNumeroPaciente() {
        return numeroPaciente;
    }

    public String getDireccionPaciente() {
        return direccionPaciente;
    }

    public String getCorreoPaciente() {
        return correoPaciente;
    }
}
