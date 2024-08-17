<?php
include '../DAL/conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_estado = $_POST['id_estado'];
    $nombre_promocion = $_POST['nombre_promocion'];
    $descripcion_promocion = $_POST['descripcion_promocion'];
    $fecha_inicio = $_POST['fecha_inicio'];
    $fecha_fin = $_POST['fecha_fin'];
    $descuento = $_POST['descuento'];
    
    $conexion = Conecta();
    
    // Asegúrate de que las fechas están en el formato correcto
    $fecha_inicio = date('Y-m-d', strtotime($fecha_inicio));
    $fecha_fin = date('Y-m-d', strtotime($fecha_fin));
    
    $sql = "BEGIN FIDE_PROMOCIONES_INSERTAR_SP(:id_estado, :nombre_promocion, :descripcion_promocion, TO_DATE(:fecha_inicio, 'YYYY-MM-DD'), TO_DATE(:fecha_fin, 'YYYY-MM-DD'), :descuento); END;";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_estado', $id_estado, PDO::PARAM_INT);
        $stmt->bindParam(':nombre_promocion', $nombre_promocion, PDO::PARAM_STR);
        $stmt->bindParam(':descripcion_promocion', $descripcion_promocion, PDO::PARAM_STR);
        $stmt->bindParam(':fecha_inicio', $fecha_inicio, PDO::PARAM_STR);
        $stmt->bindParam(':fecha_fin', $fecha_fin, PDO::PARAM_STR);
        $stmt->bindParam(':descuento', $descuento, PDO::PARAM_INT);
        $stmt->execute();
        
        header("Location: promociones_ADM.php");
    } catch (PDOException $e) {
        echo "Error al agregar la promoción: " . $e->getMessage();
    }
    
    Desconectar($conexion);
}

// Obtener estados para el menú desplegable
$conexion = Conecta();
$query_select_estados = 'SELECT V_ID_ESTADO, V_DESCRIPCION FROM FIDE_ESTADOS_TB';
$stmt_select_estados = $conexion->prepare($query_select_estados);
$stmt_select_estados->execute();
$estados = $stmt_select_estados->fetchAll(PDO::FETCH_ASSOC);
Desconectar($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Promoción</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"], input[type="number"], input[type="date"], select {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #007bff;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Agregar Promoción</h1>
        <form action="agregar_promocion.php" method="POST">
            <label for="id_estado">Estado:</label>
            <select name="id_estado" id="id_estado" class="form-control" required>
                <?php
                foreach ($estados as $estado) {
                    echo '<option value="' . htmlspecialchars($estado['V_ID_ESTADO']) . '">' . htmlspecialchars($estado['V_DESCRIPCION']) . '</option>';
                }
                ?>
            </select>

            <label for="nombre_promocion">Nombre de la Promoción:</label>
            <input type="text" name="nombre_promocion" id="nombre_promocion" required>

            <label for="descripcion_promocion">Descripción de la Promoción:</label>
            <input type="text" name="descripcion_promocion" id="descripcion_promocion" required>

            <label for="fecha_inicio">Fecha de Inicio:</label>
            <input type="date" name="fecha_inicio" id="fecha_inicio" required>

            <label for="fecha_fin">Fecha de Fin:</label>
            <input type="date" name="fecha_fin" id="fecha_fin" required>

            <label for="descuento">Descuento (%):</label>
            <input type="number" name="descuento" id="descuento" required>

            <input type="submit" value="Agregar Promoción">
        </form>
        <a href="promociones_ADM.php" class="back-link">Volver a Promociones</a>
    </div>
</body>
</html>
