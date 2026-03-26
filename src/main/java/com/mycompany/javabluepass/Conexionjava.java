package com.mycompany.javabluepass;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexionjava {
    // Configuración para tu base de datos y puerto corregido
    private static final String url = "jdbc:mysql://localhost:3306/bd_bluepass";
    private static final String user = "root";
    private static final String pass = "";

    public Connection conectar() {
        Connection cone = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cone = DriverManager.getConnection(url, user, pass);
            System.out.println("¡Conectado exitosamente a bd_bluepass!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar: " + e.getMessage());
        }
        return cone;
    }
}