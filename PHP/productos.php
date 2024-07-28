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
        $sql = "SELECT V_NOMBRE_PRODUCTO, V_DESCRIPCION_PRODUCTO, V_PRECIO, V_IMAGEN 
                FROM FIDE_PRODUCTOS_TB 
                WHERE V_ID_CATEGORIA = :id_categoria";
        
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_categoria', $id_categoria, PDO::PARAM_INT);
    } else {
        $sql = "SELECT V_NOMBRE_PRODUCTO, V_DESCRIPCION_PRODUCTO, V_PRECIO, V_IMAGEN 
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
    <title>Productos</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/CSS/productos.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Productos</h1>
            <a href="index.php" class="button">Menú</a>
        </header>
        <main>
            <form action="productos.php" method="GET" class="category-form">
                <div class="select-container">
                    <select name="id_categoria" id="categoriaSelect" onchange="this.form.submit()">
                        <option value="">Todas las categorías</option>
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
            </form>

            <section class="products-section">
                <h2>Productos</h2>
                <?php if (!empty($productos)): ?>
                    <div class="products-grid">
                        <?php foreach ($productos as $producto): ?>
                            <div class="product-card">
                                <img src="<?php echo htmlspecialchars($producto['V_IMAGEN'] ?? 'placeholder.jpg'); ?>" alt="<?php echo htmlspecialchars($producto['V_NOMBRE_PRODUCTO'] ?? 'Imagen del producto'); ?>">
                                <div class="card-content">
                                    <h3><?php echo htmlspecialchars($producto['V_NOMBRE_PRODUCTO'] ?? 'Nombre del producto'); ?></h3>
                                    <p><?php echo htmlspecialchars($producto['V_DESCRIPCION_PRODUCTO'] ?? 'Descripción del producto'); ?></p>
                                    <div class="price"><?php echo htmlspecialchars($producto['V_PRECIO'] ?? '0.00'); ?> $</div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <p>No se encontraron productos para esta categoría.</p>
                <?php endif; ?>
            </section>
        </main>
    </div>
</body>
</html>
