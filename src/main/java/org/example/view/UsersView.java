package org.example.view;

import javax.swing.*;
import java.awt.*;
import java.util.List;
import org.example.controller.UsersController;

public class UsersView {

    private UsersController usersController;
    private JFrame frame;
    private JTextArea textArea;

    public UsersView() {
        usersController = new UsersController();
    }

    public void display() {
        frame = new JFrame("Tables List");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.setLayout(new BorderLayout());

        textArea = new JTextArea();
        textArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(textArea);
        frame.add(scrollPane, BorderLayout.CENTER);

        JButton refreshButton = new JButton("Refresh Tables");
        refreshButton.addActionListener(e -> refreshTables());
        frame.add(refreshButton, BorderLayout.SOUTH);

        frame.setVisible(true);
        refreshTables(); // Load tables on display
    }

    private void refreshTables() {
        List<String> tables = usersController.fetchTables("%");
        textArea.setText(""); // Clear previous content
        for (String table : tables) {
            textArea.append("Table: " + table + "\n");
        }
    }

    public void close() {
        usersController.closeConnection();
        if (frame != null) {
            frame.dispose();
        }
    }
}
