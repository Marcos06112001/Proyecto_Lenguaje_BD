<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/CSS/perfiles.css">
</head>
<body>
<header class="d-flex justify-content-between align-items-center p-4 bg-primary text-white shadow">
        <h1 class="mb-0">Perfil</h1>
        <a href="index.php" class="btn return-btn">Menú</a>
    </header>

    <div class="profile-container container mt-5 p-4 bg-white shadow rounded">
        <div class="profile-header d-flex align-items-center mb-4">
            <img src="https://t2.uc.ltmcdn.com/es/posts/5/1/8/como_saber_si_una_mujer_es_sincera_34815_600_square.jpg" alt="Foto de perfil" class="profile-img">
            <div class="ms-3">
                <h1 class="fs-3 mb-1">Susana Hidalgo Vargas</h1>
                <p class="text-muted mb-0">@Susana</p>
            </div>
        </div>

        <div class="profile-details">
    <h2 class="fs-4 mb-3">Sobre mí</h2>
    <form class="profile-form">
        <div class="mb-3">
            <label for="bio" class="form-label">Biografía</label>
            <textarea id="bio" class="form-control" rows="4" readonly>Soy una estudiante de derecho. Trabajo en el tribunal de justicia andorrano y tengo 26 años.</textarea>
        </div>
        
        <h2 class="fs-4 mb-3">Dirección</h2>
        <div class="mb-3">
            <label for="address" class="form-label">Dirección</label>
            <textarea id="address" class="form-control" rows="3" readonly>25 sur, 25 norte centro villa del viejo. Residencia 2, casa Azul de 2 pisos.</textarea>
        </div>
        
        <h2 class="fs-4 mb-3">Detalles de Contacto</h2>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" class="form-control" value="SusanaHV@example.com" readonly>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Teléfono</label>
            <input type="tel" id="phone" class="form-control" value="+123 456 7890" readonly>
        </div>
    </form>
</div>

    <!-- Optional Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-7t0D7Gv2IKK5zQb6mD4ztDA7VxXq64fU66g4E6cGepV6Vm4tQ1Sgjv2Qh0ggxVoS" crossorigin="anonymous"></script>
</body>
</html>