<?php
include '../DAL/conexion.php';
session_start(); // Inicia la sesión para acceder a la variable $_SESSION

// Función para llamar al procedimiento almacenado
function agregarProductoCarrito($id_cliente, $id_producto, $cantidad) {
    $conexion = Conecta();

    try {
        // Prepara la llamada al procedimiento almacenado
        $stmt = $conexion->prepare("BEGIN AGREGARALCARRITO(:p_id_cliente, :p_id_producto, :p_cantidad); END;");
        
        // Bind de parámetros
        $stmt->bindParam(':p_id_cliente', $id_cliente, PDO::PARAM_INT);
        $stmt->bindParam(':p_id_producto', $id_producto, PDO::PARAM_INT);
        $stmt->bindParam(':p_cantidad', $cantidad, PDO::PARAM_INT);
        
        // Ejecuta el procedimiento almacenado
        $stmt->execute();
        
        echo "Producto agregado al carrito con éxito.";
    } catch (PDOException $e) {
        echo "Error al agregar producto al carrito: " . $e->getMessage();
    }

    Desconectar($conexion);
}

// Verifica si se ha enviado el ID del producto y el ID del cliente está disponible en la sesión
if (isset($_GET['id_producto']) && isset($_SESSION['id_cliente'])) {
    $id_producto = (int)$_GET['id_producto'];
    $id_cliente = $_SESSION['id_cliente'];
    $cantidad = 1; // Cantidad por defecto, puedes ajustarla según sea necesario

    agregarProductoCarrito($id_cliente, $id_producto, $cantidad);
}
?>
