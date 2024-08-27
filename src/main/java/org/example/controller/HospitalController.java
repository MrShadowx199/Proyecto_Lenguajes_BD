package org.example.controller;

import oracle.jdbc.OracleTypes;
import org.example.model.DBConnection;
import org.example.model.Hospital;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HospitalController {
    private DBConnection dbConnection;
    private List<Hospital> hospitalList;

    public HospitalController(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
        this.hospitalList = new ArrayList<>();
    }

    public List<Hospital> loadList(DBConnection db) {
        List<Hospital> hospitalList = new ArrayList<>();
        Connection connection = null;
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = db.getConnection();
            String sql = "{CALL GET_HOSPITAL_CURSOR(?)}";
            stmt = connection.prepareCall(sql);
            stmt.registerOutParameter(1, OracleTypes.CURSOR);

            stmt.execute();

            rs = (ResultSet) stmt.getObject(1);

            while (rs.next()) {
                long idHospital = rs.getLong("ID_Hospital");
                String nombreHospital = rs.getString("Nombre_Hospital");
                String direccionHospital = rs.getString("Direccion_Hospital");
                String telefonoHospital = rs.getString("Telefono_Hospital");

                Hospital hospital = new Hospital(idHospital, nombreHospital, direccionHospital, telefonoHospital);
                hospitalList.add(hospital);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return hospitalList;
    }

    public void addHospital(DBConnection db, Hospital hospital) {
        Connection connection = null;
        CallableStatement stmt = null;

        try {
            connection = db.getConnection();
            String sql = "{CALL AGREGAR_HOSPITAL(?, ?, ?, ?)}";
            stmt = connection.prepareCall(sql);
            stmt.setLong(1, hospital.getIdHospital());
            stmt.setString(2, hospital.getNombreHospital());
            stmt.setString(3, hospital.getDireccionHospital());
            stmt.setString(4, hospital.getTelefonoHospital());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteHospital(DBConnection db, long idHospital) {
        Connection connection = null;
        CallableStatement stmt = null;

        try {
            connection = db.getConnection();
            String sql = "{CALL ELIMINAR_HOSPITAL(?)}";
            stmt = connection.prepareCall(sql);
            stmt.setLong(1, idHospital);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void closeConnection() {
        dbConnection.close();
    }
}
