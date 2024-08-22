package org.example.view;

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
    private JButton closeButton;

    public PersonalView() {
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

        // Crear el botón de cierre
        closeButton = new JButton("Cerrar");
        closeButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                dispose(); // Cierra solo el JFrame actual
            }
        });

        // Panel para el botón
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(closeButton);

        // Agregar componentes al JFrame
        add(scrollPane, BorderLayout.CENTER);
        add(buttonPanel, BorderLayout.SOUTH); // Agregar el botón en la parte inferior
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
}
