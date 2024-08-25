package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Departamento;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartamentoController {

    public List<Departamento> loadList(DBConnection db) {
        List<Departamento> departamentoList = new ArrayList<>();
        ResultSet rs = null;
        try {
            String procedureCall = "{ call GET_DEPARTAMENTO_CURSOR(?) }";
            rs = db.executeProcedure(procedureCall);

            while (rs.next()) {
                Departamento dept = new Departamento(
                        rs.getInt("ID_DEPARTAMENTO"),
                        rs.getString("NOMBRE_DEPARTAMENTO")
                );
                departamentoList.add(dept);
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
        return departamentoList;
    }
}
