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
    } catch (PDOException $e) {
        $mensaje = "Error al actualizar el producto: " . $e->getMessage();
    }
    Desconectar($conexion);

    return $mensaje;
}

$producto = obtenerProducto($id_producto);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre_producto = isset($_POST['nombre_producto']) ? $_POST['nombre_producto'] : '';
    $descripcion_producto = isset($_POST['descripcion_producto']) ? $_POST['descripcion_producto'] : '';
    $precio = isset($_POST['precio']) ? (float)$_POST['precio'] : 0.0;
    $id_categoria = isset($_POST['id_categoria']) ? (int)$_POST['id_categoria'] : 0;
    $id_estado = isset($_POST['id_estado']) ? (int)$_POST['id_estado'] : 0;

    // Manejo de la subida de archivos
    $imagen = '';
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $imagen = basename($_FILES['imagen']['name']);
        $upload_dir = '../uploads/';
        $upload_file = $upload_dir . $imagen;

        if (move_uploaded_file($_FILES['imagen']['tmp_name'], $upload_file)) {
            // Archivo subido exitosamente
        } else {
            $mensaje = "Error al subir la imagen.";
        }
    } else {
        // Usar la imagen existente si no se subió un nuevo archivo
        $imagen = $producto['V_IMAGEN'];
    }

    // Llamar a la función para actualizar el producto
    $mensaje = actualizarProducto($id_producto, $nombre_producto, $descripcion_producto, $precio, $id_categoria, $id_estado, $imagen);
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Producto</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/CSS/productos.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Modificar Producto</h1>
        </header>
        <main>
            <?php if (isset($mensaje)): ?>
                <p><?php echo htmlspecialchars($mensaje); ?></p>
            <?php endif; ?>

            <?php if ($producto): ?>
                <form action="modificar_producto_ADM.php?id_producto=<?php echo htmlspecialchars($producto['V_ID_PRODUCTO']); ?>" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id_producto" value="<?php echo htmlspecialchars($producto['V_ID_PRODUCTO']); ?>">
                    
                    <label for="nombre_producto">Nombre:</label>
                    <input type="text" id="nombre_producto" name="nombre_producto" value="<?php echo htmlspecialchars($producto['V_NOMBRE_PRODUCTO']); ?>" required>
                    
                    <label for="descripcion_producto">Descripción:</label>
                    <textarea id="descripcion_producto" name="descripcion_producto" required><?php echo htmlspecialchars($producto['V_DESCRIPCION_PRODUCTO']); ?></textarea>
                    
                    <label for="precio">Precio:</label>
                    <input type="text" id="precio" name="precio" value="<?php echo htmlspecialchars($producto['V_PRECIO']); ?>" required>
                    
                    <label for="id_categoria">Categoría:</label>
                    <input type="text" id="id_categoria" name="id_categoria" value="<?php echo htmlspecialchars($producto['V_ID_CATEGORIA']); ?>" required>
                    
                    <label for="id_estado">Estado:</label>
                    <input type="text" id="id_estado" name="id_estado" value="<?php echo htmlspecialchars($producto['V_ID_ESTADO']); ?>" required>
                    
                    <label for="imagen">Imagen:</label>
                    <input type="file" id="imagen" name="imagen">
                    
                    <input type="submit" value="Guardar cambios">
                </form>
            <?php else: ?>
                <p>Producto no encontrado.</p>
            <?php endif; ?>
        </main>
    </div>
</body>
</html>