package org.example.view;

import org.example.controller.DepartamentoController;
import org.example.model.DBConnection;
import org.example.model.Departamento;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class DepartamentoView extends JFrame {

    private JTable table;
    private DefaultTableModel tableModel;
    private JButton closeButton;
    private DepartamentoController departamentoController;
    private DBConnection dbConnection;

    public DepartamentoView(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
        departamentoController = new DepartamentoController();

        // Configuración del JFrame
        setTitle("Lista de Departamentos");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear el modelo de la tabla
        tableModel = new DefaultTableModel();
        tableModel.setColumnIdentifiers(new Object[]{
                "ID Departamento", "Nombre Departamento"
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

        // Cargar la lista inicial de departamentos
        loadDepartamentoList();
    }

    // Método para cargar la lista de departamentos en la tabla
    void displayDepartamentoList(List<Departamento> departamentoList) {
        // Limpiar la tabla antes de agregar nuevos datos
        tableModel.setRowCount(0);

        // Agregar datos de Departamento a la tabla
        for (Departamento dept : departamentoList) {
            tableModel.addRow(new Object[]{
                    dept.getIdDepartamento(),
                    dept.getNombreDepartamento()
            });
        }
    }

    // Método para cargar la lista de departamentos desde el controlador
    private void loadDepartamentoList() {
        List<Departamento> departamentoList = departamentoController.loadList(dbConnection);
        displayDepartamentoList(departamentoList);
    }
}
