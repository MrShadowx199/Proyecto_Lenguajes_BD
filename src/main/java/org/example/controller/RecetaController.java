package org.example.controller;

import org.example.model.DBConnection;
import org.example.model.Receta;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecetaController {

    public List<Receta> loadList(DBConnection db) {
        List<Receta> recetaList = new ArrayList<>();
        ResultSet rs = null;
        try {
            String procedureCall = "{ call GET_RECETA_CURSOR(?) }";
            rs = db.executeProcedure(procedureCall);

            while (rs.next()) {
                Receta receta = new Receta(
                        rs.getInt("ID_RECETA"),
                        rs.getInt("ID_PACIENTE"),
                        rs.getString("NOMBRE_MEDICINA"),
                        rs.getDate("FECHA_RECETA")
                );
                recetaList.add(receta);
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
        return recetaList;
    }
}

