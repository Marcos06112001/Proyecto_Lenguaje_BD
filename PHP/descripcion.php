<?php
include '../DAL/conexion.php'; // Incluye el archivo de conexión

function obtenerDatos() {
    $conexion = Conecta(); // Obtiene la conexión a la base de datos

    try {
        // Prepara la sentencia SQL para seleccionar todos los registros
        $sql = "SELECT  V_DESCRIPCION FROM FIDE_DESCRIPCION_TB";
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
    <style>
        /* Reset básico para el diseño */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Estilo general del cuerpo */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5; /* Fondo claro */
    color: #333;
    line-height: 1.6;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Contenedor principal */
.container {
    width: 90%;
    max-width: 1200px;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px auto;
}

/* Estilo del encabezado */
header {
    text-align: center;
    margin-bottom: 20px;
}

.full-width-image {
    width: 100%;
    height: auto;
    border-radius: 8px;
    object-fit: cover;
}

h1 {
    font-size: 28px;
    color: #1e88e5; /* Azul brillante */
}

/* Estilo de la tabla */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
}

thead {
    background-color: #1e88e5; /* Azul brillante */
    color: #ffffff;
}

th, td {
    border: 1px solid #ddd; /* Gris claro */
    padding: 12px;
    text-align: left;
}

th {
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #f1f8ff; /* Azul muy claro */
}

tr:hover {
    background-color: #e3f2fd; /* Azul más claro */
}

.no-data {
    text-align: center;
    color: #ff5722; /* Naranja */
    font-style: italic;
    padding: 15px;
}

    </style>
    </head>
<body>
    <div class="container">
        <header>
            <img src="https://www.cenor.es/storage/img/C00001_F0000002133_tienda_de_electrodomesticos_cenor_en_noia_en_calle_chile_1.jpg" alt="Descripción de la Imagen" class="full-width-image">
            <h1>Datos de Descripción</h1>
        </header>
        <main>
            <table>
                <thead>
                    <tr>
                       
                        <Center><th>Descripción</th> <Center>
                    </tr>
                </thead>
                <tbody>
                    <?php if (isset($data) && !empty($data)): ?>
                        <?php foreach ($data as $fila): ?>
                            <tr>
                              
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