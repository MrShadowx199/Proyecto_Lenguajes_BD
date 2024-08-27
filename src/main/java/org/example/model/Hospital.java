/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.model;

/**
 *
 * @author valec
 */
public class Hospital {
    private long idHospital;
    private String nombreHospital;
    private String direccionHospital;
    private String telefonoHospital;

    public Hospital(long idHospital, String nombreHospital, String direccionHospital, String telefonoHospital) {
        this.idHospital = idHospital;
        this.nombreHospital = nombreHospital;
        this.direccionHospital = direccionHospital;
        this.telefonoHospital = telefonoHospital;
    }
    public long getIdHospital() {
        return idHospital;
    }

    public void setIdHospital(long idHospital) {
        this.idHospital = idHospital;
    }

    public String getNombreHospital() {
        return nombreHospital;
    }

    public void setNombreHospital(String nombreHospital) {
        this.nombreHospital = nombreHospital;
    }

    public String getDireccionHospital() {
        return direccionHospital;
    }

    public void setDireccionHospital(String direccionHospital) {
        this.direccionHospital = direccionHospital;
    }

    public String getTelefonoHospital() {
        return telefonoHospital;
    }

    public void setTelefonoHospital(String telefonoHospital) {
        this.telefonoHospital = telefonoHospital;
    }
}
