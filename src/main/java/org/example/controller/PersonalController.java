package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Personal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonalController {

    public List<Personal> loadList(DBConnection db) {
        List<Personal> personalList = new ArrayList<>();
        ResultSet rs = null;
        try {
            // Llama al procedimiento almacenado
            String procedureCall = "{ call GET_PERSONAL_CURSOR(?) }";
            rs = db.executeProcedure(procedureCall);

            // Procesa el ResultSet
            while (rs.next()) {
                Personal p = new Personal(
                        rs.getInt("ID_PERSONAL"),
                        rs.getString("NOMBRE_PERSONAL"),
                        rs.getString("PRIMAPELLIDO_PERSONAL"),
                        rs.getString("SEGAPELLIDO_PERSONAL"),
                        rs.getString("NUMERO_PERSONAL"),
                        rs.getString("DIRECCION_PERSONAL"),
                        rs.getString("CORREO_PERSONAL"),
                        rs.getInt("ID_DEPARTAMENTO")
                );
                personalList.add(p);
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
        return personalList;
    }

    public void insertarPaciente(DBConnection db, int idPaciente, String nombrePaciente, String priApellido, String segApellido, int numeroPaciente, String direccion, String correo) {
        String sql = "{ call INSERTAR_PACIENTE(?, ?, ?, ?, ?, ?, ?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            // Establecer los parámetros de entrada
            stmt.setInt(1, idPaciente);
            stmt.setString(2, nombrePaciente);
            stmt.setString(3, priApellido);
            stmt.setString(4, segApellido);
            stmt.setInt(5, numeroPaciente);
            stmt.setString(6, direccion);
            stmt.setString(7, correo);

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();

            System.out.println("Paciente insertado con éxito.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
