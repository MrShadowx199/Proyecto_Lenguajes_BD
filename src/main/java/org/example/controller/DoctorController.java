package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Doctor;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorController {

    public List<Doctor> loadList(DBConnection db) {
        List<Doctor> doctorList = new ArrayList<>();
        ResultSet rs = null;
        try {
            String procedureCall = "{ call GET_DOCTOR_CURSOR(?) }";
            rs = db.executeProcedure(procedureCall);

            while (rs.next()) {
                Doctor d = new Doctor(
                        rs.getInt("ID_DOCTOR"),
                        rs.getString("ESPECIALIZACION"),
                        rs.getString("NOMBRE_DOCTOR"),
                        rs.getInt("ID_DEPARTAMENTO")
                );
                doctorList.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return doctorList;
    }

    public void addDoctor(DBConnection db, Doctor doctor) {
        String sql = "{ call AGREGAR_DOCTOR(?, ?, ?, ?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setInt(1, doctor.getIdDoctor());
            stmt.setString(2, doctor.getEspecializacion());
            stmt.setString(3, doctor.getNombreDoctor());
            stmt.setInt(4, doctor.getIdDepartamento());

            stmt.executeUpdate();
            System.out.println("Doctor agregado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDoctor(DBConnection db, int idDoctor) {
        String sql = "{ call ELIMINAR_DOCTOR(?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setInt(1, idDoctor);

            stmt.executeUpdate();
            System.out.println("Doctor eliminado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}