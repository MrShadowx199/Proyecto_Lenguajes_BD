package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Doctor;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorController {

    // Metodo para cargar la lista de doctores desde la base de datos
    public List<Doctor> loadList(DBConnection dbConnection) {
        List<Doctor> doctores = new ArrayList<>();
        String query = "SELECT ID_DOCTOR, ESPECIALIZACION, NOMBRE_DOCTOR, ID_DEPARTAMENTO FROM DOCTOR";

        try (Connection connection = dbConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                int idDoctor = rs.getInt("ID_DOCTOR");
                String especializacion = rs.getString("ESPECIALIZACION");
                String nombreDoctor = rs.getString("NOMBRE_DOCTOR");
                int idDepartamento = rs.getInt("ID_DEPARTAMENTO");

                Doctor doctor = new Doctor(idDoctor, especializacion, nombreDoctor, idDepartamento);
                doctores.add(doctor);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctores;
    }

    // Método para agregar un nuevo doctor a la base de datos
    public void addDoctor(DBConnection dbConnection, Doctor doctor) {
        String query = "INSERT INTO DOCTOR (ID_DOCTOR, ESPECIALIZACION, NOMBRE_DOCTOR, ID_DEPARTAMENTO) VALUES (?, ?, ?, ?)";

        try (Connection connection = dbConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, doctor.getIdDoctor());
            pstmt.setString(2, doctor.getEspecializacion());
            pstmt.setString(3, doctor.getNombreDoctor());
            pstmt.setInt(4, doctor.getIdDepartamento());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para eliminar un doctor de la base de datos
    public void deleteDoctor(DBConnection dbConnection, int idDoctor) {
        String query = "DELETE FROM DOCTOR WHERE ID_DOCTOR = ?";

        try (Connection connection = dbConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, idDoctor);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
