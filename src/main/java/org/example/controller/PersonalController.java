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

    public void addPersonal(DBConnection db, Personal personal) {
        String sql = "{ call AGREGAR_PERSONAL(?, ?, ?, ?, ?, ?, ?, ?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            // Establecer los parámetros del procedimiento almacenado
            stmt.setInt(1, personal.getIdPersonal());
            stmt.setString(2, personal.getNombrePersonal());
            stmt.setString(3, personal.getPrimerApellido());
            stmt.setString(4, personal.getSegundoApellido());
            stmt.setString(5, personal.getNumeroPersonal());
            stmt.setString(6, personal.getDireccionPersonal());
            stmt.setString(7, personal.getCorreoPersonal());
            stmt.setInt(8, personal.getIdDepartamento());

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();
            System.out.println("Personal agregado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePersonal(DBConnection db, int idPersonal) {
        String sql = "{ call ELIMINAR_PERSONAL(?) }";

        try (Connection conn = db.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            // Establecer el parámetro del procedimiento almacenado
            stmt.setInt(1, idPersonal);

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();
            System.out.println("Personal eliminado con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
