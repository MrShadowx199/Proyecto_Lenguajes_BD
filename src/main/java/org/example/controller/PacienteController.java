package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Paciente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PacienteController {

    public List<Paciente> loadList(DBConnection db) {
        List<Paciente> pacienteList = new ArrayList<>();
        ResultSet rs = null;
        try {
            // Llama al procedimiento almacenado
            String procedureCall = "{ call GET_PACIENTE_CURSOR(?) }";
            rs = db.executeProcedure(procedureCall);

            // Procesa el ResultSet
            while (rs.next()) {
                Paciente p = new Paciente(
                        rs.getInt("ID_PACIENTE"),
                        rs.getString("NOMBRE_PACIENTE"),
                        rs.getString("PRIAPELLIDO_PACIENTE"),
                        rs.getString("SEGAPELLIDO_PACIENTE"),
                        rs.getString("NUMERO_PACIENTE"),
                        rs.getString("DIRECCION_PACIENTE"),
                        rs.getString("CORREO_PACIENTE")
                );
                pacienteList.add(p);
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
        return pacienteList;
    }

    public void addPaciente(DBConnection db, Paciente paciente) {
        String sql = "{ call AGREGAR_PACIENTE(?, ?, ?, ?, ?, ?, ?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            // Establecer los parámetros del procedimiento almacenado
            stmt.setInt(1, paciente.getIdPaciente());
            stmt.setString(2, paciente.getNombrePaciente());
            stmt.setString(3, paciente.getPrimerApellido());
            stmt.setString(4, paciente.getSegundoApellido());
            stmt.setString(5, paciente.getNumeroPaciente());
            stmt.setString(6, paciente.getDireccionPaciente());
            stmt.setString(7, paciente.getCorreoPaciente());

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();
            System.out.println("Paciente agregado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePaciente(DBConnection db, int idPaciente) {
        String sql = "{ call ELIMINAR_PACIENTE(?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            // Establecer el parámetro del procedimiento almacenado
            stmt.setInt(1, idPaciente);

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();
            System.out.println("Paciente eliminado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}