package org.example.view;

import org.example.controller.RecetaController;
import org.example.model.DBConnection;
import org.example.model.Receta;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class RecetaView extends JFrame {

    private JTable table;
    private DefaultTableModel tableModel;
    private JButton closeButton;
    private RecetaController recetaController;
    private DBConnection dbConnection;

    public RecetaView(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
        recetaController = new RecetaController();

        // Configuración del JFrame
        setTitle("Lista de Recetas");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear el modelo de la tabla
        tableModel = new DefaultTableModel();
        tableModel.setColumnIdentifiers(new Object[]{
                "ID Receta", "ID Paciente", "Nombre Medicina", "Fecha Receta"
        });

        // Crear la tabla
        table = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(table);

        // Crear el botón de cierre
        closeButton = new JButton("Cerrar");
        closeButton.addActionListener(e -> dispose()); // Cierra solo el JFrame actual

        // Panel para los botones
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(closeButton);

        // Agregar componentes al JFrame
        add(scrollPane, BorderLayout.CENTER); // Tabla en el centro
        add(buttonPanel, BorderLayout.SOUTH); // Botón en la parte inferior

        // Cargar la lista inicial de recetas
        loadRecetaList();
    }

    // Método para cargar la lista de recetas en la tabla
    void displayRecetaList(List<Receta> recetaList) {
        // Limpiar la tabla antes de agregar nuevos datos
        tableModel.setRowCount(0);

        // Agregar datos de Receta a la tabla
        for (Receta receta : recetaList) {
            tableModel.addRow(new Object[]{
                    receta.getIdReceta(),
                    receta.getIdPaciente(),
                    receta.getNombreMedicina(),
                    receta.getFechaReceta()
            });
        }
    }

    // Método para cargar la lista de recetas desde el controlador
    private void loadRecetaList() {
        List<Receta> recetaList = recetaController.loadList(dbConnection);
        displayRecetaList(recetaList);
    }

}
