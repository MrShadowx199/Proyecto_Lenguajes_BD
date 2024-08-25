package org.example.model;

import java.sql.*;

public class DBConnection {

    // Variables de conexión
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl"; // Ajusta URL según tu configuración
    private static final String USER = "hr"; // Usuario de la base de datos
    private static final String PASSWORD = "hr"; // Contraseña del usuario de la base de datos

    // Metodo para obtener una conexión a la base de datos
    public Connection getConnection() throws SQLException {
        System.out.println("Connecting to database...");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Metodo para realizar una consulta
    public void executeQuery(String query) {
        System.out.println("Executing query: " + query);
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                // Aquí puedes procesar los resultados
                System.out.println("ID: " + resultSet.getInt("ID_PERSONAL"));
                System.out.println("Nombre: " + resultSet.getString("NOMBRE_PERSONAL"));
                // Agrega más columnas según sea necesario
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para realizar una actualización
    public void executeUpdate(String query) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            int rowsAffected = statement.executeUpdate();
            System.out.println("Filas afectadas: " + rowsAffected);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet executeProcedure(String procedureCall) {
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        try {Connection connection = getConnection();
            callableStatement = getConnection().prepareCall(procedureCall);
            callableStatement.registerOutParameter(1, java.sql.Types.REF_CURSOR);
            callableStatement.execute();
            resultSet = (ResultSet) callableStatement.getObject(1);
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción adecuadamente
        }
        return resultSet;
    }

    public void close() {
        try {Connection connection = getConnection();
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Conexión cerrada.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}