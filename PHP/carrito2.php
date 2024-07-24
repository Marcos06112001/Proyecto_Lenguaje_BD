<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrito de Compras</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .container {
            max-width: 900px;
        }
        .cart-item {
            border-bottom: 1px solid #e9ecef;
            padding: 15px 0;
            display: flex;
            align-items: center;
        }
        .cart-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 15px;
        }
        .cart-item h5 {
            margin: 0;
        }
        .cart-item p {
            margin: 5px 0;
        }
        .cart-total {
            text-align: right;
            margin-top: 20px;
            font-weight: bold;
        }
        .btn-checkout {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
        }
</style>
</head>
<body>

<div class="container">
<h1>Carrito de Compras</h1>
<!-- Cart Item 1 -->
<div class="cart-item">
<img src="https://images.ecestaticos.com/AUq-yYTh8MSgZ2S6dh5Ndcx14dE=/0x0:640x359/1440x810/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F031%2F004%2F40f%2F03100440fc8b8912dc9cee7af389963a.jpg" alt="Producto 1">
<div>
<h5>Producto 1</h5>
<p>Descripción breve del producto.</p>
<p><strong>Precio:</strong> $19.99</p>
<p><strong>Cantidad:</strong> 2</p>
</div>
</div>
 
        <!-- Cart Item 2 -->
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
<img src="https://www.verdugotienda.com/media/catalog/product/h/o/horno-microondas-telstar-0.7cp-tmd007530md-silver-183778.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700"" alt="Producto 3">
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
 
        <!-- Checkout Button -->
<div class="btn-checkout">
<li><a href="proceder_pago.php">Proceder al Pago</a></li>

</div>
</div>

</body>
</html>