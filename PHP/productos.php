<?php
include '../DAL/conexion.php';

function obtenerCategorias($conexion) {
    $sql = "SELECT * FROM FIDE_CATEGORIAS_TB";
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $resultados;
    } catch (PDOException $e) {
        echo "Error al obtener las categorías: " . $e->getMessage();
        return [];
    }
}

$conexion = Conecta();
$categorias = obtenerCategorias($conexion);
Desconectar($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Categoría</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/CSS/producto.css">
</head>
<body>
    <div class="container">
        <h1>Selecciona una Categoría</h1>
        <form action="productos.php" method="GET">
            <div class="select-container">
                <select name="id_categoria" id="categoriaSelect" required>
                    <option value="" disabled selected>Seleccione una categoría</option>
                    <?php if (!empty($categorias)): ?>
                        <?php foreach ($categorias as $categoria): ?>
                            <option value="<?php echo htmlspecialchars($categoria['V_ID_CATEGORIA']); ?>">
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
    </div>
</body>
</html>
