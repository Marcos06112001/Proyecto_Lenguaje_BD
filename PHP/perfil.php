<?php
include '../DAL/conexion.php';

// Obtiene el nombre del cliente usando la función en la base de datos
function obtenerNombreCliente($cliente_id) {
    $conexion = Conecta();
    
    $sql = "SELECT FIDE_CLIENTE_TB_OBTENER_NOMBRE_FN(:cliente_id) AS nombre_cliente FROM DUAL";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':cliente_id', $cliente_id, PDO::PARAM_INT);
        $stmt->execute();
        $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
        $nombre_cliente = $resultado['NOMBRE_CLIENTE'];
    } catch (PDOException $e) {
        echo "Error al obtener el nombre del cliente: " . $e->getMessage();
        $nombre_cliente = "";
    }
    
    Desconectar($conexion);
    
    return $nombre_cliente;
}

// ID del cliente que deseas consultar
$cliente_id = 1; // Puedes cambiar este valor según sea necesario
$nombre_cliente = obtenerNombreCliente($cliente_id);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/CSS/perfiles.css">
    <style>
        /* Reset básico */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Roboto', sans-serif;
    background-color: #f4f4f4;
    padding-top: 20px;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

header {
    background-color: #007bff;
    color: #fff;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

header h1 {
    margin: 0;
    font-size: 1.5rem;
}

.return-btn {
    background-color: #0056b3;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.return-btn:hover {
    background-color: #003d80;
    transform: translateY(-2px);
}

.profile-container {
    max-width: 800px;
    margin: auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.profile-header {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.profile-img {
    border-radius: 50%;
    width: 120px;
    height: 120px;
    object-fit: cover;
    margin-right: 20px;
    border: 4px solid #007bff;
}

.profile-header h1 {
    margin-bottom: 10px;
    font-size: 1.75rem;
}

.profile-header p {
    color: #6c757d;
}

.profile-details {
    margin-top: 20px;
}

.profile-details h2 {
    font-size: 1.25rem;
    margin-bottom: 15px;
    color: #343a40;
}

.profile-form {
    background-color: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.profile-form .form-label {
    font-weight: bold;
    color: #495057;
}

.profile-form .form-control {
    background-color: #ffffff;
    border: 1px solid #ced4da;
    border-radius: 4px;
}

.profile-form .form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
}

    </style>
</head>
<body>
<header class="d-flex justify-content-between align-items-center p-4 bg-primary text-white shadow">
        <h1 class="mb-0">Perfil</h1>
        <a href="index.php" class="btn return-btn">Menú</a>
    </header>

    <div class="profile-container container mt-5 p-4 bg-white shadow rounded">
        <div class="profile-header d-flex align-items-center mb-4">
            <img src="https://t2.uc.ltmcdn.com/es/posts/5/1/8/como_saber_si_una_mujer_es_sincera_34815_600_square.jpg" alt="Foto de perfil" class="profile-img">
            <div class="ms-3">
                <h1 class="fs-3 mb-1">Susana Hidalgo Vargas</h1>
                <p class="text-muted mb-0">@Susana</p>
            </div>
        </div>

        <div class="profile-details">
    <h2 class="fs-4 mb-3">Sobre mí</h2>
    <form class="profile-form">
        <div class="mb-3">
            <label for="bio" class="form-label">Biografía</label>
            <textarea id="bio" class="form-control" rows="4" readonly>Soy una estudiante de derecho. Trabajo en el tribunal de justicia andorrano y tengo 26 años.</textarea>
        </div>
        
        <h2 class="fs-4 mb-3">Dirección</h2>
        <div class="mb-3">
            <label for="address" class="form-label">Dirección</label>
            <textarea id="address" class="form-control" rows="3" readonly>25 sur, 25 norte centro villa del viejo. Residencia 2, casa Azul de 2 pisos.</textarea>
        </div>
        
        <h2 class="fs-4 mb-3">Detalles de Contacto</h2>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" class="form-control" value="SusanaHV@example.com" readonly>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Teléfono</label>
            <input type="tel" id="phone" class="form-control" value="+123 456 7890" readonly>
        </div>
    </form>
</div>

    <!-- Optional Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-7t0D7Gv2IKK5zQb6mD4ztDA7VxXq64fU66g4E6cGepV6Vm4tQ1Sgjv2Qh0ggxVoS" crossorigin="anonymous"></script>
</body>
</html>