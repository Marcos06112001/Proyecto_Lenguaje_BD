<?php
include '../DAL/conexion.php';
session_start(); // Inicia la sesión para acceder a la variable $_SESSION

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

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .add-product-btn {
            display: <?php echo $is_admin ? 'inline-block' : 'none'; ?>;
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #28a745;
            border-radius: 4px;
            text-decoration: none;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }

        .add-product-btn:hover {
            background-color: #218838;
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
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-card img {
            width: 100%;
            height: 200px; 
            object-fit: cover; 
            display: block;
        }

        .card-content {
            padding: 10px;
            flex-grow: 1;
            position: relative; 
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
            margin-top: auto; 
            text-align: right;
            margin-bottom: 10px; 
        }

        .buy-button {
            display: block;
            padding: 8px 12px; 
            font-size: 0.9rem; 
            color: #fff;
            background-color: #28a745;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            margin-top: 10px;
            transition: background-color 0.3s;
            cursor: pointer;
            position: absolute;
            bottom: 10px; 
            left: 10px; 
            width: 50%; 
            text-align: center;
        }

        .buy-button:hover {
            background-color: #218838;
        }

        .footer {
            background-color: #04022d;
            color: #fff;
            padding: 10px 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Productos</h1>
        <a href="carrito.php" class="button">Ir al Carrito</a>
    </div>
    
    <div class="container">
        <div class="category-form">
            <form method="GET" action="productos.php">
                <div class="select-container">
                    <select name="id_categoria" onchange="this.form.submit()">
                        <option value="">Selecciona una categoría</option>
                        <?php foreach ($categorias as $categoria): ?>
                            <option value="<?php echo $categoria['V_ID_CATEGORIA']; ?>" <?php echo $categoria['V_ID_CATEGORIA'] == $id_categoria ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($categoria['V_NOMBRE_CATEGORIA']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </form>
        </div>

        <div class="products-section">
            <h2>Productos Disponibles</h2>
            <div class="products-grid">
                <?php foreach ($productos as $producto): ?>
                    <div class="product-card">
                        <img src="<?php echo htmlspecialchars($producto['V_IMAGEN']); ?>" alt="<?php echo htmlspecialchars($producto['V_NOMBRE_PRODUCTO']); ?>">
                        <div class="card-content">
                            <h3><?php echo htmlspecialchars($producto['V_NOMBRE_PRODUCTO']); ?></h3>
                            <p><?php echo htmlspecialchars($producto['V_DESCRIPCION_PRODUCTO']); ?></p>
                            <div class="price">$<?php echo number_format($producto['V_PRECIO'], 2); ?></div>
                            <a href="agregar_al_carrito.php?id_producto=<?php echo $producto['V_ID_PRODUCTO']; ?>" class="buy-button">Agregar al Carrito</a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 Tu Empresa</p>
    </div>
</body>
</html>
