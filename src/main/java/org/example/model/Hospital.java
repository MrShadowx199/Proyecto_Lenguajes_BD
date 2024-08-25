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
    private int idHospital;
    private String nombreHospital;
    private String direccionHospital;
    private int telefonoHospital;

    public Hospital(int idHospital, String nombreHospital, String direccionHospital, int telefonoHospital) {
        this.idHospital = idHospital;
        this.nombreHospital = nombreHospital;
        this.direccionHospital = direccionHospital;
        this.telefonoHospital = telefonoHospital;
    }
    public int getIdHospital() {
        return idHospital;
    }

    public void setIdHospital(int idHospital) {
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

    public int getTelefonoHospital() {
        return telefonoHospital;
    }

    public void setTelefonoHospital(int telefonoHospital) {
        this.telefonoHospital = telefonoHospital;
    }
}
