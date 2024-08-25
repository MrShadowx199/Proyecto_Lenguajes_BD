package org.example.view;

import org.example.controller.CitasController;
import org.example.model.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class CitasView extends JFrame {

    private JTextArea textArea;
    private JButton printButton, closeButton;
    private CitasController citasController;

    public CitasView(DBConnection dbConnection) {
        citasController = new CitasController();

        // Configuración del JFrame
        setTitle("Reporte de Citas");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear un área de texto con scroll
        textArea = new JTextArea();
        textArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(textArea);

        // Crear el botón para imprimir en archivo
        printButton = new JButton("Imprimir");
        printButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                saveCitasToFile();
            }
        });

        // Crear el botón para cerrar la vista
        closeButton = new JButton("Cerrar");
        closeButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Cerrar la ventana actual
                dispose();
                // Aquí deberías agregar la lógica para volver al menú principal
                // Por ejemplo: new MainMenuView().setVisible(true);
            }
        });

        // Crear un panel para los botones
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(printButton);
        buttonPanel.add(closeButton);

        // Agregar componentes al JFrame
        add(scrollPane, BorderLayout.CENTER); // Área de texto en el centro
        add(buttonPanel, BorderLayout.SOUTH); // Botones en la parte inferior

        // Cargar las citas en el área de texto
        loadCitas(dbConnection);
    }

    private void loadCitas(DBConnection dbConnection) {
        // Obtener el reporte de citas del controlador
        String citasReport = citasController.displayCitas(dbConnection);
        // Mostrar el reporte en el área de texto
        textArea.setText(citasReport);
    }

    private void saveCitasToFile() {
        // Obtener el texto del área de texto
        String citasText = textArea.getText();
        // Guardar el texto en un archivo
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("citas_report.txt"))) {
            writer.write(citasText);
            JOptionPane.showMessageDialog(this, "Reporte guardado exitosamente.");
        } catch (IOException e) {
            JOptionPane.showMessageDialog(this, "Error al guardar el archivo.");
            e.printStackTrace();
        }
    }
}
