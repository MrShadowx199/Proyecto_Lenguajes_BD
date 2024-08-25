package org.example.view;
import org.example.controller.PersonalController;
import org.example.controller.RecetaController;
import org.example.controller.DepartamentoController;

import org.example.model.DBConnection;
import org.example.model.Personal;
import org.example.model.Departamento;
import org.example.model.Receta;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class MainMenu {

    public void display() {
        JFrame frame = new JFrame("Hospital Management System");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 400);

        JPanel panel = new JPanel();
        frame.add(panel);
        placeComponents(panel);

        frame.setVisible(true);
    }

    private void placeComponents(JPanel panel) {
        panel.setLayout(null);

        JLabel label = new JLabel("Menú Principal");
        label.setBounds(150, 20, 120, 25);
        panel.add(label);

        JButton userManagementButton = new JButton("Gestión de Personal");
        userManagementButton.setBounds(100, 60, 200, 25);
        panel.add(userManagementButton);
        userManagementButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Crear una instancia de DBConnection
                DBConnection dbConnection = new DBConnection();

                // Crear una instancia del controlador
                PersonalController controller = new PersonalController();

                // Cargar la lista de Personal desde la base de datos
                List<Personal> personalList = controller.loadList(dbConnection);

                // Crear una instancia de la vista y mostrar los datos
                PersonalView view = new PersonalView(dbConnection);
                view.displayPersonalList(personalList);

                // Hacer visible el JFrame
                view.setVisible(true);

                // Cerrar la conexión después de cargar los datos
                dbConnection.close();
            }
        });

        JButton patientManagementButton = new JButton("Gestión de Pacientes");
        patientManagementButton.setBounds(100, 90, 200, 25);
        panel.add(patientManagementButton);
        patientManagementButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implement the functionality for patient management here

            }
        });

        JButton doctorManagementButton = new JButton("Gestión de Doctores");
        doctorManagementButton.setBounds(100, 120, 200, 25);
        panel.add(doctorManagementButton);
        doctorManagementButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implement the functionality for doctor management here

            }
        });

        JButton appointmentScheduleButton = new JButton("Agenda de Citas");
        appointmentScheduleButton.setBounds(100, 150, 200, 25);
        panel.add(appointmentScheduleButton);
        appointmentScheduleButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implement the functionality for appointment scheduling here

            }
        });

        JButton searchAndFilterButton = new JButton("Gestión de Hospitales");
        searchAndFilterButton.setBounds(100, 180, 200, 25);
        panel.add(searchAndFilterButton);
        searchAndFilterButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implement the functionality for search and filter here

            }
        });

        JButton appointmentHistoryButton = new JButton("Historial de Recetas");
        appointmentHistoryButton.setBounds(100, 210, 200, 25);
        panel.add(appointmentHistoryButton);
        appointmentHistoryButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                 DBConnection dbConnection = new DBConnection();

        // Crear una instancia del controlador de recetas
        RecetaController controller = new RecetaController();

        // Cargar la lista de Recetas desde la base de datos
        List<Receta> recetaList = controller.loadList(dbConnection);

        // Crear una instancia de la vista y mostrar los datos
        RecetaView view = new RecetaView(dbConnection);
        view.displayRecetaList(recetaList);

        // Hacer visible el JFrame
        view.setVisible(true);

        // Cerrar la conexión después de cargar los datos
        dbConnection.close();

            }
        });

        JButton reportsAndStatisticsButton = new JButton("Gestion de departamentos");
        reportsAndStatisticsButton.setBounds(100, 240, 200, 25);
        panel.add(reportsAndStatisticsButton);
        reportsAndStatisticsButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                 // Crear una instancia de DBConnection
                DBConnection dbConnection = new DBConnection();

                // Crear una instancia del controlador
                DepartamentoController controller = new DepartamentoController();

                // Cargar la lista de Departamentos desde la base de datos
                List<Departamento> departamentoList = controller.loadList(dbConnection);

                // Crear una instancia de la vista y mostrar los datos
                DepartamentoView view = new DepartamentoView(dbConnection);
                view.displayDepartamentoList(departamentoList);

                // Hacer visible el JFrame
                view.setVisible(true);

                // Cerrar la conexión después de cargar los datos
                dbConnection.close();

            }
        });

        JButton exitButton = new JButton("Salir");
        exitButton.setBounds(100, 270, 200, 25);
        panel.add(exitButton);
        exitButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Exit the system
                System.exit(0);
            }
        });
    }

}
