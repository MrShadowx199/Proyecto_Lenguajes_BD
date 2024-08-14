package org.example.view;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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

        JButton userManagementButton = new JButton("Gestión de Usuarios");
        userManagementButton.setBounds(100, 60, 200, 25);
        panel.add(userManagementButton);
        userManagementButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implementation of the functionality for user management here
                SwingUtilities.invokeLater(() -> new UsersView().display());
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

        JButton searchAndFilterButton = new JButton("Búsqueda y Filtrado");
        searchAndFilterButton.setBounds(100, 180, 200, 25);
        panel.add(searchAndFilterButton);
        searchAndFilterButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implement the functionality for search and filter here

            }
        });

        JButton appointmentHistoryButton = new JButton("Historial de Citas");
        appointmentHistoryButton.setBounds(100, 210, 200, 25);
        panel.add(appointmentHistoryButton);
        appointmentHistoryButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implement the functionality for appointment history here

            }
        });

        JButton reportsAndStatisticsButton = new JButton("Reporte y Estadísticas");
        reportsAndStatisticsButton.setBounds(100, 240, 200, 25);
        panel.add(reportsAndStatisticsButton);
        reportsAndStatisticsButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Implement the functionality for reports and statistics here

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