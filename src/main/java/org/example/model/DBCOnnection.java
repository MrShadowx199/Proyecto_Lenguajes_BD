package org.example.model;
import java.sql.*;

public class DBCOnnection {

    public static void main(String[] args) {

        try{

            Class.forName("oracle.jdbc.driver.OracleDriver");


            Connection con=null;
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","SYSTEM","Oracle2024");
            if (con!=null)
                System.out.println("Exitoso");



        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
    }

}


