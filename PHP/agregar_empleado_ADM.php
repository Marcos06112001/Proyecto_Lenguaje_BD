<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Obtener los estados para el campo select
$query_select_estados = 'SELECT * FROM FIDE_ESTADOS_TB';
$stmt_select_estados = $conexion->prepare($query_select_estados);
$stmt_select_estados->execute();

// Insertar empleado
function insertarEmpleado($conexion, $id_estado, $nombre, $apellido, $email, $telefono, $direccion, $imagen) {
    $sql = "BEGIN FIDE_EMPLEADOS_INSERTAR_SP(:id_estado, :nombre, :apellido, :email, :telefono, :direccion, :imagen); END;";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_estado', $id_estado, PDO::PARAM_INT);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->bindParam(':apellido', $apellido, PDO::PARAM_STR);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->bindParam(':telefono', $telefono, PDO::PARAM_STR);
        $stmt->bindParam(':direccion', $direccion, PDO::PARAM_STR);
        $stmt->bindParam(':imagen', $imagen, PDO::PARAM_STR);
        $stmt->execute();
        
        return true; // Indicar que la inserción fue exitosa
    } catch (PDOException $e) {
        echo "Error al insertar el empleado: " . $e->getMessage();
        return false; // Indicar que hubo un error
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_estado = $_POST['id_estado'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $imagen = $_POST['imagen'];
    
    if (insertarEmpleado($conexion, $id_estado, $nombre, $apellido, $email, $telefono, $direccion, $imagen)) {
        header("Location: empleados_ADM.php"); // Redirigir a la página de empleados
        exit(); // Terminar el script después de redirigir
    }
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Empleado</title>
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
        .form-group label {
            font-weight: bold;
        }
        .form-group select,
        .form-group input {
            width: 100%;
        }
    </style>
</head>
<body>

<header>
    <h1>Agregar Nuevo Empleado</h1>
    <a href="empleados_ADM.php" class="return-btn">Volver</a>
</header>

<div class="container">
    <form action="agregar_empleado_ADM.php" method="POST">
        <div class="form-group">
            <label for="id_estado">Estado:</label>
            <select name="id_estado" id="id_estado" class="form-control" required>
                <?php
                while ($estado = $stmt_select_estados->fetch(PDO::FETCH_ASSOC)) {
                    echo '<option value="' . htmlspecialchars($estado['V_ID_ESTADO']) . '">' . htmlspecialchars($estado['V_DESCRIPCION']) . '</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" id="apellido" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Correo Electrónico:</label>
            <input type="email" name="email" id="email" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="telefono">Número Telefónico:</label>
            <input type="text" name="telefono" id="telefono" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="direccion">Dirección:</label>
            <input type="text" name="direccion" id="direccion" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="imagen">Imagen URL:</label>
            <input type="text" name="imagen" id="imagen" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Agregar Empleado</button>
    </form>
</div>

</body>
</html>
