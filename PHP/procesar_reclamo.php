<?php
include '../DAL/conexion.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        $conexion = Conecta();
        $nombre_cliente = $_POST['name'];
        $categoria = $_POST['categoria'];
        $descripcion = $_POST['descripcion'];
        $fecha = $_POST['fecha'];

        // Preparar y ejecutar el procedimiento almacenado
        $stmt = $conexion->prepare("BEGIN FIDE_RECLAMACIONES_MOTIVO_INSERTAR_SP(:p_v_nombre_cliente, :P_categoria, :P_descripcion, TO_DATE(:P_fecha, 'YYYY-MM-DD')); END;");
        
        $stmt->bindParam(':p_v_nombre_cliente', $nombre_cliente);
        $stmt->bindParam(':P_categoria', $categoria);
        $stmt->bindParam(':P_descripcion', $descripcion);
        $stmt->bindParam(':P_fecha', $fecha);
        
        // Ejecutar el procedimiento almacenado
        $stmt->execute();
        
        // Redirigir al menú después de una inserción exitosa
        header("Location: index.php");
        exit();
    } catch (Exception $e) {
        // Mostrar mensaje de error en caso de fallo
        echo "Error al enviar la reclamación: " . $e->getMessage();
    } finally {
        // Cerrar la conexión
        $conexion = null;
    }
}
?>
