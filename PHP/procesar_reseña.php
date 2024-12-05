<?php
include '../DAL/conexion.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        $conexion = Conecta();
        $product = $_POST['product'];
        $rating = $_POST['rating'];
        $content = $_POST['content'];
        $date = $_POST['date'];
        $username = $_POST['username'];
        
        // Preparar y ejecutar el procedimiento almacenado
        $stmt = $conexion->prepare("BEGIN FIDE_INSERTAR_RESENA_SP(:p_v_nombre_producto, :p_v_nombre_cliente, :p_v_calificacion, :p_v_comentario, :p_v_fecha); END;");
        
        $stmt->bindParam(':p_v_nombre_producto', $product);
        $stmt->bindParam(':p_v_nombre_cliente', $username);
        $stmt->bindParam(':p_v_calificacion', $rating);
        $stmt->bindParam(':p_v_comentario', $content);
        $stmt->bindParam(':p_v_fecha', $date);
        
        // Ejecutar el procedimiento almacenado
        $stmt->execute();
        
        // Redirigir al menú después de una inserción exitosa
        header("Location: index.php");
        exit();
    } catch (Exception $e) {
        // Mostrar mensaje de error en caso de fallo
        echo "Error al enviar la reseña: " . $e->getMessage();
    } finally {
        // Cerrar la conexión
        $conexion = null;
    }
}
?>

