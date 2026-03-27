package com.mycompany.javabluepass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase encargada de gestionar la conexión con la base de datos MySQL.
 * Proporciona los métodos necesarios para establecer el enlace entre la 
 * aplicación Java y el servidor de base de datos bd_bluepass.
 * * @author Valentina Ramos
 * @version 1.0
 */
public class Conexionjava {
    
    // Configuración para la base de datos y puerto corregido
    /** URL de conexión que especifica el protocolo JDBC, el servidor localhost y la base de datos bd_bluepass */
    private static final String url = "jdbc:mysql://localhost:3306/bd_bluepass";
    
    /** Usuario por defecto para la conexión a la base de datos */
    private static final String user = "root";
    
    /** Contraseña del usuario de la base de datos (vacía por defecto) */
    private static final String pass = "";

    /**
     * Establece una conexión con la base de datos utilizando el driver de MySQL.
     * Realiza la carga del driver y gestiona las posibles excepciones de conexión.
     * * @return Connection El objeto de conexión establecido o null si ocurre un error.
     */
    public Connection conectar() {
        Connection cone = null;
        try {
            // Carga del controlador JDBC de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Intento de establecimiento de conexión con las credenciales definidas
            cone = DriverManager.getConnection(url, user, pass);
            
            System.out.println("¡Conectado exitosamente a bd_bluepass!");
        } catch (ClassNotFoundException | SQLException e) {
            // Captura y visualización de errores de carga de driver o parámetros de conexión
            System.out.println("Error al conectar: " + e.getMessage());
        }
        return cone;
    }
}