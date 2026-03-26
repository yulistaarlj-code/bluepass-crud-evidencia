<%-- 
    Document   : inicio
    Created on : 25/03/2026, 4:24:48 p. m.
    Author     : Valentina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bluepass - Sistema de Gestión</title>
    <style>
        /* --- ESTILOS ROSAS --- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #fef0f7;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #ff3399;
            color: white;
            padding: 1rem 5%;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav .logo { font-size: 1.6rem; font-weight: bold; }

        nav ul { list-style: none; display: flex; }

        nav ul li { margin-left: 20px; }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        .hero {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            background: linear-gradient(rgba(255, 51, 153, 0.4), rgba(255, 51, 153, 0.2)), 
                        url('https://images.unsplash.com/photo-1517036076934-2e964175b5b4?q=80&w=1500') no-repeat center center/cover;
            padding: 20px;
        }

        .welcome-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px 60px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(255, 51, 153, 0.2);
            border: 2px solid #ff3399;
        }

        .welcome-container h1 { font-size: 3.2rem; color: #ff3399; margin-bottom: 1rem; }

        .welcome-container p { font-size: 1.3rem; margin-bottom: 2.5rem; }

        .button-group { display: flex; justify-content: center; gap: 20px; flex-wrap: wrap; }

        .btn {
            display: inline-block;
            padding: 15px 35px;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-primary { background-color: #ff3399; color: white; }

        .btn-secondary { background-color: white; color: #ff3399; border: 2px solid #ff3399; }

        footer { text-align: center; padding: 25px; background-color: #333; color: white; margin-top: auto; }
    </style>
</head>
<body>

    <header>
        <nav>
            <div class="logo">Bluepass 🌸🚢</div>
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="registro_usuario.html">Registro</a></li>
                <li><a href="admin_panel.html">Administración</a></li>
            </ul>
        </nav>
    </header>

    <main class="hero">
        <section class="welcome-container">
            <h1>¡Bienvenida a Bluepass!</h1>
            <p>Sistema para el control de ingreso y salida marítima.</p>
            <div class="button-group">
                <a href="registroempleado.jsp" class="btn btn-primary">Registrar Usuario</a>
                <a href="admin_panel.jsp" class="btn btn-secondary">Administración</a>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2026 Bluepass - Gestión de Seguridad Marítima</p>
    </footer>

</body>
</html>