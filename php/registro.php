<?php

	include("conexion.php");


	if(isset($_POST["registrar"])){
	
		$nombre=mysqli_real_escape_string($conexion,$_POST['nombre']);
		$apellido=mysqli_real_escape_string($conexion,$_POST['apellido']);
		$correo=mysqli_real_escape_string($conexion,$_POST['correo']);
		$password=mysqli_real_escape_string($conexion,$_POST['contraseña']);
		$password_encriptada=sha1($password);
		$codigolocalidad=$_POST['localidad'];
		$dni=$_POST['dni'];

		$sexo=mysqli_real_escape_string($conexion,$_POST['sexo']);
		$dia=$_POST['dia'];
		$mes=$_POST['mes'];
		$año=$_POST['año'];
		$fechanac=date("Y-m-d",mktime(0, 0, 0, $mes, $dia, $año));

		$sqluser="SELECT Codigo FROM usuarios WHERE dni=$dni or Email='$correo'";

		$resultadouser=$conexion->query($sqluser);
		$filas=$resultadouser->num_rows;

		if($filas>0){
			echo "<script>
					alert('No se puede dar de alta al Usuario.Ya existe mail o DNI para otro usuario');
					window.location='../registro.html';
				</script>";
		}else{
			$sqlusuario="INSERT INTO usuarios(Nombre, Apellido, Email, Password, CodigoLocalidad, Dni, Sexo, FechaNacimiento, Capacita) 
			VALUES ('$nombre', '$apellido','$correo','$password_encriptada',$codigolocalidad,$dni,'$sexo','$fechanac', 0)";
			


			$resultadousuario=$conexion->query($sqlusuario);
			if($resultadousuario>0){
				echo "<script>
						alert('Registro exitoso');
						window.location='../index.html';
					</script>";
			}else{
				echo "<script>
						alert('Error al registrarse');
						window.location='../index.html';
					</script>";
			}


        }
	}

?>