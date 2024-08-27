/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.view;
import org.example.controller.HospitalController;
import org.example.model.DBConnection;
import org.example.model.Hospital;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class HospitalView extends JFrame{
    private JTable table;
    private DefaultTableModel tableModel;
    private JButton closeButton, addButton, deleteButton;
    private JTextField idField, nameField, addressField, phoneField, deleteIdField;
    private HospitalController hospitalController;
    private DBConnection dbConnection;

    public HospitalView(DBConnection dbConnection) {
        // Inicializar el controlador
        this.dbConnection = dbConnection;
        hospitalController = new HospitalController(dbConnection);

        // Configuración del JFrame
        setTitle("Lista de Hospitales");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear el modelo de la tabla
        tableModel = new DefaultTableModel();
        tableModel.setColumnIdentifiers(new Object[]{
                "ID Hospital", "Nombre", "Dirección", "Teléfono"
        });

        // Crear la tabla
        table = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(table);

        // Crear campos de texto para agregar hospital
        idField = new JTextField(10);
        nameField = new JTextField(10);
        addressField = new JTextField(10);
        phoneField = new JTextField(10);

        // Crear el botón de agregar
        addButton = new JButton("Agregar");
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                addHospital();
            }
        });

        // Crear campo de texto y botón para eliminar hospital
        deleteIdField = new JTextField(10);
        deleteButton = new JButton("Eliminar");
        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                deleteHospital();
            }
        });

        // Crear un panel para los campos de texto
        JPanel inputPanel = new JPanel(new GridLayout(2, 4, 5, 5)); // 2 filas, 4 columnas, espaciado horizontal y vertical de 5px
        inputPanel.add(new JLabel("ID Hospital"));
        inputPanel.add(new JLabel("Nombre"));
        inputPanel.add(new JLabel("Dirección"));
        inputPanel.add(new JLabel("Teléfono"));
        inputPanel.add(idField);
        inputPanel.add(nameField);
        inputPanel.add(addressField);
        inputPanel.add(phoneField);

        // Crear un panel para el campo de eliminación y el botón
        JPanel deletePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        deletePanel.add(new JLabel("ID a Eliminar:"));
        deletePanel.add(deleteIdField);
        deletePanel.add(deleteButton);

        // Crear el botón de cierre
        closeButton = new JButton("Cerrar");
        closeButton.addActionListener(e -> dispose()); // Cierra solo el JFrame actual

        // Panel para los botones
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(addButton);
        buttonPanel.add(closeButton);

        // Agregar componentes al JFrame
        add(inputPanel, BorderLayout.NORTH); // Panel de entrada en la parte superior
        add(scrollPane, BorderLayout.CENTER); // Tabla en el centro
        add(deletePanel, BorderLayout.WEST); // Panel de eliminación a la izquierda
        add(buttonPanel, BorderLayout.SOUTH); // Botones en la parte inferior

        // Cargar la lista inicial de hospitales
        loadHospitalList();
    }

    // Metodo para cargar la lista de Hospitales en la tabla
    public void displayHospitalList(List<Hospital> hospitalList) {
        // Limpiar la tabla antes de agregar nuevos datos
        tableModel.setRowCount(0);

        // Agregar datos de Hospital a la tabla
        for (Hospital h : hospitalList) {
            tableModel.addRow(new Object[]{
                    h.getIdHospital(),
                    h.getNombreHospital(),
                    h.getDireccionHospital(),
                    h.getTelefonoHospital()
            });
        }
    }

    // Metodo para agregar un nuevo hospital
    private void addHospital() {
        long idHospital = Integer.parseInt(idField.getText());
        String nombre = nameField.getText();
        String direccion = addressField.getText();
        String telefono = phoneField.getText();

        Hospital hospital = new Hospital(idHospital, nombre, direccion, telefono);
        hospitalController.addHospital(dbConnection, hospital);
        loadHospitalList(); // Actualizar la lista después de agregar
    }

    // Metodo para eliminar un hospital
    private void deleteHospital() {
        int idHospital = Integer.parseInt(deleteIdField.getText());
        hospitalController.deleteHospital(dbConnection, idHospital);
        loadHospitalList(); // Actualizar la lista después de eliminar
    }

    // Metodo para cargar la lista de hospitales desde el controlador
    private void loadHospitalList() {
        List<Hospital> hospitalList = hospitalController.loadList(dbConnection);
        displayHospitalList(hospitalList);
    }
}
