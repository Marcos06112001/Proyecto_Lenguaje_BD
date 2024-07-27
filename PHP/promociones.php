<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Verificar si los registros ya existen antes de intentar insertarlos
$query_check_estado = 'SELECT COUNT(*) FROM FIDE_ESTADOS_TB WHERE V_id_estado = :id_estado';
$stmt_check_estado = $conexion->prepare($query_check_estado);

$estados = [
    ['id' => 1, 'descripcion' => 'Activo'],
    ['id' => 2, 'descripcion' => 'Inactivo']
];

foreach ($estados as $estado) {
    $stmt_check_estado->execute([':id_estado' => $estado['id']]);
    $count = $stmt_check_estado->fetchColumn();

    if ($count == 0) {
        // Preparar la consulta de inserción para FIDE_ESTADOS_TB
        $query_insert_estado = 'INSERT INTO FIDE_ESTADOS_TB (V_id_estado, V_descripcion) VALUES (:id_estado, :descripcion)';
        $stmt_insert_estado = $conexion->prepare($query_insert_estado);

        try {
            // Insertar el registro
            $stmt_insert_estado->execute([':id_estado' => $estado['id'], ':descripcion' => $estado['descripcion']]);
        } catch (PDOException $e) {
            echo "Error al insertar los datos en FIDE_ESTADOS_TB: " . $e->getMessage();
            exit();
        }
    }
}

// Preparar la consulta para FIDE_PROMOCIONES_TB
$query_select_promociones = 'SELECT V_id_promocion, V_nombre_promocion, V_descripcion_promocion, V_fecha_inicio, V_fecha_fin, V_descuento, V_id_estado FROM FIDE_PROMOCIONES_TB';
$stmt_select_promociones = $conexion->prepare($query_select_promociones);

try {
    // Ejecutar la consulta
    $stmt_select_promociones->execute();
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
    exit();
}

// Obtener los estados para el menú desplegable
$query_select_estados = 'SELECT V_id_estado, V_descripcion FROM FIDE_ESTADOS_TB';
$stmt_select_estados = $conexion->prepare($query_select_estados);
$stmt_select_estados->execute();
$estados = $stmt_select_estados->fetchAll(PDO::FETCH_ASSOC);

// Procesar el formulario de inserción de promociones
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $query_insert_promocion = 'INSERT INTO FIDE_PROMOCIONES_TB (V_nombre_promocion, V_descripcion_promocion, V_fecha_inicio, V_fecha_fin, V_descuento, V_id_estado) 
                              VALUES (:nombre_promocion, :descripcion_promocion, :fecha_inicio, :fecha_fin, :descuento, :id_estado)';
    $stmt_insert_promocion = $conexion->prepare($query_insert_promocion);

    try {
        // Insertar los datos de la nueva promoción
        $stmt_insert_promocion->execute([
            ':nombre_promocion' => $_POST['nombre_promocion'],
            ':descripcion_promocion' => $_POST['descripcion_promocion'],
            ':fecha_inicio' => $_POST['fecha_inicio'],
            ':fecha_fin' => $_POST['fecha_fin'],
            ':descuento' => $_POST['descuento'],
            ':id_estado' => $_POST['id_estado']
        ]);
        
        echo "Promoción agregada con éxito.";
    } catch (PDOException $e) {
        echo "Error al insertar la promoción: " . $e->getMessage();
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Promociones</title>
    <link rel="stylesheet" href="/CSS/promo.css">
</head>
<body>

<h1>Gestión de Promociones</h1>

<!-- Formulario para agregar nuevas promociones -->
<form action="" method="POST">
    <h2>Agregar Nueva Promoción</h2>
    <label for="nombre_promocion">Nombre de la Promoción:</label>
    <input type="text" id="nombre_promocion" name="nombre_promocion" required><br>

    <label for="descripcion_promocion">Descripción:</label>
    <input type="text" id="descripcion_promocion" name="descripcion_promocion" required><br>

    <label for="fecha_inicio">Fecha de Inicio:</label>
    <input type="date" id="fecha_inicio" name="fecha_inicio" required><br>

    <label for="fecha_fin">Fecha de Fin:</label>
    <input type="date" id="fecha_fin" name="fecha_fin" required><br>

    <label for="descuento">Descuento (%):</label>
    <input type="number" id="descuento" name="descuento" required><br>

    <label for="id_estado">Estado:</label>
    <select id="id_estado" name="id_estado" required>
        <option value="">Seleccione un estado</option>
        <?php foreach ($estados as $estado): ?>
            <option value="<?php echo htmlspecialchars($estado['V_id_estado']); ?>" 
                <?php echo (isset($_POST['id_estado']) && $_POST['id_estado'] == $estado['V_id_estado']) ? 'selected' : ''; ?>>
                <?php echo htmlspecialchars($estado['V_descripcion']); ?>
            </option>
        <?php endforeach; ?>
    </select><br>

    <input type="submit" value="Agregar Promoción">
</form>

<!-- Tabla para mostrar promociones existentes -->
<h2>Promociones Existentes</h2>
<?php
// Mostrar los datos en la tabla
echo '<table>';
echo '<tr><th>ID Promoción</th><th>Nombre Promoción</th><th>Descripción</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Descuento</th><th>Estado</th></tr>';

while ($row = $stmt_select_promociones->fetch(PDO::FETCH_ASSOC)) {
    echo '<tr>';
    foreach ($row as $key => $value) {
        echo '<td>' . htmlspecialchars($value) . '</td>';
    }
    echo '</tr>';
}
echo '</table>';

// Desconectar
Desconectar($conexion);
?>

</body>
</html>
