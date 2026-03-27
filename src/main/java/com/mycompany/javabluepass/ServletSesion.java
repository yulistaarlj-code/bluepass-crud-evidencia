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
@WebServlet(name = "sesion", urlPatterns = {"/sesion"})
public class ServletSesion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("txtUsuario");
        String clave = request.getParameter("txtClave");

        try {
            // Se comprueba si el usuario y clave existen.
            if (usuario.equals("yuliana") && clave.equals("123")) {
                response.sendRedirect("inicio.jsp");
            } else {
                response.sendRedirect("errorsesion.jsp");
            }
        } catch (Exception e) {
            // En caso de un error de conexión o SQL
            System.out.println("Error en el proceso de login: " + e.getMessage());
            response.sendRedirect("login.jsp?error=db");
        }
    }
}
