<?php
include '../DAL/conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre_categoria = $_POST['nombre_categoria'];
    
    $conexion = Conecta();
    
    $sql = "BEGIN FIDE_CATEGORIAS_INSERTAR_SP(:nombre_categoria); END;";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':nombre_categoria', $nombre_categoria, PDO::PARAM_STR);
        $stmt->execute();

        // Redirigir a la página de categorías después de insertar
        header("Location: categorias_ADM.php");
        exit;
    } catch (PDOException $e) {
        echo "Error al agregar la categoría: " . $e->getMessage();
    }
    
    Desconectar($conexion);
}
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Categoría</title>
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
            max-width: 400px;
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

        input[type="text"] {
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
        <h1>Agregar Categoría</h1>
        <form action="agregar_categoria.php" method="POST">
            <label for="nombre_categoria">Nombre de la Categoría:</label>
            <input type="text" name="nombre_categoria" id="nombre_categoria" required>
            <input href="categorias.php" type="submit" value="Agregar Categoría">
        </form>
        <a href="categorias_ADM.php" class="back-link">Volver a Categorías</a>
    </div>
</body>
</html>