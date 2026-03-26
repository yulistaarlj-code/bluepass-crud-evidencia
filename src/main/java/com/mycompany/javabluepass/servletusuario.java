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
import static sun.jvm.hotspot.HelloWorld.e;

/**
 * Servlet para gestionar el registro de usuarios en Bluepass
 *
 * @author Valentina
 */
@WebServlet(name = "/servletusuario", urlPatterns = {"/servletusuario"})
//@WebServlet("servletusuario")
public class servletusuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cedulaABuscar = request.getParameter("txtCedulaBusca");

        if (cedulaABuscar != null && !cedulaABuscar.isEmpty()) {
            registrarusuario logica = new registrarusuario();

            try {
                registroempleado empencontrado = logica.buscarPorCedula(cedulaABuscar);

                if (empencontrado != null) {
                    // Pasamos el objeto al JSP
                    request.setAttribute("empleadoEncontrado", empencontrado);
                } else {
                    // Enviamos una señal de que no existe
                    request.setAttribute("errorBusqueda", "No se encontró el empleado.");
                }

                // Redirigimos de vuelta al mismo JSP para mostrar los resultados
                request.getRequestDispatcher("buscarempleado.jsp").forward(request, response);

            } catch (ServletException e) {
                throw new ServletException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Extraer los datos del formulario usando los "name" de los inputs del JSP
        String cedula = request.getParameter("txtCedula");
        String nombre1 = request.getParameter("txtPrimerNombre");
        String nombre2 = request.getParameter("txtSegundoNombre");
        String apellido1 = request.getParameter("txtPrimerApellido");
        String apellido2 = request.getParameter("txtSegundoApellido");
        String correo = request.getParameter("txtCorreo");
        String celular = request.getParameter("txtCelular");
        String residencia = request.getParameter("txtResidencia");

        // Convertir la edad (porque viene como texto)
        int edad = Integer.parseInt(request.getParameter("txtEdad"));

        // 2. Crear y llenar el objeto Empleado (o la clase que uses como molde)
        // Asegúrate de que los nombres de los métodos coincidan con tu clase
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

        // 3. Llamar a la lógica de base de datos
        registrarusuario rUsuario = new registrarusuario();
        boolean guardado = rUsuario.agregarEmpleado(empleado); // Asumo que devuelve true si funcionó

        // 4. Redirigir según el resultado
        if (guardado) {
            response.sendRedirect("mensajeexito.jsp");
        } else {
            // Por si algo falla en la base de datos (puedes crear un mensajeerror.jsp luego)
            response.sendRedirect("registrarempleado.jsp?error=db");
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador de registro de empleados - Proyecto Bluepass";
    }
}
