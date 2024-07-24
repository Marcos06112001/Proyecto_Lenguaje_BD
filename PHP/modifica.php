<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Datos</title>
    <link rel="stylesheet" href="../CSS/modifica.css">
</head>
<body>
    <header>
        <h1>Modificar Datos</h1>
        <a href="index.php" class="btn btn-primary menu-btn">Menú</a>
    </header>
    <div id="modify-container">
        <form id="modify-form">
            <label class="label-form" for="nombre">Nombre:</label>
            <input class="input-form" type="text" id="nombre" name="nombre" required>
            
            <label class="label-form" for="apellido">Apellido:</label>
            <input class="input-form" type="text" id="apellido" name="apellido" required>
            
            <label class="label-form" for="email">Correo electrónico:</label>
            <input class="input-form" type="email" id="email" name="email" required>
            
            <label class="label-form" for="telefono">Teléfono:</label>
            <input class="input-form" type="tel" id="telefono" name="telefono" required>
            
            <label class="label-form" for="direccion">Dirección:</label>
            <textarea class="input-form" id="direccion" name="direccion" required></textarea>
            
            <button type="submit" class="btn-form">Actualizar Datos</button>
        </form>
    </div>
</body>
</html>
