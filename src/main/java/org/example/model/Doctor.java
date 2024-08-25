package org.example.model;

public class Doctor {

    private int idDoctor;
    private String especializacion;
    private String nombreDoctor;
    private int idDepartamento;

    public Doctor(int idDoctor, String especializacion, String nombreDoctor, int idDepartamento) {
        this.idDoctor = idDoctor;
        this.especializacion = especializacion;
        this.nombreDoctor = nombreDoctor;
        this.idDepartamento = idDepartamento;
    }

    public int getIdDoctor() {
        return idDoctor;
    }

    public String getEspecializacion() {
        return especializacion;
    }

    public String getNombreDoctor() {
        return nombreDoctor;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }
}
