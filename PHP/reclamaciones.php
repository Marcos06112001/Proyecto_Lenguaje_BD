<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/CSS/reclamo.css">
    <title>Reclamaciones</title>
</head>
<body>
    <header>
        <h1>Reclamaciones</h1>
        <a href="index.php" class="return-btn">Menú</a>
    </header>
    <div class="container mt-5">
        <div class="reclamos-container p-4 bg-white shadow rounded">
            <h2 class="fs-4 mb-4">Formulario de Reclamo</h2>
            <form>
                <div class="mb-3">
                    <label for="name" class="form-label">Nombre Completo</label>
                    <input type="text" id="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" id="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="order-id" class="form-label">ID de Pedido</label>
                    <input type="text" id="order-id" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="issue-type" class="form-label">Tipo de Reclamo</label>
                    <select id="issue-type" class="form-select" required>
                        <option value="" disabled selected>Seleccione un tipo</option>
                        <option value="producto-dañado">Producto Dañado</option>
                        <option value="pedido-incompleto">Pedido Incompleto</option>
                        <option value="error-en-factura">Error en la Factura</option>
                        <option value="otro">Otro</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Descripción del Problema</label>
                    <textarea id="description" class="form-control" rows="4" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="attachment" class="form-label">Adjuntar Archivos (opcional)</label>
                    <input type="file" id="attachment" class="form-control">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Enviar Reclamo</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Optional Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-7t0D7Gv2IKK5zQb6mD4ztDA7VxXq64fU66g4E6cGepV6Vm4tQ1Sgjv2Qh0ggxVoS" crossorigin="anonymous"></script>
</body>
</html>