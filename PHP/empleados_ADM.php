<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Preparar la consulta para la vista de FIDE_DETALLES_EMPLEADOS_V
$query_select_empleados = 'SELECT * FROM FIDE_DETALLES_EMPLEADOS_V';
$stmt_select_empleados = $conexion->prepare($query_select_empleados);

try {
    // Ejecutar la consulta
    $stmt_select_empleados->execute();
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
    exit();
}

// Actualiza la información del empleado
function actualizarEmpleado($id_empleado, $nombre, $apellido, $email, $telefono, $direccion, $imagen) {
    $conexion = Conecta();
    
    $sql = "BEGIN FIDE_EMPLEADOS_ACTUALIZAR_ADM_SP(:id_empleado, :nombre, :apellido, :email, :telefono, :direccion, :imagen; END;";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_empleado', $id_empleado, PDO::PARAM_INT);
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->bindParam(':apellido', $apellido, PDO::PARAM_STR);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->bindParam(':telefono', $telefono, PDO::PARAM_STR);
        $stmt->bindParam(':direccion', $direccion, PDO::PARAM_STR);
        $stmt->bindParam(':imagen', $imagen, PDO::PARAM_STR);
        $stmt->execute();
    } catch (PDOException $e) {
        echo "Error al actualizar el empleado: " . $e->getMessage();
    }
    
    Desconectar($conexion);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_empleado = $_POST['id_empleado'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $imagen = $_POST['imagen'];
    actualizarEmpleado($id_empleado, $nombre, $apellido, $email, $telefono, $direccion, $imagen);
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empleados</title>
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
    max-width: 1200px;
    margin: auto;
    display: flex;
    flex-wrap: wrap; /* Permite que los elementos se envuelvan en varias líneas si es necesario */
    gap: 1rem; /* Espacio entre las tarjetas */
}

.product {
    flex: 1 1 calc(25% - 1rem); /* Ajusta el tamaño de las tarjetas y el espacio entre ellas */
    display: flex;
    flex-direction: column;
    border: 1px solid #ddd;
    border-radius: 0.5rem;
    padding: 1rem;
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: box-shadow 0.3s ease-in-out; /* Efecto de transición en hover */
}

.product:hover {
    box-shadow: 0 4px 8px rgba(0,0,0,0.2); /* Sombra más grande en hover */
}

.product h3 {
    margin: 0 0 0.5rem;
    color: #333;
}

.product img {
    max-width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 5px solid #3498db;
    object-fit: cover;
    margin-bottom: 1rem;
    transition: transform 0.3s ease-in-out; /* Efecto de transición en hover */
}

.product img:hover {
    transform: scale(1.05); /* Aumenta la imagen en hover */
}

.button-container {
    display: flex;
    justify-content: flex-end; 
    margin: 20px 0; 
}

.add-product-btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff; 
    color: #fff; 
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
}

    </style>
</head>
<body>

<header>
    <h1><a href="index.php" style="text-decoration: none; color: #000000;">Empleados</a></h1>
    <br>
    <div class="button-container">
        <a href="agregar_empleado_ADM.php" class="add-product-btn">Agregar Empleado</a>
    </div>
</header>

<div class="container">
    <?php
        while ($row = $stmt_select_empleados->fetch(PDO::FETCH_ASSOC)) {
            echo '<div class="product">';
            echo '<h3>' . htmlspecialchars($row['V_NOMBRE_EMPLEADO']) .' ' . htmlspecialchars($row['V_APELLIDO_EMPLEADO']) . '</h3>'; 
            echo '<p>Correo electrónico: ' . htmlspecialchars($row['V_EMAIL']) . '</p>';
            echo '<p>Número telefónico: ' . htmlspecialchars($row['V_TELEFONO']) . '</p>';
            echo '<p>Dirección: ' . htmlspecialchars($row['V_DIRECCION']) . '</p>';

            $imagen = htmlspecialchars($row['V_IMAGEN'] ?? 'placeholder.jpg');
            $nombre_empleado = htmlspecialchars($row['V_NOMBRE_EMPLEADO'] ?? 'Imagen del empleado');
            echo '<img src="' . $imagen . '" alt="' . $nombre_empleado . '">';
            echo '<a href="edit_empleado_ADM.php?id_empleado=' . htmlspecialchars($row['V_ID_EMPLEADO']) . '" class="btn btn-primary">Editar</a>';

            echo '</div>';
        }
    ?>
</div>

</body>
</html>
