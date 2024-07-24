<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reseñas de Productos Electrónicos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            margin: 0;
            flex: 1;
        }
        .return-btn {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
        }
        .return-btn:hover {
            background-color: #0056b3;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transform: translateY(-2px);
        }
        .container {
            width: 80%;
            margin: 20px auto;
        }
        h1 {
            margin: 0;
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
        .review {
            color: #666;
            font-style: italic;
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <header>
        <h1>Reseñas de Productos Electrónicos</h1>
        <a href="index.php" class="return-btn">Menú</a>
    </header>
    <div class="container">
        <div class="product">
            <img src="https://res.cloudinary.com/sharp-consumer-eu/image/fetch/w_1100,f_auto,q_auto/https://s3.infra.brandquad.io/accounts-media/SHRP/DAM/origin/a898c7d2-8f27-11ea-a21e-c276f464bfe6.jpg" alt="Televisor">
            <div>
                <h2>Televisor 4K Ultra HD</h2>
                <p class="price">$999.99</p>
                <p>El televisor 4K Ultra HD ofrece una calidad de imagen impresionante con colores vivos y un contraste increíble.</p>
                <p class="review">"La mejor calidad de imagen que he visto. Perfecto para ver películas y jugar videojuegos." - Juan P.</p>
            </div>
        </div>
        <div class="product">
            <img src="https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iPhone-13-Pro_Colors_09142021_big.jpg.large.jpg" alt="iPhone">
            <div>
                <h2>iPhone 13 Pro</h2>
                <p class="price">$1199.99</p>
                <p>El iPhone 13 Pro viene con una cámara avanzada, una pantalla Super Retina XDR y un rendimiento ultra rápido.</p>
                <p class="review">"El iPhone 13 Pro es increíble. La cámara es espectacular y el rendimiento es muy rápido." - María G.</p>
            </div>
        </div>
        <div class="product">
            <img src="https://cdn.bitlysdowssl-aws.com/wp-content/uploads/2020/01/Microondas-inteligente-Foto-Europa-Press.jpg" alt="Microondas">
            <div>
                <h2>Microondas Inteligente</h2>
                <p class="price">$199.99</p>
                <p>El microondas inteligente ofrece funciones avanzadas y un diseño elegante para tu cocina moderna.</p>
                <p class="review">"Este microondas es muy fácil de usar y tiene muchas funciones útiles. ¡Me encanta!" - Carlos R.</p>
            </div>
        </div>
    </div>
    
</body>
</html>
