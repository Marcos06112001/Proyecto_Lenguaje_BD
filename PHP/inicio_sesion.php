<?php
session_start();
include '../DAL/conexion.php'; 

$error_message = '';
$success_message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['register'])) {
        
        $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : '';
        $apellido = isset($_POST['apellido']) ? $_POST['apellido'] : '';
        $email = isset($_POST['email_reg']) ? $_POST['email_reg'] : '';
        $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : '';
        $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : '';
        $imagen = isset($_POST['imagen']) ? $_POST['imagen'] : ''; 
        $password = isset($_POST['password_reg']) ? $_POST['password_reg'] : '';

        $conexion = Conecta();

       
        $sql = 'BEGIN FIDE_CLIENTES_INSERTAR_SP(:nombre_cliente, :apellido_cliente, :email, :telefono, :direccion, :imagen, :rol, :pass); END;';
        $stmt = $conexion->prepare($sql);

        
        $stmt->bindParam(':nombre_cliente', $nombre);
        $stmt->bindParam(':apellido_cliente', $apellido);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':telefono', $telefono);
        $stmt->bindParam(':direccion', $direccion);
        $stmt->bindParam(':imagen', $imagen);
        $rol = 'Cliente'; 
        $stmt->bindParam(':rol', $rol);
        $stmt->bindParam(':pass', $password);

        try {
            $result = $stmt->execute();
            if ($result) {
                $success_message = "Cliente registrado con éxito.";
            } else {
                $error_message = "Error al registrar cliente.";
            }
        } catch (PDOException $e) {
            $error_message = "Error al ejecutar el procedimiento: " . $e->getMessage();
        }

        Desconectar($conexion);
    } else {
        
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $password = isset($_POST['password']) ? $_POST['password'] : '';

        $conexion = Conecta();

        $sql = "SELECT V_ID_CLIENTE, V_NOMBRE_CLIENTE, V_PASS, V_ROL, V_IMAGEN FROM FIDE_CLIENTES_TB WHERE V_EMAIL = :email";
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':email', $email);

        try {
            $stmt->execute();
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user) {
                if ($password === $user['V_PASS']) {
                    $_SESSION['user_id'] = $user['V_ID_CLIENTE'];
                    $_SESSION['user_name'] = $user['V_NOMBRE_CLIENTE'];
                    $_SESSION['rol'] = $user['V_ROL'];
                    $_SESSION['id_cliente'] = $user['V_ID_CLIENTE'];
                    $_SESSION['imagen'] = $user['V_IMAGEN'];

                    header("Location: index.php");
                    exit();
                } else {
                    $error_message = "Correo electrónico o contraseña incorrectos";
                }
            } else {
                $error_message = "Correo electrónico o contraseña incorrectos";
            }
        } catch (PDOException $e) {
            $error_message = "Error al ejecutar la consulta: " . $e->getMessage();
        }

        Desconectar($conexion);
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión / Registrarse</title>
    <link rel="stylesheet" href="../CSS/sesion.css">
</head>
<body>
    <header>
        <h1>Iniciar sesión / Registrarse</h1>
        <a href="index.php" class="btn btn-primary menu-btn">Menú</a>
    </header>
    <div id="login-register-container">
        <!-- Formulario de inicio de sesión -->
        <div class="form-container">
            <h2 id="login-title">Iniciar sesión</h2>
            <form id="login-form" action="inicio_sesion.php" method="post">
                <label class="label-form" for="email">Correo electrónico:</label>
                <input class="input-form" type="email" id="email" name="email" required>
                <label class="label-form" for="password">Contraseña:</label>
                <input class="input-form" type="password" id="password" name="password" required>
                <input class="btn-form" type="submit" value="Iniciar sesión">
                <?php if ($error_message) { ?>
                    <p style="color: red;"><?php echo $error_message; ?></p>
                <?php } ?>
            </form>
        </div>
      
        <div class="form-container">
            <h2 id="register-title">Registrarse</h2>
            <form id="register-form" action="inicio_sesion.php" method="post">
                <input type="hidden" name="register" value="1">
                <label class="label-form" for="nombre">Nombre:</label>
                <input class="input-form" type="text" id="nombre" name="nombre" required>
                <label class="label-form" for="apellido">Apellido:</label>
                <input class="input-form" type="text" id="apellido" name="apellido" required>
                <label class="label-form" for="email_reg">Correo electrónico:</label>
                <input class="input-form" type="email" id="email_reg" name="email_reg" required>
                <label class="label-form" for="telefono">Teléfono:</label>
                <input class="input-form" type="tel" id="telefono" name="telefono" required>
                <label class="label-form" for="direccion">Dirección:</label>
                <textarea class="input-form" id="direccion" name="direccion" required></textarea>
                <label class="label-form" for="password_reg">Contraseña:</label>
                <input class="input-form" type="password" id="password_reg" name="password_reg" required>
                <label class="label-form" for="imagen">Imagen (URL):</label>
                <input class="input-form" type="text" id="imagen" name="imagen">
                <input class="btn-form" type="submit" value="Crear usuario">
                <?php if ($success_message) { ?>
                    <p style="color: green;"><?php echo $success_message; ?></p>
                <?php } ?>
            </form>
        </div>
        <!-- Enlace para modificar datos -->
        <div class="link-container">
            <a href="modifica.php" class="btn btn-secondary">Modificar Datos</a>
        </div>
    </div>
</body>
</html>
