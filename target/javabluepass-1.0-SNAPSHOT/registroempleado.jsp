<%-- 
    Document   : registrarempleado
    Created on : 25/03/2026, 4:44:58 p. m.
    Author     : Valentina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Empleado - Bluepass</title>
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
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                padding: 20px;
            }
            .form-container {
                background: white;
                padding: 30px;
                border-radius: 15px;
                border: 2px solid #ff3399;
                box-shadow: 0 10px 20px rgba(255, 51, 153, 0.1);
                width: 100%;
                max-width: 600px;
            }
            h2 {
                color: #ff3399;
                text-align: center;
                margin-bottom: 20px;
                border-bottom: 2px solid #ff3399;
                padding-bottom: 10px;
            }
            .form-group {
                margin-bottom: 15px;
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 15px;
            }
            .full-width {
                grid-column: span 2;
            }
            label {
                display: block;
                color: #ff3399;
                font-weight: bold;
                margin-bottom: 5px;
                font-size: 0.9rem;
            }
            input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ffb3d9;
                border-radius: 8px;
                outline: none;
                transition: 0.3s;
            }
            input:focus {
                border-color: #ff3399;
                box-shadow: 0 0 5px rgba(255, 51, 153, 0.3);
            }
            .btn-submit {
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
                margin-top: 10px;
            }
            .btn-submit:hover {
                background-color: #e62e8a;
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2>Registro de Empleado</h2>

            <form action="registrarusuario" method="POST">
                <div class="form-group">
                    <div class="full-width">
                        <label>Cédula:</label>
                        <input type="text" name="txtCedula" placeholder="Ej: 12345678" required>
                    </div>

                    <div>
                        <label>Primer Nombre:</label>
                        <input type="text" name="txtPrimerNombre" required>
                    </div>
                    <div>
                        <label>Segundo Nombre:</label>
                        <input type="text" name="txtSegundoNombre">
                    </div>

                    <div>
                        <label>Primer Apellido:</label>
                        <input type="text" name="txtPrimerApellido" required>
                    </div>
                    <div>
                        <label>Segundo Apellido:</label>
                        <input type="text" name="txtSegundoApellido">
                    </div>

                    <div class="full-width">
                        <label>Correo Electrónico:</label>
                        <input type="email" name="txtCorreo" placeholder="ejemplo@correo.com" required>
                    </div>

                    <div>
                        <label>Celular:</label>
                        <input type="text" name="txtCelular" required>
                    </div>
                    <div>
                        <label>Edad:</label>
                        <input type="number" name="txtEdad" required>
                    </div>

                    <div class="full-width">
                        <label>Lugar de Residencia:</label>
                        <input type="text" name="txtResidencia" required>
                    </div>
                </div>

                <div style="display: flex; gap: 10px; margin-top: 20px;">

                    <a href="inicio.jsp" style="flex: 1; text-align: center; padding: 12px; background-color: white; color: #ff3399; border: 2px solid #ff3399; border-radius: 25px; text-decoration: none; font-weight: bold; transition: 0.3s;">
                        Volver al Inicio
                    </a>

                    <button type="submit" class="btn-submit" style="flex: 1; margin-top: 0;">
                        Guardar Empleado
                    </button>

                </div>

            </form>

        </form>
    </div>
</body>
</html>