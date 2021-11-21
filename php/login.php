<?php
include("conexion.php");


if(isset($_POST["login"])){

    $correo=mysqli_real_escape_string($conexion,$_POST['usuario']);
    $password=mysqli_real_escape_string($conexion,$_POST['contraseña']);
    $password_encriptada=sha1($password);

    $sqluser="SELECT Codigo FROM usuarios WHERE Password='$password_encriptada' and Email='$correo'";

    $resultado=$conexion->query($sqluser);
    $filas=$resultado->num_rows;
    if($filas>0){
        $fila=$resultado->fetch_assoc();
        #$_SESSION['Usuario']=$fila["Codigo"];
       # echo "<script>
       # window.location='../perfil.html';
   # </script>";
        header("Location: ../perfil.html");
    }else{
        echo "<script>
                    alert('Usuario o password incorrecto');
                    window.location='../login.html';
                </script>";
    }
}
?>