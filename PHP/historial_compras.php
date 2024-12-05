<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial de Compras</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/historial.css">
</head>
<body>
    <header class="bg-dark text-white py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <h1 class="m-0">Historial de Compras</h1>
            <a href="index.php" class="btn btn-primary return-btn">Menú</a>
        </div>
    </header>
    <div class="container mt-5">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Producto</th>
                        <th>Fecha</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>1</td>
                        <td>Televisor Xiaomi</td>
                        <td>2024-07-23</td>
                        <td>$499.99</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Celular iPhone</td>
                        <td>2024-07-22</td>
                        <td>$299.99</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Microondas</td>
                        <td>2024-07-21</td>
                        <td>$199.99</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
 
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
