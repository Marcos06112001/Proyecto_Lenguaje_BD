<?php
include '../DAL/conexion.php';
session_start(); 

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
        $sql = "SELECT V_NOMBRE_PRODUCTO, V_DESCRIPCION_PRODUCTO, V_PRECIO, V_IMAGEN, V_ID_PRODUCTO
                FROM FIDE_PRODUCTOS_TB 
                WHERE V_ID_CATEGORIA = :id_categoria";
        
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_categoria', $id_categoria, PDO::PARAM_INT);
    } else {
        $sql = "SELECT V_NOMBRE_PRODUCTO, V_DESCRIPCION_PRODUCTO, V_PRECIO, V_IMAGEN, V_ID_PRODUCTO
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

// Verifica si el usuario es administrador
$is_admin = isset($_SESSION['rol']) && $_SESSION['rol'] === 'administrador';
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
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
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    .header {
        background-color: #04022d;
        color: #fff;
        padding: 10px 20px;
        display: flex;
        justify-content: space-between; 
        align-items: center;
        position: relative;
    }

    .header h1 {
        margin: 0;
        font-size: 2rem;
        text-align: center; 
        flex: 1; 
    }

    .header .button {
        position: absolute;
        right: 20px;
        top: 50%; 
        transform: translateY(-50%); 
    }

    .button-container {
    text-align: center; /* Centra el contenido dentro del contenedor */
    margin-bottom: 20px;
}

.button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 1rem;
    color: #fff;
    background-color: #28a745; /* Color verde */
    border-radius: 4px;
    text-decoration: none;
    transition: background-color 0.3s;
}

.button:hover {
    background-color: #218838; /* Verde más oscuro al pasar el ratón */
}


    .category-form {
        margin-bottom: 20px;
    }

    .select-container {
        display: flex;
        justify-content: center;
    }

    select {
        padding: 10px;
        font-size: 1rem;
        border: 1px solid #ddd;
        border-radius: 4px;
        background-color: #fff;
        cursor: pointer;
    }

    select:focus {
        border-color: #aaa;
        outline: none;
    }

    .products-section {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .products-section h2 {
        margin-top: 0;
        font-size: 1.5rem;
    }

    .products-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }

    .product-card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        width: calc(25% - 20px); 
        box-sizing: border-box;
    }

    .product-card img {
        width: 100%;
        height: auto;
        display: block;
    }

    .card-content {
        padding: 10px;
    }

    .card-content h3 {
        margin: 0 0 10px;
        font-size: 1.2rem;
    }

    .card-content p {
        margin: 0 0 10px;
        font-size: 1rem;
    }

    .price {
        font-size: 1.1rem;
        font-weight: bold;
    }

    .add-product-btn {
        display: none; /* Por defecto, no visible */
        padding: 10px 20px;
        font-size: 1rem;
        color: #fff;
        background-color: #28a745;
        border-radius: 4px;
        text-decoration: none;
        position: fixed;
        bottom: 20px; /* Posición en la parte inferior */
        right: 20px;  /* Posición desde el borde derecho */
        transition: background-color 0.3s;
    }

    .add-product-btn:hover {
        background-color: #218838;
    }

    /* Estilos específicos para botones adicionales */
    .btn-success {
        background-color: #28a745;
        color: #fff;
    }

    .btn-success:hover {
        background-color: #218838;
    }

    .btn-primary {
        background-color: #007bff;
        color: #fff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .button-container {
        margin-bottom: 20px;
    }
</style>

</head>
<body>
    <div class="container">
        <header class="header">
            <h1><a href="index.php" style="text-decoration: none; color:#f2f2f2;">Productos</a></h1>
        </header>
        <main>
            <br>
            <div class="button-container">
                <?php
                if ($is_admin) {
                    echo '<a href="agregar_producto_ADM.php" class="button" ">Agregar Producto</a>';
                }
                ?>
            </div>
            <br>
            
            <form action="productos.php" method="GET" class="category-form">
                <div class="select-container">
                
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
                                <?php
                                if ($is_admin) {
                                    echo '<div class="button-container">';
                                    echo '<a href="modificar_producto_ADM.php?id_producto=' . htmlspecialchars($producto['V_ID_PRODUCTO']) . '" class="button" >Modificar producto</a>';
                                    echo '</div>';
                                }
                                ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <p>No se encontraron productos.</p>
                <?php endif; ?>
            </section>
        </main>
    </div>
</body>
</html>