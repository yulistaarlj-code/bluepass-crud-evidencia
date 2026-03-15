package pruebabase;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Pruebabase {

    public static void main(String[] args) {
        // Configuración de la conexión
        String url = "jdbc:mysql://localhost:3306/bd_bluepass";
        String usuario = "root";
        String pssw = ""; 

        Connection conex;
        Statement state;
        ResultSet res;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conex = DriverManager.getConnection(url, usuario, pssw);
            state = conex.createStatement();

            // 1. INSERTAR DATOS
            // Nota: Usamos datos nuevos para evitar el error de duplicado
            try {
                String consultaInsert = "INSERT INTO empleado (id_empleado, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo_electronico, celular, edad, lugar_residencia) "
                        + "VALUES (4, 112233, 'Valentina', 'Maria', 'Ramos', 'Perez', 'valen_final@ejemplo.com', '3009998877', 20, 'Montería')";
                
                state.executeUpdate(consultaInsert);
                System.out.println("¡Dato guardado con éxito!");
            } catch (SQLException e) {
                if (e.getErrorCode() == 1062) { // Código de error para duplicados
                    System.out.println("Aviso: El empleado ya existe, mostrando lista actual...");
                } else {
                    System.out.println("Error al insertar: " + e.getMessage());
                }
            }

            // 2. CONSULTAR Y MOSTRAR DATOS (Reporte completo)
            res = state.executeQuery("SELECT * FROM empleado");

            System.out.println("\n===========================================");
            System.out.println("   REPORTE DE EMPLEADOS - BLUEPASS");
            System.out.println("===========================================");
            
            while (res.next()) {
                System.out.println("ID: " + res.getInt("id_empleado") 
                    + " | Cédula: " + res.getString("cedula")
                    + " | Nombre: " + res.getString("primer_nombre") + " " + res.getString("primer_apellido")
                    + " | Celular: " + res.getString("celular")
                    + " | Ciudad: " + res.getString("lugar_residencia"));
            }
            // 3. ACTUALIZAR DATOS
        String consultaUpdate = "UPDATE empleado SET lugar_residencia = 'Santa Marta' WHERE id_empleado = 4";
        state.executeUpdate(consultaUpdate);
        System.out.println("Registro actualizado correctamente.");

        // 4. ELIMINAR DATOS 
        // String consultaDelete = "DELETE FROM empleado WHERE id_empleado = 4";
        // state.executeUpdate(consultaDelete);
        // System.out.println("Registro eliminado correctamente.");
            System.out.println("===========================================");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Pruebabase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            System.out.println("Error de conexión: " + ex.getMessage());
        }
    }
}