package org.example.model;

import java.util.Date;

public class Receta {
    private int idReceta;
    private int idPaciente;
    private String nombreMedicina;
    private Date fechaReceta;

    public Receta(int idReceta, int idPaciente, String nombreMedicina, Date fechaReceta) {
        this.idReceta = idReceta;
        this.idPaciente = idPaciente;
        this.nombreMedicina = nombreMedicina;
        this.fechaReceta = fechaReceta;
    }

    // Getters y setters
    public int getIdReceta() {
        return idReceta;
    }

    public void setIdReceta(int idReceta) {
        this.idReceta = idReceta;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getNombreMedicina() {
        return nombreMedicina;
    }

    public void setNombreMedicina(String nombreMedicina) {
        this.nombreMedicina = nombreMedicina;
    }

    public Date getFechaReceta() {
        return fechaReceta;
    }

    public void setFechaReceta(Date fechaReceta) {
        this.fechaReceta = fechaReceta;
    }
}
