<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Productos Electrónicos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 20px auto;
        }
        h1 {
            text-align: center;
        }
        .product {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }
        .product img {
            max-width: 150px;
            margin-right: 20px;
            border-radius: 5px;
        }
        .product h2 {
            margin-top: 0;
        }
        .product p {
            margin: 5px 0;
        }
        .price {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header>
        <h1>Productos Electrónicos</h1>
    </header>
    <div class="container">
        <div class="product">
            <img src="https://images.ecestaticos.com/AUq-yYTh8MSgZ2S6dh5Ndcx14dE=/0x0:640x359/1440x810/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F031%2F004%2F40f%2F03100440fc8b8912dc9cee7af389963a.jpg" alt="Producto 1">
            <div>
                <h2>Televiosor Xiomi</h2>
                <p class="price">$499.99</p>
                <p>Descripción breve del producto 1. Este es un gran producto para todos tus necesidades electrónicas.</p>
            </div>
        </div>
        <div class="product">
            <img src="https://www.apple.com/v/iphone/home/bv/images/meta/iphone__ky2k6x5u6vue_og.png" alt="Producto 2">
            <div>
                <h2>Celular Iphone</h2>
                <p class="price">$299.99</p>
                <p>Descripción breve del producto 2. Este es un gran producto para todos tus necesidades electrónicas.</p>
            </div>
        </div>
        <div class="product">
            <img src="https://www.verdugotienda.com/media/catalog/product/h/o/horno-microondas-telstar-0.7cp-tmd007530md-silver-183778.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700" alt="Producto 3">
            <div>
                <h2>Microhondas</h2>
                <p class="price">$199.99</p>
                <p>Descripción breve del producto 3. Este es un gran producto para todos tus necesidades electrónicas.</p>
            </div>
        </div>
    </div>
</body>
</html>
