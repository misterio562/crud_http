<?php

session_start();
$host = "localhost"; /* equipo */
$user = "id20141995_notasdb"; /* usuario */
$password = "Arlequin1-asd"; /* clave */
$dbname = "id20141995_notas"; /* base de datos */

$con = mysqli_connect($host, $user, $password,$dbname);

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
//echo "Conexion Exitosa";

?>

