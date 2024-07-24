<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Promociones de Productos Electrónicos</title>
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
        .promotion {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .promotion h2 {
            margin-top: 0;
        }
        .promotion p {
            margin: 5px 0;
        }
        .discount {
            color: red;
            font-weight: bold;
        }
        .dates {
            color: #666;
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
        <h1>Promociones de Productos Electrónicos</h1>
        <a href="index.php" class="return-btn">Menú</a>
    </header>
    <div class="container">
        <div class="promotion">
            <h2>Televisores</h2>
            <p class="discount">Descuento: 20%</p>
            <p class="dates">Fecha de Inicio: 2024-07-01</p>
            <p class="dates">Fecha de Fin: 2024-07-31</p>
        </div>
        <div class="promotion">
            <h2>Celulares</h2>
            <p class="discount">Descuento: 15%</p>
            <p class="dates">Fecha de Inicio: 2024-07-15</p>
            <p class="dates">Fecha de Fin: 2024-08-15</p>
        </div>
        <div class="promotion">
            <h2>Microondas</h2>
            <p class="discount">Descuento: 25%</p>
            <p class="dates">Fecha de Inicio: 2024-07-20</p>
            <p class="dates">Fecha de Fin: 2024-08-20</p>
        </div>
    </div>
    
</body>
</html>
