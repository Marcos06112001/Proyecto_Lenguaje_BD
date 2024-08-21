<?php
include '../DAL/conexion.php';
session_start();

// Verifica si el usuario es administrador
$is_admin = isset($_SESSION['rol']) && $_SESSION['rol'] === 'administrador';

if (!$is_admin) {
    header("Location: index.php"); // Redirige si no es administrador
    exit;
}

// Manejo del formulario de adición de producto
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre_producto = $_POST['nombre_producto'] ?? '';
    $descripcion_producto = $_POST['descripcion_producto'] ?? '';
    $precio = $_POST['precio'] ?? '';
    $id_categoria = $_POST['id_categoria'] ?? '';
    $id_estado = $_POST['id_estado'] ?? '';
    $imagen = $_POST['imagen'] ?? '';

    // Validar datos
    if (!empty($nombre_producto) && !empty($descripcion_producto) && !empty($precio) && !empty($id_categoria) && !empty($id_estado)) {
        $conexion = Conecta();
        
        // Imagen puede ser una URL proporcionada
        $imagen_path = !empty($imagen) ? $imagen : 'placeholder.jpg'; // Imagen por defecto

        $sql = "BEGIN FIDE_AGREGAR_PRODUCTO_SP(:p_id_categoria, :p_id_estado, :p_nombre_producto, :p_descripcion_producto, :p_precio, :p_imagen); END;";
        
        try {
            $stmt = $conexion->prepare($sql);
            $stmt->bindParam(':p_id_categoria', $id_categoria, PDO::PARAM_INT);
            $stmt->bindParam(':p_id_estado', $id_estado, PDO::PARAM_INT);
            $stmt->bindParam(':p_nombre_producto', $nombre_producto, PDO::PARAM_STR);
            $stmt->bindParam(':p_descripcion_producto', $descripcion_producto, PDO::PARAM_STR);
            $stmt->bindParam(':p_precio', $precio, PDO::PARAM_STR);
            $stmt->bindParam(':p_imagen', $imagen_path, PDO::PARAM_STR);
            
            $stmt->execute();
            
            // Redirige a la página de productos después de la inserción
            header("Location: productos_ADM.php");
            exit;
        } catch (PDOException $e) {
            echo "Error al agregar producto: " . $e->getMessage();
        }
        
        Desconectar($conexion);
    } else {
        echo "Todos los campos son obligatorios.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Producto</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/CSS/productos.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h1 {
            margin-top: 0;
            font-size: 2rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group button {
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1>Agregar Producto</h1>
            <form action="agregar_producto_ADM.php" method="POST">
                <div class="form-group">
                    <label for="nombre_producto">Nombre del Producto:</label>
                    <input type="text" name="nombre_producto" id="nombre_producto" required>
                </div>
                <div class="form-group">
                    <label for="descripcion_producto">Descripción del Producto:</label>
                    <input type="text" name="descripcion_producto" id="descripcion_producto" required>
                </div>
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" name="precio" id="precio" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="id_categoria">Categoría:</label>
                    <select name="id_categoria" id="id_categoria" required>
                        <?php
                        // Obtener categorías para el select
                        $conexion = Conecta();
                        $sql = "SELECT V_ID_CATEGORIA, V_NOMBRE_CATEGORIA FROM FIDE_CATEGORIAS_TB";
                        $stmt = $conexion->prepare($sql);
                        $stmt->execute();
                        $categorias = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        Desconectar($conexion);

                        foreach ($categorias as $categoria) {
                            echo '<option value="' . htmlspecialchars($categoria['V_ID_CATEGORIA']) . '">' . htmlspecialchars($categoria['V_NOMBRE_CATEGORIA']) . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="id_estado">Estado:</label>
                    <select name="id_estado" id="id_estado" required>
                        <option value="1">Activo</option>
                        <option value="2">Inactivo</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="imagen">Enlace de Imagen:</label>
                    <input type="text" name="imagen" id="imagen" placeholder="">
                </div>
                <div class="form-group">
                    <button type="submit">Agregar Producto</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
