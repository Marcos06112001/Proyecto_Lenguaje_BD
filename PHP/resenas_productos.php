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
        <div class="header">Reseñas de Productos</div>
        <a href="index.php" class="button">Menú</a>
        <div class="review-form">
            <h2>Ingrese su reseña</h2>
            <form id="reviewForm">
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
            <div class="review">
                <div class="review-title">Smartphone</div>
                <div class="rating">Calificación: 5 ★★★★★</div>
                <div class="review-content">Excelente portátil, muy rápido y de gran calidad.</div>
                <div class="review-date">Fecha Realizada: 10-JUL-24</div>
                <div class="review-user">Nombre del usuario: Juan Pérez</div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('reviewForm').addEventListener('submit', function(event) {
            event.preventDefault();

            var product = document.getElementById('product').value;
            var rating = document.getElementById('rating').value;
            var content = document.getElementById('content').value;
            var date = document.getElementById('date').value;
            var username = document.getElementById('username').value;

            var reviewContainer = document.getElementById('reviews');
            var newReview = document.createElement('div');
            newReview.classList.add('review');

            var reviewTitle = document.createElement('div');
            reviewTitle.classList.add('review-title');
            reviewTitle.textContent = product;

            var reviewRating = document.createElement('div');
            reviewRating.classList.add('rating');
            reviewRating.textContent = 'Calificación: ' + rating + ' ' + '★'.repeat(rating) + '☆'.repeat(5 - rating);

            var reviewContent = document.createElement('div');
            reviewContent.classList.add('review-content');
            reviewContent.textContent = content;

            var reviewDate = document.createElement('div');
            reviewDate.classList.add('review-date');
            reviewDate.textContent = 'Fecha Realizada: ' + date;

            var reviewUser = document.createElement('div');
            reviewUser.classList.add('review-user');
            reviewUser.textContent = 'Nombre del usuario: ' + username;

            newReview.appendChild(reviewTitle);
            newReview.appendChild(reviewRating);
            newReview.appendChild(reviewContent);
            newReview.appendChild(reviewDate);
            newReview.appendChild(reviewUser);

            reviewContainer.appendChild(newReview);

            document.getElementById('reviewForm').reset();
        });
    </script>
</body>
</html>
