/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Hospital;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class HospitalController {
    public List<Hospital> loadList(DBConnection db) {
        List<Hospital> hospitalList = new ArrayList<>();
        ResultSet rs = null;
        try {
            // Llama al procedimiento almacenado
            String procedureCall = "{ call GET_HOSPITAL_CURSOR(?) }";
            rs = db.executeProcedure(procedureCall);

            // Procesa el ResultSet
            while (rs.next()) {
                Hospital h = new Hospital(
                        rs.getInt("ID_HOSPITAL"),
                        rs.getString("NOMBRE_HOSPITAL"),
                        rs.getString("DIRECCION_HOSPITAL"),
                        rs.getInt("TELEFONO_HOSPITAL")
                );
                hospitalList.add(h);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            // Cierra el ResultSet y la conexión en el bloque finally
            try {
                if (rs != null) rs.close();
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return hospitalList;
    }

    public void addHospital(DBConnection db, Hospital hospital) {
        String sql = "{ call INSERTAR_HOSPITAL(?, ?, ?, ?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            // Establecer los parámetros del procedimiento almacenado
            stmt.setInt(1, hospital.getIdHospital());
            stmt.setString(2, hospital.getNombreHospital());
            stmt.setString(3, hospital.getDireccionHospital());
            stmt.setInt(4, hospital.getTelefonoHospital());

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();
            System.out.println("Hospital agregado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteHospital(DBConnection db, int idHospital) {
        String sql = "{ call ELIMINAR_HOSPITAL(?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            // Establecer el parámetro del procedimiento almacenado
            stmt.setInt(1, idHospital);

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();
            System.out.println("Hospital eliminado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
