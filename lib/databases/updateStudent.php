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

         
         $id=$_POST['id'];
         $nombre=$_POST['nombre'];
         $apellido=$_POST['apellido'];
         $programa=$_POST['programa'];
         
    if($id!=''){
       $sql = "UPDATE student SET nombre='$nombre', apellido='$apellido', programa='$programa' WHERE id='$id'";

    if (mysqli_query($con, $sql)) {
         $clientes[] = array('mensaje'=> "Estudiante Actualizado");
  } else {
       $clientes[] = array('mensaje'=> "Estudiante no Actualizado");
  } 
        
    }else{
          $clientes[] = array('mensaje'=> "Estudiante no Actualizado...");
     }
     
     
$json_string = json_encode($clientes);
echo $json_string;
?>