<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Preparar la consulta para la vista de FIDE_DETALLES_CLIENTES_V
$query_select_clientes = 'SELECT * FROM FIDE_DETALLES_CLIENTES_V';
$stmt_select_clientes = $conexion->prepare($query_select_clientes);

try {
    // Ejecutar la consulta
    $stmt_select_clientes->execute();
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
    exit();
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
    } catch (PDOException $e) {
        echo "Error al actualizar el cliente: " . $e->getMessage();
    }
    
    Desconectar($conexion);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_cliente = $_POST['id_cliente'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $imagen = $_POST['imagen'];
    $rol = $_POST['rol'];
    $pass = $_POST['pass'];
    actualizarCliente($id_cliente, $nombre, $apellido, $email, $telefono, $direccion, $imagen, $rol, $pass);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
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
        align-items: center; /* Centra todos los elementos en el contenedor */
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
        text-align: center; /* Centra el texto dentro de la tarjeta */
    }
    .product img {
        max-width: 120px;
        height: 120px;
        border-radius: 50%;
        border: 5px solid #3498db;
        object-fit: cover;
        margin-bottom: 1rem;
        transition: transform 0.3s ease-in-out; /* Efecto de transición en hover */
        display: block; /* Asegura que el margin-bottom se aplique correctamente */
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
    .edit-form {
        margin-top: 20px;
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
    <h1><a href="index.php" style="text-decoration: none; color: #000000;">Clientes</a></h1>
</header>

<div class="container">
    <?php
    while ($row = $stmt_select_clientes->fetch(PDO::FETCH_ASSOC)) {
        echo '<div class="product">';
        echo '<h3>' . htmlspecialchars($row['V_NOMBRE_CLIENTE']) .' ' . htmlspecialchars($row['V_APELLIDO_CLIENTE']) . '</h3>'; 
        echo '<p>Correo electrónico: ' . htmlspecialchars($row['V_EMAIL']) . '</p>';
        echo '<p>Número telefónico: ' . htmlspecialchars($row['V_TELEFONO']) . '</p>';
        echo '<p>Dirección: ' . htmlspecialchars(stream_get_contents($row['V_DIRECCION'])) . '</p>';

        // Mostrar la imagen usando el formato solicitado
        $imagen = htmlspecialchars($row['V_IMAGEN'] ?? 'placeholder.jpg');
        $nombre_cliente = htmlspecialchars($row['V_NOMBRE_CLIENTE'] ?? 'Imagen del cliente');
        echo '<img src="' . $imagen . '" alt="' . $nombre_cliente . '">';

        echo '<a href="edit_cliente_ADM.php?id_cliente=' . htmlspecialchars($row['V_ID_CLIENTE']) . '" class="btn btn-primary">Editar</a>';
        echo '</div>';
    }
    ?>

    

</body>
</html>
