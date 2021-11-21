<?php
    include("configuracion.php");
    $conexion=new mysqli($server,$user,$pass,$bd);
    if(mysqli_connect_errno()){
        echo "No se puede conectar", mysqli_connect_errno();
        exit();
    }
?>