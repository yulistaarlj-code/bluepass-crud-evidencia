/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.javabluepass;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// import static sun.jvm.hotspot.HelloWorld.e; // Importación detectada como innecesaria por el IDE

/**
 * Servlet Controlador para la gestión de empleados en el proyecto Bluepass.
 * Se encarga de recibir las peticiones HTTP (GET para búsqueda y POST para registro),
 * coordinar con la lógica de negocio y redirigir a las vistas correspondientes.
 * * @author Valentina Ramos
 */
@WebServlet(name = "/servletusuario", urlPatterns = {"/servletusuario"})
public class servletusuario extends HttpServlet {

    /**
     * Gestiona las peticiones de búsqueda de empleados.
     * Recibe la cédula desde el formulario de búsqueda, consulta la base de datos
     * y retorna el resultado al JSP 'buscarempleado.jsp'.
     * * @param request Objeto que contiene la petición del cliente (parámetro txtCedulaBusca)
     * @param response Objeto para enviar la respuesta al cliente
     * @throws ServletException Si ocurre un error específico del servlet
     * @throws IOException Si ocurre un error en la entrada/salida de datos
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cedulaABuscar = request.getParameter("txtCedulaBusca");

        if (cedulaABuscar != null && !cedulaABuscar.isEmpty()) {
            registrarusuario logica = new registrarusuario();

            try {
                // Consulta a la base de datos a través de la clase DAO
                registroempleado empencontrado = logica.buscarPorCedula(cedulaABuscar);

                if (empencontrado != null) {
                    // Si se encuentra, se adjunta el objeto a la petición
                    request.setAttribute("empleadoEncontrado", empencontrado);
                } else {
                    // Si no existe, se envía un mensaje de error informativo
                    request.setAttribute("errorBusqueda", "No se encontró el empleado.");
                }

                // Redirección interna manteniendo los atributos en el request
                request.getRequestDispatcher("buscarempleado.jsp").forward(request, response);

            } catch (ServletException e) {
                throw new ServletException(e);
            }
        }
    }

    /**
     * Gestiona el registro de nuevos empleados.
     * Captura todos los campos del formulario de registro, puebla un objeto
     * 'registroempleado' y solicita su inserción en la base de datos.
     * * @param request Contiene los parámetros del formulario (txtCedula, txtPrimerNombre, etc.)
     * @param response Utilizado para redirigir a páginas de éxito o error
     * @throws ServletException Si hay fallos en la lógica del servlet
     * @throws IOException Si hay errores en la redirección
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Extracción de parámetros desde la interfaz JSP
        String cedula = request.getParameter("txtCedula");
        String nombre1 = request.getParameter("txtPrimerNombre");
        String nombre2 = request.getParameter("txtSegundoNombre");
        String apellido1 = request.getParameter("txtPrimerApellido");
        String apellido2 = request.getParameter("txtSegundoApellido");
        String correo = request.getParameter("txtCorreo");
        String celular = request.getParameter("txtCelular");
        String residencia = request.getParameter("txtResidencia");

        // Conversión manual de tipo String a int para el campo edad
        int edad = Integer.parseInt(request.getParameter("txtEdad"));

        // 2. Mapeo de datos al objeto modelo
        registroempleado empleado = new registroempleado();
        empleado.setCedula(cedula);
        empleado.setPrimer_nombre(nombre1);
        empleado.setSegundo_nombre(nombre2);
        empleado.setPrimer_apellido(apellido1);
        empleado.setSegundo_apellido(apellido2);
        empleado.setCorreo_electronico(correo);
        empleado.setCelular(celular);
        empleado.setEdad(edad);
        empleado.setLugar_residencia(residencia);

        // 3. Invocación de la capa de persistencia (Base de Datos)
        registrarusuario rUsuario = new registrarusuario();
        boolean guardado = rUsuario.agregarEmpleado(empleado); 

        // 4. Control de flujo según el resultado de la operación SQL
        if (guardado) {
            // Redirección externa tras un registro exitoso
            response.sendRedirect("mensajeexito.jsp");
        } else {
            // Redirección con parámetro de error para retroalimentación en el formulario
            response.sendRedirect("registrarempleado.jsp?error=db");
        }
    }

    /**
     * Proporciona una descripción breve del propósito del servlet.
     * @return String Información del controlador.
     */
    @Override
    public String getServletInfo() {
        return "Controlador de registro de empleados - Proyecto Bluepass";
    }
}