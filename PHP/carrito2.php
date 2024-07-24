<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/CSS/carrito.css">
</head>
<body>
<header>
    <h1>Carrito de Compras</h1>
    <a href="index.php" class="menu-btn">Menú</a>
</header>

<div class="container">
    <div class="cart-item">
        <img src="https://images.ecestaticos.com/AUq-yYTh8MSgZ2S6dh5Ndcx14dE=/0x0:640x359/1440x810/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F031%2F004%2F40f%2F03100440fc8b8912dc9cee7af389963a.jpg" alt="Producto 1">
        <div>
            <h5>Producto 1</h5>
            <p>Descripción breve del producto.</p>
            <p><strong>Precio:</strong> $19.99</p>
            <p><strong>Cantidad:</strong> 2</p>
        </div>
    </div>

    <div class="cart-item">
        <img src="https://www.apple.com/v/iphone/home/bv/images/meta/iphone__ky2k6x5u6vue_og.png" alt="Producto 2">
        <div>
            <h5>Producto 2</h5>
            <p>Descripción breve del producto.</p>
            <p><strong>Precio:</strong> $29.99</p>
            <p><strong>Cantidad:</strong> 1</p>
        </div>
    </div>

    <div class="cart-item">
        <img src="https://www.verdugotienda.com/media/catalog/product/h/o/horno-microondas-telstar-0.7cp-tmd007530md-silver-183778.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700" alt="Producto 3">
        <div>
            <h5>Producto 3</h5>
            <p>Descripción breve del producto.</p>
            <p><strong>Precio:</strong> $9.99</p>
            <p><strong>Cantidad:</strong> 3</p>
        </div>
    </div>

    <div class="cart-total">
        <p><strong>Total:</strong> $99.95</p>
    </div>

    <div class="btn-checkout">
        <a href="proceder_pago.php" class="btn btn-primary">Proceder al Pago</a>
    </div>
</div>

</body>
</html>
