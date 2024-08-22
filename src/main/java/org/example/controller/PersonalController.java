package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Personal;

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
                // logPersonal(p);
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

    private void logPersonal(Personal p) {
        System.out.println("Personal agregado: ");
        System.out.println("ID Personal: " + p.getIdPersonal());
        System.out.println("Nombre: " + p.getNombrePersonal());
        System.out.println("Primer Apellido: " + p.getPrimerApellido());
        System.out.println("Segundo Apellido: " + p.getSegundoApellido());
        System.out.println("Número: " + p.getNumeroPersonal());
        System.out.println("Dirección: " + p.getDireccionPersonal());
        System.out.println("Correo: " + p.getCorreoPersonal());
        System.out.println("ID Departamento: " + p.getIdDepartamento());
        System.out.println("--------------------");
    }
}
