/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javabluepass;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;

/**
 * Clase de acceso a datos (DAO) para la gestión de usuarios/empleados.
 * Contiene la lógica para registrar nuevos empleados y realizar búsquedas 
 * en la base de datos bd_bluepass.
 * * @author Valentina Ramos
 */
public class registrarusuario {

    /** Instancia global para gestionar la conexión con el servidor MySQL */
    Conexionjava con = new Conexionjava();

    /**
     * Registra un nuevo empleado en la tabla 'empleado'.
     * Utiliza un PreparedStatement para prevenir inyecciones SQL y asegurar la integridad de los datos.
     * * @param empleado Objeto de tipo registroempleado con la información a persistir.
     * @return boolean True si el registro fue exitoso (filas afectadas > 0), False en caso contrario.
     * @throws IOException Si ocurre un error de entrada/salida.
     * @throws ServletException Si hay fallos en la conexión o errores en la ejecución de la sentencia SQL.
     */
    public boolean agregarEmpleado(registroempleado empleado) throws IOException, ServletException {
        // 1. Intentar obtener la conexión
        Connection connn = con.conectar();

        // 2. VERIFICACIÓN CRÍTICA: ¿La conexión es nula?
        if (connn == null) {
            throw new ServletException("⚠️ Error de Conexión: No se pudo establecer el puente con MySQL. "
                    + "Verifica que XAMPP esté corriendo en el puerto 3307 y que la base de datos 'bd_bluepass' exista.");
        }

        // SQL con los 9 campos de tu tabla (el id_empleado suele ser autoincremental)
        String sql = "INSERT INTO empleado (cedula, primer_nombre, segundo_nombre, "
                + "primer_apellido, segundo_apellido, correo_electronico, celular, "
                + "edad, lugar_residencia) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = con.conectar(); PreparedStatement ps = conn.prepareStatement(sql)) {

            // Mapeo de parámetros del objeto empleado al PreparedStatement
            ps.setString(1, empleado.getCedula());
            ps.setString(2, empleado.getPrimer_nombre());
            ps.setString(3, empleado.getSegundo_nombre());
            ps.setString(4, empleado.getPrimer_apellido());
            ps.setString(5, empleado.getSegundo_apellido());
            ps.setString(6, empleado.getCorreo_electronico());
            ps.setString(7, empleado.getCelular());
            ps.setInt(8, empleado.getEdad());
            ps.setString(9, empleado.getLugar_residencia());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            System.out.println("Error al insertar en bd_bluepass: " + e.getMessage());
            throw new ServletException(e);
        }
    }

    /**
     * Realiza una consulta en la base de datos para encontrar un empleado por su número de cédula.
     * * @param cedula El número de documento a buscar.
     * @return registroempleado El objeto poblado con los datos de la DB, o null si no se encuentra coincidencia.
     * @throws ServletException Si la conexión falla o hay un error de sintaxis en la consulta.
     */
    public registroempleado buscarPorCedula(String cedula) throws ServletException {
        registroempleado empleado = null;
        String sql = "SELECT * FROM empleado WHERE cedula = ?";

        // 1. Obtener la conexión
        Connection conn = con.conectar();
        if (conn == null) {
            throw new ServletException("Error de conexión al buscar empleado.");
        }

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cedula);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // 2. Si existe, creamos el objeto y lo llenamos con los datos del ResultSet
                    empleado = new registroempleado();
                    empleado.setCedula(rs.getString("cedula"));
                    empleado.setPrimer_nombre(rs.getString("primer_nombre"));
                    empleado.setSegundo_nombre(rs.getString("segundo_nombre"));
                    empleado.setPrimer_apellido(rs.getString("primer_apellido"));
                    empleado.setSegundo_apellido(rs.getString("segundo_apellido"));
                    empleado.setCorreo_electronico(rs.getString("correo_electronico"));
                    empleado.setCelular(rs.getString("celular"));
                    empleado.setEdad(rs.getInt("edad"));
                    empleado.setLugar_residencia(rs.getString("lugar_residencia"));
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error en la consulta SQL: " + e.getMessage());
        } finally {
            // Cierre preventivo de la conexión para evitar fugas de recursos (Memory Leaks)
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                // Error silencioso al cerrar la conexión
            }
        }

        return empleado; // Si no lo encuentra, devuelve null
    }
}