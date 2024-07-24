<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos Electrónicos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/producto.css">
</head>
<body>
    <header class="bg-dark text-white py-3 d-flex justify-content-between align-items-center">
        <h1 class="mx-auto">Productos Electrónicos</h1>
        <a href="index.php" class="btn btn-primary return-btn">Menú</a>
    </header>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card product">
                    <img src="https://images.ecestaticos.com/AUq-yYTh8MSgZ2S6dh5Ndcx14dE=/0x0:640x359/1440x810/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F031%2F004%2F40f%2F03100440fc8b8912dc9cee7af389963a.jpg" class="card-img-top" alt="Producto 1">
                    <div class="card-body">
                        <h5 class="card-title">Televisor Xiaomi</h5>
                        <p class="card-text price">$499.99</p>
                        <p class="card-text">Descripción breve del producto 1. Este es un gran producto para todas tus necesidades electrónicas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card product">
                    <img src="https://www.apple.com/v/iphone/home/bv/images/meta/iphone__ky2k6x5u6vue_og.png" class="card-img-top" alt="Producto 2">
                    <div class="card-body">
                        <h5 class="card-title">Celular iPhone</h5>
                        <p class="card-text price">$299.99</p>
                        <p class="card-text">Descripción breve del producto 2. Este es un gran producto para todas tus necesidades electrónicas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card product">
                    <img src="https://www.verdugotienda.com/media/catalog/product/h/o/horno-microondas-telstar-0.7cp-tmd007530md-silver-183778.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700" class="card-img-top" alt="Producto 3">
                    <div class="card-body">
                        <h5 class="card-title">Microondas</h5>
                        <p class="card-text price">$199.99</p>
                        <p class="card-text">Descripción breve del producto 3. Este es un gran producto para todas tus necesidades electrónicas.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5 text-center">
        <a href="historial_compras.php" class="btn btn-success historial-btn">Historial de Compras</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
