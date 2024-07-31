<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Obtener el ID del cliente desde la URL
$id_cliente = isset($_GET['id_cliente']) ? intval($_GET['id_cliente']) : 0;

// Si no se proporciona un ID válido, redirigir a la página de clientes
if ($id_cliente <= 0) {
    header('Location: clientes.php');
    exit();
}

// Obtener la información del cliente
$query_cliente = 'SELECT * FROM FIDE_DETALLES_CLIENTES_V WHERE V_ID_CLIENTE = :id_cliente';
$stmt_cliente = $conexion->prepare($query_cliente);
$stmt_cliente->bindParam(':id_cliente', $id_cliente, PDO::PARAM_INT);

try {
    $stmt_cliente->execute();
    $cliente = $stmt_cliente->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
    exit();
}

// Si el cliente no se encuentra, redirigir a la página de clientes
if (!$cliente) {
    header('Location: clientes.php');
    exit();
}

// Convertir el CLOB a cadena
$direccion = '';
if (isset($cliente['V_DIRECCION']) && is_resource($cliente['V_DIRECCION'])) {
    $direccion = stream_get_contents($cliente['V_DIRECCION']);
}

// Actualiza la información del cliente
function actualizarCliente($id_cliente, $nombre, $apellido, $email, $telefono, $direccion, $imagen, $rol, $pass) {
    $conexion = Conecta();
    
    $sql = "BEGIN FIDE_CLIENTES_ACTUALIZAR_SP(:id_cliente, :nombre, :apellido, :email, :telefono, :direccion, :imagen, :rol, :pass); END;";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_cliente', $id_cliente, PDO::PARAM_INT);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->bindParam(':apellido', $apellido, PDO::PARAM_STR);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->bindParam(':telefono', $telefono, PDO::PARAM_STR);
        $stmt->bindParam(':direccion', $direccion, PDO::PARAM_STR);
        $stmt->bindParam(':imagen', $imagen, PDO::PARAM_STR);
        $stmt->bindParam(':rol', $rol, PDO::PARAM_STR);
        $stmt->bindParam(':pass', $pass, PDO::PARAM_STR);
        $stmt->execute();
        echo "Cliente actualizado correctamente.";
    } catch (PDOException $e) {
        echo "Error al actualizar el cliente: " . $e->getMessage();
    }
    
    Desconectar($conexion);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $imagen = $_POST['imagen'];
    $rol = $_POST['rol'];
    $pass = $_POST['pass'];
    actualizarCliente($id_cliente, $nombre, $apellido, $email, $telefono, $direccion, $imagen, $rol, $pass);
    // Redirigir de vuelta a la página de clientes después de actualizar
    header('Location: clientes_ADM.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Cliente</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 1rem;
        }
        header {
            background-color: #ffffff;
            padding: 1rem;
            text-align: center;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            margin: 0;
            color: #333;
        }
        .return-btn {
            display: inline-block;
            margin-top: 0.5rem;
            color: #007bff;
            text-decoration: none;
            font-size: 0.9rem;
        }
        .container {
            max-width: 600px;
            margin: auto;
        }
        .edit-form input[type="text"],
        .edit-form input[type="email"],
        .edit-form input[type="tel"],
        .edit-form textarea {
            padding: 10px;
            width: calc(100% - 22px);
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .edit-form input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .edit-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<header>
    <h1>Editar Cliente</h1>
    <a href="clientes_ADM.php" class="return-btn">Volver</a>
</header>

<div class="container">
    <div class="edit-form">
        <form action="" method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" value="<?php echo htmlspecialchars($cliente['V_NOMBRE_CLIENTE'] ?? ''); ?>" required>
            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" id="apellido" value="<?php echo htmlspecialchars($cliente['V_APELLIDO_CLIENTE'] ?? ''); ?>" required>
            <label for="email">Correo electrónico:</label>
            <input type="email" name="email" id="email" value="<?php echo htmlspecialchars($cliente['V_EMAIL'] ?? ''); ?>" required>
            <label for="telefono">Número telefónico:</label>
            <input type="tel" name="telefono" id="telefono" value="<?php echo htmlspecialchars($cliente['V_TELEFONO'] ?? ''); ?>" required>
            <label for="direccion">Dirección:</label>
            <textarea name="direccion" id="direccion" required><?php echo htmlspecialchars($direccion ?? ''); ?></textarea>
            <label for="imagen">Imagen:</label>
            <input type="text" name="imagen" id="imagen" value="<?php echo htmlspecialchars($cliente['V_IMAGEN'] ?? ''); ?>" required>
            <label for="rol">Rol:</label>
            <input type="text" name="rol" id="rol" value="<?php echo htmlspecialchars($cliente['V_ROL'] ?? ''); ?>" required>
            <label for="pass">Contraseña:</label>
            <input type="text" name="pass" id="pass" value="<?php echo htmlspecialchars($cliente['V_PASS'] ?? ''); ?>" required>
            <input type="submit" value="Actualizar Cliente">
        </form>
    </div>
</div>

</body>
</html>
