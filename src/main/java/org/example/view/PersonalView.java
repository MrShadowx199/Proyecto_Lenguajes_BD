package org.example.view;

import org.example.controller.PersonalController;
import org.example.model.DBConnection;
import org.example.model.Personal;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class PersonalView extends JFrame {

    private JTable table;
    private DefaultTableModel tableModel;
    private JButton closeButton, addButton, deleteButton;
    private JTextField idField, nameField, firstLastNameField, secondLastNameField, numberField, addressField, emailField, departmentIdField, deleteIdField;
    private PersonalController personalController;
    private DBConnection dbConnection;

    public PersonalView(DBConnection dbConnection) {
        // Inicializar el controlador
        this.dbConnection = dbConnection;
        personalController = new PersonalController();

        // Configuración del JFrame
        setTitle("Lista de Personal");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear el modelo de la tabla
        tableModel = new DefaultTableModel();
        tableModel.setColumnIdentifiers(new Object[]{
                "ID Personal", "Nombre", "Primer Apellido", "Segundo Apellido", "Número", "Dirección", "Correo", "ID Departamento"
        });

        // Crear la tabla
        table = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(table);

        // Crear campos de texto para agregar personal
        idField = new JTextField(10);
        nameField = new JTextField(10);
        firstLastNameField = new JTextField(10);
        secondLastNameField = new JTextField(10);
        numberField = new JTextField(10);
        addressField = new JTextField(10);
        emailField = new JTextField(10);
        departmentIdField = new JTextField(10);

        // Crear el botón de agregar
        addButton = new JButton("Agregar");
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                addPersonal();
            }
        });

        // Crear campo de texto y botón para eliminar personal
        deleteIdField = new JTextField(10);
        deleteButton = new JButton("Eliminar");
        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                deletePersonal();
            }
        });

        // Crear un panel para los campos de texto en 2 filas y 4 columnas
        JPanel inputPanel = new JPanel(new GridLayout(2, 4, 5, 5)); // 2 filas, 4 columnas, espaciado horizontal y vertical de 5px
        inputPanel.add(new JLabel("ID Personal"));
        inputPanel.add(new JLabel("Nombre"));
        inputPanel.add(new JLabel("Primer Apellido"));
        inputPanel.add(new JLabel("Segundo Apellido"));
        inputPanel.add(idField);
        inputPanel.add(nameField);
        inputPanel.add(firstLastNameField);
        inputPanel.add(secondLastNameField);

        JPanel inputPanel2 = new JPanel(new GridLayout(2, 4, 5, 5)); // 2 filas, 4 columnas, espaciado horizontal y vertical de 5px
        inputPanel2.add(new JLabel("Número"));
        inputPanel2.add(new JLabel("Dirección"));
        inputPanel2.add(new JLabel("Correo"));
        inputPanel2.add(new JLabel("ID Departamento"));
        inputPanel2.add(numberField);
        inputPanel2.add(addressField);
        inputPanel2.add(emailField);
        inputPanel2.add(departmentIdField);

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
        closeButton.addActionListener(e -> dispose()); // Cierra solo el JFrame actual

        // Panel para los botones
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(addButton);
        buttonPanel.add(closeButton);

        // Agregar componentes al JFrame
        add(mainInputPanel, BorderLayout.NORTH); // Panel de entrada en la parte superior
        add(scrollPane, BorderLayout.CENTER); // Tabla en el centro
        add(deletePanel, BorderLayout.WEST); // Panel de eliminación a la izquierda
        add(buttonPanel, BorderLayout.SOUTH); // Botones en la parte inferior

        // Cargar la lista inicial de personal
        loadPersonalList();
    }

    // Metodo para cargar la lista de Personal en la tabla
    public void displayPersonalList(List<Personal> personalList) {
        // Limpiar la tabla antes de agregar nuevos datos
        tableModel.setRowCount(0);

        // Agregar datos de Personal a la tabla
        for (Personal p : personalList) {
            tableModel.addRow(new Object[]{
                    p.getIdPersonal(),
                    p.getNombrePersonal(),
                    p.getPrimerApellido(),
                    p.getSegundoApellido(),
                    p.getNumeroPersonal(),
                    p.getDireccionPersonal(),
                    p.getCorreoPersonal(),
                    p.getIdDepartamento()
            });
        }
    }

    // Metodo para agregar un nuevo personal
    private void addPersonal() {
        int idPersonal = Integer.parseInt(idField.getText());
        String nombre = nameField.getText();
        String primerApellido = firstLastNameField.getText();
        String segundoApellido = secondLastNameField.getText();
        String numero = numberField.getText();
        String direccion = addressField.getText();
        String correo = emailField.getText();
        int idDepartamento = Integer.parseInt(departmentIdField.getText());

        Personal personal = new Personal(idPersonal, nombre, primerApellido, segundoApellido, numero, direccion, correo, idDepartamento);
        personalController.addPersonal(dbConnection, personal);
        loadPersonalList(); // Actualizar la lista después de agregar
    }

    // Metodo para eliminar un personal
    private void deletePersonal() {
        int idPersonal = Integer.parseInt(deleteIdField.getText());
        personalController.deletePersonal(dbConnection, idPersonal);
        loadPersonalList(); // Actualizar la lista después de eliminar
    }

    // Metodo para cargar la lista de personal desde el controlador
    private void loadPersonalList() {
        List<Personal> personalList = personalController.loadList(dbConnection);
        displayPersonalList(personalList);
    }
}
