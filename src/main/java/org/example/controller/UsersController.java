package org.example.controller;

import org.example.model.DBConnection;
import java.util.List;

public class UsersController {

    private DBConnection dbConnection;

    public UsersController() {
        dbConnection = new DBConnection();
    }

    public List<String> fetchTables(String tableNamePattern) {
        return dbConnection.getTables(tableNamePattern);
    }

    public void closeConnection() {
        dbConnection.close();
    }
}
