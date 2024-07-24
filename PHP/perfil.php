<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Perfil</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding-top: 20px;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    header {
        background-color: #333;
        color: #fff;
        padding: 20px 0;
        text-align: center;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
    }
    header h1 {
        margin: 0;
        flex: 1;
    }
    .return-btn {
        background-color: #007bff;
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        cursor: pointer;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
    }
    .return-btn:hover {
        background-color: #0056b3;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        transform: translateY(-2px);
    }
    .profile-container {
        max-width: 800px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .profile-header {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
    .profile-header img {
        border-radius: 50%;
        width: 120px;
        height: 120px;
        object-fit: cover;
        margin-right: 20px;
    }
    .profile-header h1 {
        margin: 0;
    }
    .profile-header p {
        color: #666;
    }
    .profile-details {
        margin-top: 20px;
    }
    .profile-details h2 {
        margin-top: 0;
    }
    footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px;
        margin-top: auto;
    }
</style>
</head>
<body>
<header>
    <h1>Perfil</h1>
    <a href="index.php" class="return-btn">Menú</a>
</header>
<div class="profile-container">
    <div class="profile-header">
        <img src="https://t2.uc.ltmcdn.com/es/posts/5/1/8/como_saber_si_una_mujer_es_sincera_34815_600_square.jpg" alt="Foto de perfil">
        <div>
            <h1>Susana Hidalgo Vargas</h1>
            <p>@Susana</p>
        </div>
    </div>
    <div class="profile-details">
        <h2>Sobre mí</h2>
        <p>Soy una estudiante de derecho. Trabajo en el tribunal de justicia andorrano y tengo 26 años.</p>
        <h2>Dirección</h2>
        <p>25 sur, 25 norte centro villa del viejo. Residencia 2, casa Azul de 2 pisos.</p>
        <h2>Detalles de Contacto</h2>
        <p><strong>Email:</strong> SusanaHV@example.com</p>
        <p><strong>Teléfono:</strong> +123 456 7890</p>
    </div>
</div>

</body>
</html>
