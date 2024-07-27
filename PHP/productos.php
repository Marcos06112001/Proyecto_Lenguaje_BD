<?php
include '../DAL/conexion.php';

// Obtiene las categorías para el formulario de selección
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

// Obtiene los productos basados en la categoría seleccionada
function obtenerProductos($id_categoria = null) {
    $conexion = Conecta();
    
    if ($id_categoria) {
        $sql = "SELECT V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen 
                FROM FIDE_PRODUCTOS_TB 
                WHERE V_id_categoria = :id_categoria";
        
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_categoria', $id_categoria, PDO::PARAM_INT);
    } else {
        $sql = "SELECT V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen 
                FROM FIDE_PRODUCTOS_TB";
        
        $stmt = $conexion->prepare($sql);
    }
    
    try {
        $stmt->execute();
        $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error al obtener productos: " . $e->getMessage();
        $productos = [];
    }
    
    Desconectar($conexion);
    
    return $productos;
}

$categorias = obtenerCategorias();
$id_categoria = isset($_GET['id_categoria']) ? (int)$_GET['id_categoria'] : null;
$productos = obtenerProductos($id_categoria);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seleccionar Categoría</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/CSS/producto.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Selecciona una Categoría</h1>
        </header>
        <main>
            <form action="productos.php" method="GET" class="category-form">
                <div class="select-container">
                    <select name="id_categoria" id="categoriaSelect" required>
                        <option value="" disabled selected>Seleccione una categoría</option>
                        <?php if (!empty($categorias)): ?>
                            <?php foreach ($categorias as $categoria): ?>
                                <option value="<?php echo htmlspecialchars($categoria['V_ID_CATEGORIA']); ?>" 
                                        <?php echo ($id_categoria == $categoria['V_ID_CATEGORIA']) ? 'selected' : ''; ?>>
                                    <?php echo htmlspecialchars($categoria['V_NOMBRE_CATEGORIA']); ?>
                                </option>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <option value="">No se encontraron categorías</option>
                        <?php endif; ?>
                    </select>
                </div>
                <button type="submit" class="submit-btn">Ver Productos</button>
            </form>

            <?php if ($id_categoria !== null): ?>
                <section class="products-section">
                    <h2>Productos en la Categoría Seleccionada</h2>
                    <?php if (!empty($productos)): ?>
                        <table class="products-table">
                            <thead>
                                <tr>
                                    <th>ID Producto</th>
                                    <th>ID Categoría</th>
                                    <th>ID Estado</th>
                                    <th>Nombre Producto</th>
                                    <th>Descripción Producto</th>
                                    <th>Precio</th>
                                    <th>Imagen</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($productos as $producto): ?>
                                    <tr>
                                        <?php foreach ($producto as $clave => $valor): ?>
                                            <td><?php echo htmlspecialchars($valor); ?></td>
                                        <?php endforeach; ?>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p>No se encontraron productos para esta categoría.</p>
                    <?php endif; ?>
                </section>
            <?php endif; ?>
        </main>
    </div>
</body>
</html>
