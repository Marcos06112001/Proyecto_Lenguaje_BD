<?php
include '../DAL/conexion.php'; // Incluye el archivo de conexión

function obtenerDatos() {
    $conexion = Conecta(); // Obtiene la conexión a la base de datos

    try {
        // Prepara la sentencia SQL para seleccionar todos los registros
        $sql = "SELECT V_ID_DESCRIPCION, V_DESCRIPCION FROM FIDE_DESCRIPCION_TB";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();

        // Obtiene todos los resultados
        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $resultados = [];
        $error = "Error al obtener los datos: " . $e->getMessage();
    } finally {
        Desconectar($conexion); // Desconecta la base de datos
    }

    return $resultados ?? [];
}

$data = obtenerDatos();

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos de Descripción</title>
    <link rel="stylesheet" href="/CSS/descripciones.css">
    </head>
<body>
    <div class="container">
        <header>
            <img src="path/to/your/image.jpg" alt="Descripción de la Imagen" class="full-width-image">
            <h1>Datos de Descripción</h1>
        </header>
        <main>
            <table>
                <thead>
                    <tr>
                        <th>ID Descripción</th>
                        <th>Descripción</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (isset($data) && !empty($data)): ?>
                        <?php foreach ($data as $fila): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($fila['V_ID_DESCRIPCION']); ?></td>
                                <td><?php echo htmlspecialchars($fila['V_DESCRIPCION']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="2" class="no-data">No se encontraron datos.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>