<?php
include '../DAL/conexion.php';
session_start();

if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'administrador') {
    header('Location: index.php');
    exit;
}

$id_producto = isset($_GET['id_producto']) ? (int)$_GET['id_producto'] : 0;

function obtenerProducto($id_producto) {
    $conexion = Conecta();
    
    $sql = "SELECT V_ID_PRODUCTO, V_NOMBRE_PRODUCTO, V_DESCRIPCION_PRODUCTO, V_PRECIO, V_IMAGEN, V_ID_CATEGORIA, V_ID_ESTADO 
            FROM FIDE_PRODUCTOS_TB 
            WHERE V_ID_PRODUCTO = :id_producto";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_producto', $id_producto, PDO::PARAM_INT);
        $stmt->execute();
        $producto = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error al obtener producto: " . $e->getMessage();
        $producto = [];
    }
    
    Desconectar($conexion);
    
    return $producto;
}

function obtenerCategorias() {
    $conexion = Conecta();
    
    $sql = "SELECT V_ID_CATEGORIA, V_NOMBRE_CATEGORIA FROM FIDE_CATEGORIAS_TB";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        $categorias = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error al obtener categorías: " . $e->getMessage();
        $categorias = [];
    }
    
    Desconectar($conexion);
    
    return $categorias;
}

function actualizarProducto($id_producto, $nombre_producto, $descripcion_producto, $precio, $id_categoria, $id_estado, $imagen) {
    $conexion = Conecta();
    $sql = "BEGIN FIDE_PRODUCTOS_ACTUALIZAR_SP(:P_id_producto, :P_id_categoria, :P_id_estado, :P_nombre_producto, :P_descripcion_producto, :P_precio, :P_imagen); END;";

    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':P_id_producto', $id_producto, PDO::PARAM_INT);
        $stmt->bindParam(':P_id_categoria', $id_categoria, PDO::PARAM_INT);
        $stmt->bindParam(':P_id_estado', $id_estado, PDO::PARAM_INT);
        $stmt->bindParam(':P_nombre_producto', $nombre_producto, PDO::PARAM_STR);
        $stmt->bindParam(':P_descripcion_producto', $descripcion_producto, PDO::PARAM_STR);
        $stmt->bindParam(':P_precio', $precio, PDO::PARAM_STR);
        $stmt->bindParam(':P_imagen', $imagen, PDO::PARAM_STR);
        $stmt->execute();
        $mensaje = "Producto actualizado con éxito.";
        $success = true; // Indicar que la actualización fue exitosa
    } catch (PDOException $e) {
        $mensaje = "Error al actualizar el producto: " . $e->getMessage();
        $success = false; // Indicar que hubo un error
    }
    Desconectar($conexion);

    return ['mensaje' => $mensaje, 'success' => $success];
}

$producto = obtenerProducto($id_producto);
$categorias = obtenerCategorias();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre_producto = isset($_POST['nombre_producto']) ? $_POST['nombre_producto'] : '';
    $descripcion_producto = isset($_POST['descripcion_producto']) ? $_POST['descripcion_producto'] : '';
    $precio = isset($_POST['precio']) ? (float)$_POST['precio'] : 0.0;
    $id_categoria = isset($_POST['id_categoria']) ? (int)$_POST['id_categoria'] : 0;
    $id_estado = isset($_POST['id_estado']) ? (int)$_POST['id_estado'] : 0;

    $imagen = isset($_POST['imagen_url']) ? $_POST['imagen_url'] : $producto['V_IMAGEN'];

    $resultado = actualizarProducto($id_producto, $nombre_producto, $descripcion_producto, $precio, $id_categoria, $id_estado, $imagen);
    $mensaje = $resultado['mensaje'];
    
    if ($resultado['success']) {
        header('Location: productos_ADM.php');
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Producto</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 24px;
            color: #333;
        }

        .header a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        .header a:hover {
            text-decoration: underline;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }

        input[type="text"],
        textarea,
        select {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="file"] {
            margin-bottom: 20px;
        }

        input[type="submit"] {
            padding: 12px 20px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        p {
            font-size: 16px;
            color: #666;
        }

        p.success {
            color: #28a745;
        }

        p.error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <a href="productos_ADM.php">Volver a Productos</a>
            <h1>Modificar Producto</h1>
        </header>
        <main>
            <?php if (isset($mensaje)): ?>
                <p class="<?php echo strpos($mensaje, 'Error') !== false ? 'error' : 'success'; ?>">
                    <?php echo htmlspecialchars($mensaje); ?>
                </p>
            <?php endif; ?>

            <?php if ($producto): ?>
                <form action="modificar_producto_ADM.php?id_producto=<?php echo htmlspecialchars($producto['V_ID_PRODUCTO']); ?>" method="POST">
                    <input type="hidden" name="id_producto" value="<?php echo htmlspecialchars($producto['V_ID_PRODUCTO']); ?>">
                    
                    <label for="nombre_producto">Nombre:</label>
                    <input type="text" id="nombre_producto" name="nombre_producto" value="<?php echo htmlspecialchars($producto['V_NOMBRE_PRODUCTO']); ?>" required>

                    <label for="descripcion_producto">Descripción:</label>
                    <textarea id="descripcion_producto" name="descripcion_producto" rows="4" required><?php echo htmlspecialchars($producto['V_DESCRIPCION_PRODUCTO']); ?></textarea>

                    <label for="precio">Precio:</label>
                    <input type="text" id="precio" name="precio" value="<?php echo htmlspecialchars($producto['V_PRECIO']); ?>" required>

                    <label for="id_categoria">Categoría:</label>
                    <select id="id_categoria" name="id_categoria" required>
                        <?php foreach ($categorias as $categoria): ?>
                            <option value="<?php echo htmlspecialchars($categoria['V_ID_CATEGORIA']); ?>" <?php echo $producto['V_ID_CATEGORIA'] == $categoria['V_ID_CATEGORIA'] ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($categoria['V_NOMBRE_CATEGORIA']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>

                    <label for="id_estado">Estado:</label>
                    <select id="id_estado" name="id_estado" required>
                        <option value="1" <?php echo $producto['V_ID_ESTADO'] == 1 ? 'selected' : ''; ?>>Activo</option>
                        <option value="2" <?php echo $producto['V_ID_ESTADO'] == 2 ? 'selected' : ''; ?>>Inactivo</option>
                    </select>

                    <label for="imagen_url">Imagen URL:</label>
                    <input type="text" id="imagen_url" name="imagen_url" value="<?php echo htmlspecialchars($producto['V_IMAGEN']); ?>">

                    <input type="submit" value="Actualizar Producto">
                </form>
            <?php else: ?>
                <p>Producto no encontrado.</p>
            <?php endif; ?>
        </main>
    </div>
</body>
</html>
