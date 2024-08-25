package org.example.controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import oracle.jdbc.OracleTypes;
import org.example.model.DBConnection;

public class CitasController {

    public String displayCitas(DBConnection dbConnection) {
        StringBuilder citasReport = new StringBuilder();

        try (Connection conn = dbConnection.getConnection();
             CallableStatement callStmt = conn.prepareCall("{ call DBMS_OUTPUT.ENABLE(10000) }");
             CallableStatement procedureStmt = conn.prepareCall("{ call DISPLAY_CITAS }");
             CallableStatement dbmsOutputStmt = conn.prepareCall("{ call DBMS_OUTPUT.GET_LINE(?, ?) }")) {

            // Habilitar DBMS_OUTPUT
            callStmt.execute();

            // Ejecutar el procedimiento almacenado DISPLAY_CITAS
            procedureStmt.execute();

            // Variables para capturar la salida de DBMS_OUTPUT
            String line;
            int status;
            Date fechaActual = new Date();

            // Agregar encabezado al reporte
            citasReport.append("Agenda de Citas de "+ new SimpleDateFormat("dd-MM-yyyy").format(fechaActual) + "\n");
            citasReport.append("------------------------------------------------------\n");
            citasReport.append(String.format("%-15s %-15s %-15s %-15s\n", "ID Paciente", "ID Doctor", "Fecha Cita", "Hora Cita"));
            citasReport.append("------------------------------------------------------\n");

            // Recuperar la salida de DBMS_OUTPUT
            do {
                dbmsOutputStmt.registerOutParameter(1, OracleTypes.VARCHAR);
                dbmsOutputStmt.registerOutParameter(2, OracleTypes.INTEGER);
                dbmsOutputStmt.execute();
                line = dbmsOutputStmt.getString(1);
                status = dbmsOutputStmt.getInt(2);

                if (line != null) {
                    // Extraer datos individuales de la línea
                    String[] fields = line.split(", ");
                    if (fields.length == 4) {
                        citasReport.append(String.format("%-15s %-15s %-15s %-15s\n",
                                fields[0].replace("Patient ID: ", ""),
                                fields[1].replace("Doctor ID: ", ""),
                                fields[2].replace("Appointment Date: ", ""),
                                fields[3].replace("Appointment Time: ", "")
                        ));
                    }
                }
            } while (status == 0);

            citasReport.append("------------------------------------------------------\n");

        } catch (SQLException e) {
            e.printStackTrace();
            return "Error al generar el reporte de citas.";
        }

        return citasReport.toString();
    }
}

