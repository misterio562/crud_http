<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header("HTTP/1.1 200 OK");
die();
}

require "config.php";

if ($method == "POST") {
    $foto = isset($_POST['foto']) ? $_POST['foto'] : null;
    $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : null;
    $apellido = isset($_POST['apellido']) ? $_POST['apellido'] : null;
    $programa = isset($_POST['programa']) ? $_POST['programa'] : null;
    $idUser = isset($_POST['idUser']) ? $_POST['idUser'] : null;

    if (empty($foto) || empty($nombre) || empty($apellido) || empty($programa) || empty($idUser)) {
        $error = array('error' => 'One or more required fields are missing');
        echo json_encode($error);
        die();
    }


    $query = "INSERT INTO student (id,foto,nombre, apellido, programa, idUser) VALUES (default,'$foto','$nombre', '$apellido', '$programa', '$idUser')";

    if (mysqli_query($con, $query)) {
        $success = array('message' => 'Student successfully added');
        $json_string = json_encode($success);
        echo $json_string;
    } else {
        $error = array('error' => mysqli_error($con));
        echo json_encode($error);
        die();
    }
}

?>