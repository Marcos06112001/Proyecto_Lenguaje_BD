<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reseñas de Productos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .header {
            text-align: center;
            padding: 20px 0;
            font-size: 28px;
            color: #444;
        }
        .review-form {
            margin-bottom: 40px;
        }
        .review-form input, .review-form textarea, .review-form select, .review-form button {
            width: calc(100% - 20px);
            margin: 10px;
            padding: 10px;
            font-size: 16px;
        }
        .review-form button {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .review-form button:hover {
            background-color: #218838;
        }
        .review {
            border-bottom: 1px solid #e0e0e0;
            padding: 20px 0;
        }
        .review:last-child {
            border-bottom: none;
        }
        .review-title {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }
        .rating {
            color: #ffa500;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .review-content {
            font-size: 16px;
            margin-bottom: 10px;
            color: #555;
        }
        .review-date, .review-user {
            font-size: 14px;
            color: #777;
        }
        .review-user {
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="container">
    <center><h1><a href="index.php" style="text-decoration: none; color: #000000;">Reseñas De Productos</a></h1><center>
        <div class="review-form">
            <h2>Ingrese su reseña</h2>
            <form id="reviewForm" method="POST" action="procesar_reseña.php">
                <input type="text" id="product" name="product" placeholder="Nombre del producto" required>
                <select id="rating" name="rating" required>
                    <option value="" disabled selected>Calificación</option>
                    <option value="5">5 ★★★★★</option>
                    <option value="4">4 ★★★★☆</option>
                    <option value="3">3 ★★★☆☆</option>
                    <option value="2">2 ★★☆☆☆</option>
                    <option value="1">1 ★☆☆☆☆</option>
                </select>
                <textarea id="content" name="content" placeholder="Escriba su reseña" rows="4" required></textarea>
                <input type="date" id="date" name="date" required>
                <input type="text" id="username" name="username" placeholder="Nombre del usuario" required>
                <button type="submit">Enviar Reseña</button>
            </form>
        </div>
        <div id="reviews">
            <!-- Aquí se mostrarán las reseñas existentes -->
        </div>
    </div>
</body>
</html>
