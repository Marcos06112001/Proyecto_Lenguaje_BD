<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proceder al Pago</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="CSS/pago.css">
</head>
<body>
    <header class="bg-dark text-white py-3 d-flex justify-content-between align-items-center">
        <h1 class="mx-auto">Proceder al Pago</h1>
        <a href="index.php" class="btn btn-primary return-btn">Menú</a>
    </header>
    <div class="container mt-5">
        <h2>Detalles del Pago</h2>
        <form>
            <div class="mb-3">
                <label for="name" class="form-label">Nombre Completo</label>
                <input type="text" class="form-control" id="name" placeholder="Nombre completo">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico</label>
                <input type="email" class="form-control" id="email" placeholder="correo@example.com">
            </div>
            <div class="mb-3">
                <label for="cardNumber" class="form-label">Número de Tarjeta</label>
                <input type="text" class="form-control" id="cardNumber" placeholder="1234 5678 9012 3456">
            </div>
            <div class="mb-3">
                <label for="expiryDate" class="form-label">Fecha de Expiración</label>
                <input type="text" class="form-control" id="expiryDate" placeholder="MM/AA">
            </div>
            <div class="mb-3">
                <label for="cvv" class="form-label">CVV</label>
                <input type="text" class="form-control" id="cvv" placeholder="123">
            </div>
            <button type="submit" class="btn btn-success">Confirmar Pago</button>
        </form>
    </div>
</body>
</html>
