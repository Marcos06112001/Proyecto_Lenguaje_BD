<?php
include '../DAL/conexion.php';

try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Preparar la consulta para obtener el cliente
    $query = "SELECT V_ID_CLIENTE, V_NOMBRE_CLIENTE, V_ROL, V_PASS FROM FIDE_CLIENTES_TB WHERE V_EMAIL = :email";
    $stmt = $conexion->prepare($query);

    if ($stmt === false) {
        die("Error de preparación de consulta: " . implode(":", $conexion->errorInfo()));
    }

    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        $hashed_password = $row['V_PASS']; // Asegúrate de que esto esté en mayúsculas si la columna es así

        // Verificar la contraseña
        if (password_verify($password, $hashed_password)) {
            session_start();
            $_SESSION['id_cliente'] = $row['V_ID_CLIENTE'];
            $_SESSION['nombre_cliente'] = $row['V_NOMBRE_CLIENTE'];
            $_SESSION['rol'] = $row['V_ROL'];
            header("Location: index.php");
            exit();
        } else {
            echo "La contraseña no coincide.";
        }
    } else {
        echo "Correo electrónico o contraseña incorrectos.";
    }

    $stmt->closeCursor();
    Desconectar($conexion);
}
?>
