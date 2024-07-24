<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    
    <title>Reclamaciones</title>
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
            padding: 20px;
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
        .product-icon { 
            font-size: 3rem; 
            color: red; 
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
        <h1>Reclamaciones</h1>
        <a href="index.php" class="return-btn">Menú</a>
    </header>
    <div class="container">
        <div class="form-floating">
            <textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea"></textarea>
            <label for="floatingTextarea">Comentario</label>
            <br>
        </div>
        <div class="form-container">
            <form>
                <div class="form-group">
                    <label for="fecha">Fecha del reclamo:</label>
                    <input type="date" id="fecha" class="form-control">
                    <br>
                </div>
                <input type="submit" value="Enviar" class="btn btn-primary me-md-2">
            </form>
        </div>
    </div>
    
</body>
</html>
