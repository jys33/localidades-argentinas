<?php

$time = microtime(true);

$provincias = [1 => 'BuenosAires', 'Catamarca', 'Chaco', 'Chubut', 'CiudadAutónomadeBuenosAires', 'Corrientes', 'Córdoba', 'EntreRíos', 'Formosa', 'Jujuy', 'LaPampa', 'LaRioja', 'Mendoza', 'Misiones', 'Neuquén', 'RíoNegro', 'Salta', 'SanJuan', 'SanLuis', 'SantaCruz', 'SantaFe', 'SantiagodelEstero', 'TierradelFuego', 'Tucumán'];

static $conn;

foreach ($provincias as $fk => $provincia) {
    $data = file_get_contents('por-provincia/'. $provincia .'.json');
    $data = json_decode($data, true);

    try {

        if(!isset($conn)) {
            $conn = new PDO('mysql:host=localhost;dbname=codigo_postal;charset=utf8mb4', 'root', '');
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo '<p>Conexión a base de datos creada.</p>';
        }
        // begin the transaction
        $conn->beginTransaction();

        foreach ($data as $key => $value) {
            $id = $value['id'];
            $nombre = $value['nombre'];
            $cp = $value['cp'];

            $conn->exec("INSERT INTO localidad (id_localidad, nombre, cp, id_provincia) 
                         VALUES
                           ('$id', '$nombre', '$cp', '$fk');");
        }

        // commit the transaction
        $conn->commit();
        echo "Insertando localidades de: " . $provincia . " foreign key provincia: " . $fk . "<br>";

    } catch (PDOException $e) {
        // roll back the transaction if something failed
        $conn->rollback();
        echo "Error: " . $e->getMessage();
    }

}

$conn = null;

$time = microtime(true) - $time;
echo "<p>Carga de datos en: " . round($time, 3) . " segundos\n";