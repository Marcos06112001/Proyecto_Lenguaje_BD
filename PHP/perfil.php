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
            <p style="color: red;"><?php echo $error_message; ?></p>
        <?php } ?>
    </div>
</body>
</html>
