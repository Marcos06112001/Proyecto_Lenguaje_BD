<?php
include '../DAL/conexion.php'; // Conexión

function obtenerCategorias() {
    $conexion = Conecta(); // Obtiene la conexión a la base de datos

    try {
        // Prepara la sentencia SQL para seleccionar todas las categorías
        $sql = "SELECT V_CATEGORIA FROM FIDE_MOTIVOS_TB";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();

        // Obtiene todos los resultados
        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $resultados = [];
        $error = "Error al obtener las categorías: " . $e->getMessage();
    } finally {
        Desconectar($conexion); // Desconecta la base de datos
    }

    return $resultados ?? [];
}

$categorias = obtenerCategorias();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/CSS/reclamo.css">
    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
header {
    background-color: #333;
    color: #fff;
    padding: 20px 0;
    text-align: center;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
}
header h1 {
    margin: 0;
    flex: 1;
}
.return-btn {
    background-color: #007bff;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
}
.return-btn:hover {
    background-color: #0056b3;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    transform: translateY(-2px);
}
.container {
    width: 80%;
    margin: 20px auto;
}
h1 {
    text-align: center;
}
.product {
    background-color: #fff;
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
}
.product img {
    max-width: 150px;
    margin-right: 20px;
    border-radius: 5px;
}
.product h2 {
    margin-top: 0;
}
.product p {
    margin: 5px 0;
}
.price {
    color: green;
    font-weight: bold;
}
.product-icon { 
    font-size: 3rem; 
    color: red; 
}
footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
    margin-top: auto;
}
    </style>
    <title>Reclamaciones</title>
</head>
<body>
    <header>
        <h1>Reclamaciones</h1>
        <a href="index.php" class="return-btn">Menú</a>
    </header>
    <div class="container mt-5">
        <div class="reclamos-container p-4 bg-white shadow rounded">
            <h2 class="fs-4 mb-4">Formulario de Reclamo</h2>
            <form>
                <div class="mb-3">
                    <label for="name" class="form-label">Nombre Completo</label>
                    <input type="text" id="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" id="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="issue-type" class="form-label">Tipo de Reclamo</label>
                    <select id="issue-type" class="form-select" required>
                        <option value="" disabled selected>Seleccione un tipo</option>
                            <?php
                                if (isset($categorias) && !empty($categorias)) {
                                  foreach ($categorias as $categoria) {
                                    if (isset($categoria['V_CATEGORIA'])) {
                                      echo "<option value='" . htmlspecialchars($categoria['V_CATEGORIA']) . "'>" . htmlspecialchars($categoria['V_CATEGORIA']) . "</option>";
                                    } else {
                                      echo "<option value=''>Error en datos de categoría</option>";
                                     }
                                     }
                                 } else {
                                        echo "<option value=''>No hay categorías disponibles</option>";
                                 }
                             ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Descripción del Problema</label>
                    <textarea id="description" class="form-control" rows="4" required></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Enviar Reclamo</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Optional Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-7t0D7Gv2IKK5zQb6mD4ztDA7VxXq64fU66g4E6cGepV6Vm4tQ1Sgjv2Qh0ggxVoS" crossorigin="anonymous"></script>
</body>
</html>

