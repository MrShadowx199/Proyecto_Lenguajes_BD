package org.example.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBConnection {

    private Connection con;

    public DBConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "SYSTEM", "Oracle2024");
            if (con != null) {
                System.out.println("Connection successful");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<String> getTables(String tableNamePattern) {
        List<String> tableNames = new ArrayList<>();
        try {
            DatabaseMetaData metaData = con.getMetaData();
            ResultSet tables = metaData.getTables(null, null, tableNamePattern, new String[]{"TABLE"});
            while (tables.next()) {
                tableNames.add(tables.getString("TABLE_NAME"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tableNames;
    }

    public void close() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
                System.out.println("Connection closed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}



