<%-- 
    Document   : buscarempleado
    Created on : 25/03/2026
    Author     : Valentina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.javabluepass.registroempleado"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Empleado - Bluepass</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', sans-serif;
            }
            body {
                background-color: #fef0f7;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
                padding: 40px 20px;
            }
            .search-card {
                background: white;
                padding: 30px;
                border-radius: 15px;
                border: 2px solid #ff3399;
                box-shadow: 0 10px 20px rgba(255, 51, 153, 0.1);
                width: 100%;
                max-width: 600px;
                margin-bottom: 30px;
            }
            h2 {
                color: #ff3399;
                text-align: center;
                margin-bottom: 20px;
                border-bottom: 2px solid #ff3399;
                padding-bottom: 10px;
            }
            .form-group {
                display: flex;
                gap: 10px;
                margin-bottom: 15px;
            }
            input[type="text"] {
                flex: 2;
                padding: 12px;
                border: 1px solid #ffb3d9;
                border-radius: 25px;
                outline: none;
                transition: 0.3s;
            }
            input:focus {
                border-color: #ff3399;
                box-shadow: 0 0 5px rgba(255, 51, 153, 0.2);
            }
            .btn-search {
                flex: 1;
                background-color: #ff3399;
                color: white;
                border: none;
                border-radius: 25px;
                font-weight: bold;
                cursor: pointer;
                transition: 0.3s;
            }
            .btn-search:hover {
                background-color: #e62e8a;
            }
            /* Estilos de la Tabla */
            .table-container {
                width: 100%;
                max-width: 900px;
                background: white;
                border-radius: 15px;
                overflow: hidden;
                border: 2px solid #ff3399;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            thead {
                background-color: #ff3399;
                color: white;
            }
            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #fef0f7;
            }
            th {
                font-weight: bold;
                text-transform: uppercase;
                font-size: 0.85rem;
            }
            tr:hover {
                background-color: #fff0f7;
            }
            .no-data {
                padding: 40px;
                text-align: center;
                color: #ff3399;
                font-weight: bold;
            }
            .btn-back {
                margin-top: 20px;
                color: #ff3399;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <div class="search-card">
            <h2>Buscador de Personal</h2>
            <form action="buscarusuario" method="GET">
                <div class="form-group">
                    <input type="text" name="txtCedulaBusca" placeholder="Ingrese Cédula..." required>
                    <button type="submit" class="btn-search">BUSCAR</button>
                </div>
            </form>
            <center><a href="inicio.jsp" class="btn-back">← Volver al Panel</a></center>
        </div>

        <%-- Contenedor de la Tabla de Resultados --%>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Cédula</th>
                        <th>Nombre Completo</th>
                        <th>Correo</th>
                        <th>Celular</th>
                        <th>Edad</th>
                        <th>Residencia</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        registroempleado emp = (registroempleado) request.getAttribute("empleadoEncontrado");
                        if (emp != null) {
                    %>
                    <tr>
                        <td><strong><%= emp.getCedula() %></strong></td>
                        <td><%= emp.getPrimer_nombre() %> <%= emp.getPrimer_apellido() %></td>
                        <td><%= emp.getCorreo_electronico() %></td>
                        <td><%= emp.getCelular() %></td>
                        <td><%= emp.getEdad() %> años</td>
                        <td><%= emp.getLugar_residencia() %></td>
                    </tr>
                    <% 
                        } else { 
                    %>
                    <tr>
                        <td colspan="6" class="no-data">
                            <% if (request.getParameter("txtCedulaBusca") != null) { %>
                                ⚠️ No se encontró ningún empleado con esa identificación.
                            <% } else { %>
                                Ingrese una cédula para ver la información.
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

    </body>
</html>