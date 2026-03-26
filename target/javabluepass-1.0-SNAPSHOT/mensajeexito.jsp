<%-- 
    Document   : mensajeexito
    Created on : 25/03/2026
    Author     : Valentina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Éxito - Bluepass</title>
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
            .message-container {
                background: white;
                padding: 40px;
                border-radius: 15px;
                border: 2px solid #ff3399;
                box-shadow: 0 10px 20px rgba(255, 51, 153, 0.1);
                width: 100%;
                max-width: 500px;
                text-align: center;
            }
            .icon-circle {
                width: 80px;
                height: 80px;
                background-color: #fef0f7;
                border: 3px solid #ff3399;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 auto 20px;
                color: #ff3399;
                font-size: 40px;
            }
            h2 {
                color: #ff3399;
                margin-bottom: 15px;
            }
            p {
                color: #666;
                margin-bottom: 30px;
                line-height: 1.6;
            }
            .btn-home {
                display: inline-block;
                width: 100%;
                padding: 12px;
                background-color: #ff3399;
                color: white;
                border: none;
                border-radius: 25px;
                font-size: 1.1rem;
                font-weight: bold;
                text-decoration: none;
                transition: 0.3s;
            }
            .btn-home:hover {
                background-color: #e62e8a;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 51, 153, 0.3);
            }
        </style>
    </head>
    <body>
        <div class="message-container">
            <div class="icon-circle">
                ✓
            </div>
            <h2>¡Registro Exitoso!</h2>
            <p>El empleado ha sido guardado correctamente en el sistema <strong>Bluepass</strong>.</p>
            
            <a href="inicio.jsp" class="btn-home">
                Volver al Panel Principal
            </a>
        </div>
    </body>
    
    <script>
    // Ejecutar la función después de 3000 milisegundos (3 segundos)
    setTimeout(function() {
        window.location.href = "inicio.jsp";
    }, 2000);
    </script>
</html>