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
       .product-icon { 
            font-size: 3rem; 
            color: red; 
        }
 
    </style>
</head>
<body>
    <header>
        <h1>Reclamaciones</h1>
    </header>
    <div class="container">
           <div class="form-floating">
            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
            <label for="floatingTextarea">Comentario</label>
            <br>
        </div>
        <div class="form-container">
       <form>
         <div class="form-group">
        <label for="fecha">Fecha del reclamo:</label>
        <input type="date" id="fecha" class="form-control from-select">
        <br>
        </div>
        <input type="submit" value="Enviar" class="btn btn-primary me-md-2">
        </form>
       </div>
    </div>

</body>
    <footer>
        <center><p>&copy; 2024 Derechos Reservados</p></center>
    </footer>
</html> 

