package org.example.view;

import org.example.controller.PacienteController;
import org.example.model.DBConnection;
import org.example.model.Paciente;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class PacienteView extends JFrame {

    private JTable table;
    private DefaultTableModel tableModel;
    private JButton closeButton, addButton, deleteButton;
    private JTextField idField, nameField, firstLastNameField, secondLastNameField, numberField, addressField, emailField, deleteIdField;
    private PacienteController pacienteController;
    private DBConnection dbConnection;

    public PacienteView(DBConnection dbConnection) {
        // Inicializar el controlador
        this.dbConnection = dbConnection;
        pacienteController = new PacienteController();

        // Configuración del JFrame
        setTitle("Lista de Pacientes");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear el modelo de la tabla
        tableModel = new DefaultTableModel();
        tableModel.setColumnIdentifiers(new Object[]{
                "ID Paciente", "Nombre", "Primer Apellido", "Segundo Apellido", "Número", "Dirección", "Correo"
        });

        // Crear la tabla
        table = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(table);

        // Crear campos de texto para agregar pacientes
        idField = new JTextField(10);
        nameField = new JTextField(10);
        firstLastNameField = new JTextField(10);
        secondLastNameField = new JTextField(10);
        numberField = new JTextField(10);
        addressField = new JTextField(10);
        emailField = new JTextField(10);

        // Crear el botón de agregar
        addButton = new JButton("Agregar");
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                addPaciente();
            }
        });

        // Crear campo de texto y botón para eliminar paciente
        deleteIdField = new JTextField(10);
        deleteButton = new JButton("Eliminar");
        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                deletePaciente();
            }
        });

        // Crear un panel para los campos de texto en 2 filas y 4 columnas
        JPanel inputPanel = new JPanel(new GridLayout(2, 4, 5, 5));
        inputPanel.add(new JLabel("ID Paciente"));
        inputPanel.add(new JLabel("Nombre"));
        inputPanel.add(new JLabel("Primer Apellido"));
        inputPanel.add(new JLabel("Segundo Apellido"));
        inputPanel.add(idField);
        inputPanel.add(nameField);
        inputPanel.add(firstLastNameField);
        inputPanel.add(secondLastNameField);

        JPanel inputPanel2 = new JPanel(new GridLayout(2, 4, 5, 5));
        inputPanel2.add(new JLabel("Número"));
        inputPanel2.add(new JLabel("Dirección"));
        inputPanel2.add(new JLabel("Correo"));
        inputPanel2.add(new JLabel(""));
        inputPanel2.add(numberField);
        inputPanel2.add(addressField);
        inputPanel2.add(emailField);

        // Panel principal para los campos de texto
        JPanel mainInputPanel = new JPanel(new BorderLayout());
        mainInputPanel.add(inputPanel, BorderLayout.NORTH);
        mainInputPanel.add(inputPanel2, BorderLayout.CENTER);

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
        getContentPane().add(mainInputPanel, BorderLayout.NORTH);
        getContentPane().add(buttonPanel, BorderLayout.SOUTH);
        getContentPane().add(deletePanel, BorderLayout.WEST);
    }

    public void loadPacientes() {
        // Obtener la lista de pacientes a través del controlador
        List<Paciente> pacienteList = pacienteController.loadList(dbConnection);

        // Limpiar el modelo de la tabla antes de cargar nuevos datos
        tableModel.setRowCount(0);

        // Cargar los datos en la tabla
        for (Paciente paciente : pacienteList) {
            tableModel.addRow(new Object[]{
                    paciente.getIdPaciente(),
                    paciente.getNombrePaciente(),
                    paciente.getPrimerApellido(),
                    paciente.getSegundoApellido(),
                    paciente.getNumeroPaciente(),
                    paciente.getDireccionPaciente(),
                    paciente.getCorreoPaciente()
            });
        }
    }

    private void addPaciente() {
        // Obtener los valores de los campos de texto
        int id = Integer.parseInt(idField.getText());
        String nombre = nameField.getText();
        String primerApellido = firstLastNameField.getText();
        String segundoApellido = secondLastNameField.getText();
        String numero = numberField.getText();
        String direccion = addressField.getText();
        String correo = emailField.getText();

        // Crear un nuevo objeto Paciente
        Paciente paciente = new Paciente(id, nombre, primerApellido, segundoApellido, numero, direccion, correo);

        // Agregar el paciente a través del controlador
        pacienteController.addPaciente(dbConnection, paciente);

        // Recargar la tabla de pacientes
        loadPacientes();
    }

    private void deletePaciente() {
        // Obtener el ID del paciente a eliminar
        int id = Integer.parseInt(deleteIdField.getText());

        // Eliminar el paciente a través del controlador
        pacienteController.deletePaciente(dbConnection, id);

        // Recargar la tabla de pacientes
        loadPacientes();
    }
}
