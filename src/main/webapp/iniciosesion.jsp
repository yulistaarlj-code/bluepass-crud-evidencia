<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Bluepass</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .login-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                width: 350px;
                border-top: 5px solid #c85f83; /* El color rosado de tu proyecto */
            }
            .login-container h2 {
                text-align: center;
                color: #c85f83;
                margin-bottom: 25px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #333;
                font-weight: bold;
            }
            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box; /* Importante para que el padding no desborde */
            }
            .form-group input:focus {
                outline: none;
                border-color: #c85f83;
                box-shadow: 0 0 5px rgba(200, 95, 131, 0.3);
            }
            .btn-login {
                width: 100%;
                padding: 12px;
                background-color: #c85f83;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: background 0.3s ease;
            }
            .btn-login:hover {
                background-color: #b04e6f;
            }
            .error-msg {
                color: #d9534f;
                background-color: #f2dede;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
                margin-bottom: 15px;
                font-size: 14px;
            }
            .footer-links {
                text-align: center;
                margin-top: 15px;
                font-size: 13px;
            }
            .footer-links a {
                color: #c85f83;
                text-decoration: none;
            }
        </style>
    </head>
    <body>

        <div class="login-container">
            <h2>Bluepass Login</h2>

            <%-- Captura de errores si el servlet detecta credenciales incorrectas --%>
            <% if (request.getParameter("error") != null) { %>
                <div class="error-msg">
                    Usuario o contraseña incorrectos.
                </div>
            <% } %>

            <form action="sesion" method="POST">
                <div class="form-group">
                    <label for="txtUsuario">Usuario</label>
                    <input type="text" id="txtUsuario" name="txtUsuario" required 
                           placeholder="Ingresa tu identificación">
                </div>

                <div class="form-group">
                    <label for="txtClave">Contraseña:</label>
                    <input type="password" id="txtClave" name="txtClave" required 
                           placeholder="********">
                </div>

                <button type="submit" class="btn-login">Ingresar al Sistema</button>
            </form>

            <div class="footer-links">
                <p>¿No tienes acceso? <a href="registrarempleado.jsp">Regístrate aquí</a></p>
                <p>&copy; 2026 Bluepass - Sistema de Gestión</p>
            </div>
        </div>

    </body>
</html>