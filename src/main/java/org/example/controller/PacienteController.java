package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Paciente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PacienteController {

    // Método para cargar la lista de pacientes desde la base de datos
    public List<Paciente> loadList(DBConnection dbConnection) {
        List<Paciente> pacientes = new ArrayList<>();
        String query = "SELECT ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente FROM Paciente"; // Corregido

        try (Connection connection = dbConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                int idPaciente = rs.getInt("ID_Paciente");
                String nombrePaciente = rs.getString("Nombre_Paciente");
                String primerApellido = rs.getString("PriApellido_Paciente");
                String segundoApellido = rs.getString("SegApellido_Paciente");
                String numeroPaciente = rs.getString("Numero_Paciente");
                String direccionPaciente = rs.getString("Direccion_Paciente");
                String correoPaciente = rs.getString("Correo_Paciente");

                Paciente paciente = new Paciente(idPaciente, nombrePaciente, primerApellido, segundoApellido, numeroPaciente, direccionPaciente, correoPaciente);
                pacientes.add(paciente);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pacientes;
    }

    // Método para agregar un nuevo paciente a la base de datos
    public void addPaciente(DBConnection dbConnection, Paciente paciente) {
        String query = "INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (?, ?, ?, ?, ?, ?, ?)"; // Corregido

        try (Connection connection = dbConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, paciente.getIdPaciente());
            pstmt.setString(2, paciente.getNombrePaciente());
            pstmt.setString(3, paciente.getPrimerApellido());
            pstmt.setString(4, paciente.getSegundoApellido());
            pstmt.setString(5, paciente.getNumeroPaciente());
            pstmt.setString(6, paciente.getDireccionPaciente());
            pstmt.setString(7, paciente.getCorreoPaciente());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para eliminar un paciente de la base de datos
    public void deletePaciente(DBConnection dbConnection, int idPaciente) {
        String query = "DELETE FROM Paciente WHERE ID_Paciente = ?"; // Corregido

        try (Connection connection = dbConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, idPaciente);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
