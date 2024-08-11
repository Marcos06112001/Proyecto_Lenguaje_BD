<?php
session_start();
include '../DAL/conexion.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: inicio_sesion.php");
    exit();
}


function obtenerCliente($cliente_id) {
    $conexion = Conecta();
    
    $sql = "SELECT V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass
            FROM FIDE_CLIENTES_TB
            WHERE V_id_cliente = :cliente_id";

    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':cliente_id', $cliente_id, PDO::PARAM_INT);
        $stmt->execute();
        
        
        $cliente = $stmt->fetch(PDO::FETCH_ASSOC);
        
    } catch (PDOException $e) {
        echo "Error al obtener la información del cliente: " . $e->getMessage();
        $cliente = [];
    }
    
    Desconectar($conexion);
    
    return $cliente;
}


$cliente_id = $_SESSION['user_id'];
$cliente = obtenerCliente($cliente_id);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
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
        <img src="<?php echo htmlspecialchars($cliente['V_IMAGEN'] ?? 'default-profile.jpg'); ?>" alt="Foto de perfil" class="profile-img">
        <div class="ms-3">
            <h1 class="fs-3 mb-1"><?php echo htmlspecialchars($cliente['V_NOMBRE_CLIENTE'] . ' ' . $cliente['V_APELLIDO_CLIENTE']); ?></h1>
            <p class="text-muted mb-0">@<?php echo htmlspecialchars($cliente['V_EMAIL']); ?></p>
        </div>
    </div>

    <div class="profile-details">
        <h2 class="fs-4 mb-3">Sobre mí</h2>
        <form class="profile-form">
            <h2 class="fs-4 mb-3">Detalles de Contacto</h2>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" class="form-control" value="<?php echo htmlspecialchars($cliente['V_EMAIL'] ?? 'No disponible'); ?>" readonly>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Teléfono</label>
                <input type="tel" id="phone" class="form-control" value="<?php echo htmlspecialchars($cliente['V_TELEFONO'] ?? 'No disponible'); ?>" readonly>
            </div>
        </form>
    </div>
</div>

</body>
</html>
