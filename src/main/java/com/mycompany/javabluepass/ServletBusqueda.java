/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javabluepass;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Valentina
 */
@WebServlet(name = "buscarusuario", urlPatterns = {"/buscarusuario"})
public class ServletBusqueda extends HttpServlet {

    /**
     * Gestiona las peticiones de búsqueda de empleados. Recibe la cédula desde
     * el formulario de búsqueda, consulta la base de datos y retorna el
     * resultado al JSP 'buscarempleado.jsp'.
     *
     * * @param request Objeto que contiene la petición del cliente (parámetro
     * txtCedulaBusca)
     * @param request
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

}
