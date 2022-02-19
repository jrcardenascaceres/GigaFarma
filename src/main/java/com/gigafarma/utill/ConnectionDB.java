package com.gigafarma.utill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

    private static ConnectionDB instance = null;
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static Connection connection;
    private static final String URL = "jdbc:mysql://localhost/gigafarma";
    private static final String USER = "root";
    private static final String PASS = "";

    private ConnectionDB() {
        try {
            Class.forName(DRIVER).newInstance();
            connection = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Conectado a la BD con éxito.");
            System.out.println("ID :" + connection.toString());
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            System.out.println("Error al conectar :" + e.getMessage());
            e.printStackTrace();
        }
    }

    public synchronized static ConnectionDB newInstance() {
        if (instance == null) {
            instance = new ConnectionDB();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }

    public void close() {
        instance = null;
    }
}
