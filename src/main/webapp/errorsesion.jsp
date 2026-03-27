<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error de Acceso - Bluepass</title>
        
        <meta http-equiv="refresh" content="3; url=iniciosesion.jsp">
        
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .error-card {
                background: white;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                text-align: center;
                border-top: 8px solid #c85f83; /* Tu color rosado */
                max-width: 400px;
            }
            h1 {
                color: #c85f83;
                font-size: 24px;
                margin-bottom: 10px;
            }
            p {
                color: #555;
                font-size: 16px;
                line-height: 1.6;
            }
            .loader {
                border: 4px solid #f3f3f3;
                border-top: 4px solid #c85f83;
                border-radius: 50%;
                width: 30px;
                height: 30px;
                animation: spin 1s linear infinite;
                margin: 20px auto;
            }
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
            .contador {
                font-weight: bold;
                color: #c85f83;
            }
            .btn-volver {
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                color: #c85f83;
                font-weight: bold;
                border: 1px solid #c85f83;
                padding: 8px 20px;
                border-radius: 5px;
                transition: 0.3s;
            }
            .btn-volver:hover {
                background: #c85f83;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="error-card">
            <div class="loader"></div>
            <h1>Acceso Denegado</h1>
            <p>Usuario o contraseña incorrectos.</p>
            <p>Serás redirigido en <span id="segundos" class="contador">3</span> segundos...</p>
            
            <a href="iniciosesion.jsp" class="btn-volver">Ir ahora mismo</a>
        </div>

        <script>
            let tiempo = 3;
            const span = document.getElementById('segundos');
            setInterval(() => {
                tiempo--;
                if(tiempo >= 0) span.innerText = tiempo;
            }, 1000);
        </script>
    </body>
</html>