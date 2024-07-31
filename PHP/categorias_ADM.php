<?php
include '../DAL/conexion.php';

// Obtiene las categorías para el formulario de selección
function obtenerCategorias() {
    $conexion = Conecta();
    
    $sql = "SELECT * FROM FIDE_SELECT_CATEGORIAS_V";
    
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

// Actualiza el nombre de la categoría
function actualizarNombreCategoria($id_categoria, $nuevo_nombre) {
    $conexion = Conecta();
    
    $sql = "BEGIN FIDE_CATEGORIAS_ACTUALIZAR_NOMBRE_SP(:id_categoria, :nuevo_nombre); END;";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_categoria', $id_categoria, PDO::PARAM_INT);
        $stmt->bindParam(':nuevo_nombre', $nuevo_nombre, PDO::PARAM_STR);
        $stmt->execute();
    } catch (PDOException $e) {
        echo "Error al actualizar la categoría: " . $e->getMessage();
    }
    
    Desconectar($conexion);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_categoria = $_POST['id_categoria'];
    $nuevo_nombre = $_POST['nuevo_nombre'];
    actualizarNombreCategoria($id_categoria, $nuevo_nombre);
}

$categorias = obtenerCategorias();
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

        .categories-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .category-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: calc(25% - 20px);
            box-sizing: border-box;
            text-align: center;
            padding: 20px;
            transition: transform 0.3s;
        }

        .category-card:hover {
            transform: translateY(-5px);
        }

        .category-card h3 {
            margin: 0 0 10px;
            font-size: 1.2rem;
        }

        .edit-form {
            margin-top: 20px;
        }

        .edit-form input[type="text"] {
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
    <div class="container">
        <header class="header">
            <h1>Categorias</h1>
            <a href="index.php" class="button">Menú</a>
        </header>
        <main>
            <div class="categories-grid">
                <?php if (!empty($categorias)): ?>
                    <?php foreach ($categorias as $categoria): ?>
                        <div class="category-card">
                            <h3><?php echo htmlspecialchars($categoria['V_NOMBRE_CATEGORIA']); ?></h3>
                            <a href="productos.php?id_categoria=<?php echo htmlspecialchars($categoria['V_ID_CATEGORIA']); ?>" class="button">Ver Productos</a>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p>No se encontraron categorías.</p>
                <?php endif; ?>
            </div>
            <div class="edit-form">
                <form action="" method="POST">
                    <label for="id_categoria">ID Categoría:</label>
                    <input type="text" name="id_categoria" id="id_categoria" required>
                    <label for="nuevo_nombre">Nuevo Nombre:</label>
                    <input type="text" name="nuevo_nombre" id="nuevo_nombre" required>
                    <input type="submit" value="Actualizar Nombre">
                </form>
            </div>
        </main>
    </div>
</body>
</html>
