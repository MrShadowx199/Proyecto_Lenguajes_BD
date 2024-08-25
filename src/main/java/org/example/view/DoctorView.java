package org.example.view;

import org.example.controller.DoctorController;
import org.example.model.DBConnection;
import org.example.model.Doctor;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class DoctorView extends JFrame {

    private JTable table;
    private DefaultTableModel tableModel;
    private JButton closeButton, addButton, deleteButton;
    private JTextField idField, specializationField, nameField, departmentField, deleteIdField;
    private DoctorController doctorController;
    private DBConnection dbConnection;

    public DoctorView(DBConnection dbConnection) {
        // Inicializar el controlador
        this.dbConnection = dbConnection;
        doctorController = new DoctorController();

        // Configuración del JFrame
        setTitle("Lista de Doctores");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear el modelo de la tabla
        tableModel = new DefaultTableModel();
        tableModel.setColumnIdentifiers(new Object[]{
                "ID Doctor", "Especialización", "Nombre", "ID Departamento"
        });

        // Crear la tabla
        table = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(table);

        // Crear campos de texto para agregar doctores
        idField = new JTextField(10);
        specializationField = new JTextField(10);
        nameField = new JTextField(10);
        departmentField = new JTextField(10);

        // Crear el botón de agregar
        addButton = new JButton("Agregar");
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                addDoctor();
            }
        });

        // Crear campo de texto y botón para eliminar doctor
        deleteIdField = new JTextField(10);
        deleteButton = new JButton("Eliminar");
        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                deleteDoctor();
            }
        });

        // Crear un panel para los campos de texto en 2 filas y 4 columnas
        JPanel inputPanel = new JPanel(new GridLayout(2, 4, 5, 5));
        inputPanel.add(new JLabel("ID Doctor"));
        inputPanel.add(new JLabel("Especialización"));
        inputPanel.add(new JLabel("Nombre"));
        inputPanel.add(new JLabel("ID Departamento"));
        inputPanel.add(idField);
        inputPanel.add(specializationField);
        inputPanel.add(nameField);
        inputPanel.add(departmentField);

        // Crear un panel para el campo de eliminación y el botón
        JPanel deletePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        deletePanel.add(new JLabel("ID a Eliminar:"));
        deletePanel.add(deleteIdField);
        deletePanel.add(deleteButton);

        // Crear el botón de cierre
        closeButton = new JButton("Cerrar");
        closeButton.addActionListener(e -> dispose());

        // Panel para los botones
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(addButton);
        buttonPanel.add(closeButton);

        // Agregar componentes al JFrame
        getContentPane().add(scrollPane, BorderLayout.CENTER);
        getContentPane().add(inputPanel, BorderLayout.NORTH);
        getContentPane().add(buttonPanel, BorderLayout.SOUTH);
        getContentPane().add(deletePanel, BorderLayout.WEST);
    }

    public void loadDoctores() {
        // Obtener la lista de doctores a través del controlador
        List<Doctor> doctorList = doctorController.loadList(dbConnection);

        // Limpiar el modelo de la tabla antes de cargar nuevos datos
        tableModel.setRowCount(0);

        // Cargar los datos en la tabla
        for (Doctor doctor : doctorList) {
            tableModel.addRow(new Object[]{
                    doctor.getIdDoctor(),
                    doctor.getEspecializacion(),
                    doctor.getNombreDoctor(),
                    doctor.getIdDepartamento()
            });
        }
    }

    private void addDoctor() {
        // Obtener los valores de los campos de texto
        int id = Integer.parseInt(idField.getText());
        String especializacion = specializationField.getText();
        String nombre = nameField.getText();
        int departamentoId = Integer.parseInt(departmentField.getText());

        // Crear un nuevo objeto Doctor
        Doctor doctor = new Doctor(id, especializacion, nombre, departamentoId);

        // Agregar el doctor a través del controlador
        doctorController.addDoctor(dbConnection, doctor);

        // Recargar la tabla de doctores
        loadDoctores();
    }

    private void deleteDoctor() {
        // Obtener el ID del doctor a eliminar
        int id = Integer.parseInt(deleteIdField.getText());

        // Eliminar el doctor a través del controlador
        doctorController.deleteDoctor(dbConnection, id);

        // Recargar la tabla de doctores
        loadDoctores();
    }
}
