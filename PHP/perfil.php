<?php
session_start();
include '../DAL/conexion.php'; 

$error_message = '';
$nombre = $apellido = $email = $telefono = $direccion = $imagen = '';

// Verificar si el usuario está autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: inicio_sesion.php");
    exit();
}

$user_id = $_SESSION['user_id'];

$conexion = Conecta();

$sql = 'BEGIN FIDE_CLIENTES_SELECCIONAR_SP(:user_id, :nombre, :apellido, :email, :telefono, :direccion, :imagen); END;';
$stmt = $conexion->prepare($sql);

$stmt->bindParam(':user_id', $user_id);
$stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR, 255);
$stmt->bindParam(':apellido', $apellido, PDO::PARAM_STR, 255);
$stmt->bindParam(':email', $email, PDO::PARAM_STR, 255);
$stmt->bindParam(':telefono', $telefono, PDO::PARAM_STR, 20);
$stmt->bindParam(':direccion', $direccion, PDO::PARAM_STR, 4000);
$stmt->bindParam(':imagen', $imagen, PDO::PARAM_STR, 255);

try {
    $stmt->execute();
} catch (PDOException $e) {
    $error_message = "Error al obtener la información del cliente: " . $e->getMessage();
}

Desconectar($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Cliente</title>
    <link rel="stylesheet" href="../CSS/perfil.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007BFF;
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
        }
        header h1 {
            margin: 0;
            font-size: 2rem;
        }
        .return-btn {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            background-color: white;
            color: #007BFF;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        #perfil-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-right: 30px;
            object-fit: cover;
            border: 4px solid #007BFF;
        }
        .profile-header h1 {
            margin: 0;
            font-size: 1.8rem;
            color: #333;
        }
        .profile-header p {
            margin: 5px 0;
            font-size: 1.1rem;
            color: #666;
        }
        p {
            line-height: 1.6;
        }
        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Perfil del Cliente</h1>
        <a href="index.php" class="return-btn">Menú</a>
    </header>
    <div id="perfil-container">
        <div class="profile-header">
            <?php if ($imagen) { ?>
                <img src="<?php echo htmlspecialchars($imagen); ?>" alt="Imagen del perfil" class="profile-img">
            <?php } ?>
            <div>
                <h1><?php echo htmlspecialchars($nombre) . ' ' . htmlspecialchars($apellido); ?></h1>
                <p><?php echo htmlspecialchars($email); ?></p>
                <p><?php echo htmlspecialchars($telefono); ?></p>
                <p><?php echo htmlspecialchars($direccion); ?></p>
            </div>
        </div>
        <?php if ($error_message) { ?>
            <p class="error-message"><?php echo $error_message; ?></p>
        <?php } ?>
    </div>
</body>
</html>
