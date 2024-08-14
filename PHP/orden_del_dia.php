<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

$id_evento = isset($_POST['id_evento']) ? $_POST['id_evento'] : null;
$descripcion_evento = '';

if ($id_evento !== null) {
    // Preparar la llamada a la función
    $query_select_evento = 'SELECT FIDE_ORDEN_SELECT_FN(:id_evento) AS descripcion_evento FROM dual';
    $stmt_select_evento = $conexion->prepare($query_select_evento);

    try {
        // Vincular el parámetro
        $stmt_select_evento->bindParam(':id_evento', $id_evento, PDO::PARAM_INT);
        $stmt_select_evento->execute();

        // Obtener el resultado
        $resultado = $stmt_select_evento->fetch(PDO::FETCH_ASSOC);

   

        if ($resultado) {
            $descripcion_evento = $resultado['DESCRIPCION_EVENTO']; // Ajuste aquí
        } else {
            $descripcion_evento = "No se encontró el evento.";
        }
    } catch (PDOException $e) {
        $descripcion_evento = "Error al ejecutar la consulta: " . $e->getMessage();
    }

    // Desconectar
    Desconectar($conexion);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Evento</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .header {
            text-align: center;
            padding: 20px 0;
            font-size: 28px;
            color: #444;
        }
        .form-container {
            text-align: center;
        }
        .form-container input, .form-container button {
            width: calc(100% - 20px);
            margin: 10px;
            padding: 10px;
            font-size: 16px;
        }
        .form-container button {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #218838;
        }
        .result-container {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">Buscar Evento</div>
        <div class="form-container">
            <form action="orden_del_dia.php" method="POST">
                <input type="number" id="id_evento" name="id_evento" placeholder="Ingrese ID del Evento" required>
                <button type="submit">Buscar Evento</button>
                <a href="index.php" class="return-btn">Menú</a>
            </form>
        </div>
        <div class="result-container">
            <?php if ($descripcion_evento !== ''): ?>
                <div class="card">
                    <?php echo htmlspecialchars($descripcion_evento, ENT_QUOTES, 'UTF-8'); ?>
                </div>
            <?php else: ?>
                <div class="card">
                    No se encontró el evento.
                </div>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>