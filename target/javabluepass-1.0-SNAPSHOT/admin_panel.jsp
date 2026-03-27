<%-- 
    Document   : panel de administracion
    Created on : 25/03/2026
    Author     : Valentina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Buscar Empleado - Bluepass</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background-color: #fef0f7;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                padding: 20px;
            }
            .search-container {
                background: white;
                padding: 30px;
                border-radius: 15px;
                border: 2px solid #ff3399;
                box-shadow: 0 10px 20px rgba(255, 51, 153, 0.1);
                width: 100%;
                max-width: 500px;
            }
            h2 {
                color: #ff3399;
                text-align: center;
                margin-bottom: 20px;
                border-bottom: 2px solid #ff3399;
                padding-bottom: 10px;
            }
            label {
                display: block;
                color: #ff3399;
                font-weight: bold;
                margin-bottom: 8px;
            }
            input[type="text"] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ffb3d9;
                border-radius: 8px;
                outline: none;
                margin-bottom: 20px;
                transition: 0.3s;
            }
            input:focus {
                border-color: #ff3399;
                box-shadow: 0 0 5px rgba(255, 51, 153, 0.3);
            }
            .btn-search {
                width: 100%;
                padding: 12px;
                background-color: #ff3399;
                color: white;
                border: none;
                border-radius: 25px;
                font-size: 1.1rem;
                font-weight: bold;
                cursor: pointer;
                transition: 0.3s;
                margin-bottom: 10px;
            }
            .btn-search:hover {
                background-color: #e62e8a;
                transform: translateY(-2px);
            }
            .btn-back {
                display: block;
                text-align: center;
                padding: 10px;
                color: #ff3399;
                text-decoration: none;
                font-weight: bold;
                font-size: 0.9rem;
            }
            .result-box {
                margin-top: 25px;
                padding: 15px;
                background-color: #fff0f7;
                border-radius: 10px;
                border: 1px dashed #ff3399;
            }
            .result-item {
                margin-bottom: 8px;
                color: #555;
            }
            .result-item span {
                font-weight: bold;
                color: #ff3399;
            }
        </style>
    </head>
    <body>
        <div class="search-container">
            <h2>Buscar Empleado</h2>
            
            <form action="buscarusuario" method="GET">
                <label>Número de Cédula:</label>
                <input type="text" name="txtCedulaBusca" placeholder="Ingrese la cédula a consultar" required>
                
                <button type="submit" class="btn-search">Consultar</button>
                <a href="inicio.jsp" class="btn-back">Volver al Inicio</a>
            </form>

            <%-- Bloque para mostrar resultados (se activa si el objeto empleado existe en la sesión) --%>
            <% 
                if (request.getAttribute("empleadoEncontrado") != null) {
                    com.mycompany.javabluepass.registroempleado emp = 
                        (com.mycompany.javabluepass.registroempleado) request.getAttribute("empleadoEncontrado");
            %>
                <div class="result-box">
                    <h3 style="color: #ff3399; font-size: 1rem; margin-bottom: 10px; text-align: center;">Resultados:</h3>
                    <div class="result-item"><span>Nombre:</span> <%= emp.getPrimer_nombre() %> <%= emp.getPrimer_apellido() %></div>
                    <div class="result-item"><span>Correo:</span> <%= emp.getCorreo_electronico() %></div>
                    <div class="result-item"><span>Celular:</span> <%= emp.getCelular() %></div>
                    <div class="result-item"><span>Residencia:</span> <%= emp.getLugar_residencia() %></div>
                </div>
            <% 
                } else if (request.getParameter("noencontrado") != null) { 
            %>
                <div style="color: #cc0000; text-align: center; margin-top: 20px; font-weight: bold;">
                    ⚠️ No se encontró ningún empleado con esa cédula.
                </div>
            <% } %>
        </div>
    </body>
</html>