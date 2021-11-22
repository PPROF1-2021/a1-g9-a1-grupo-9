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
		//$fechanac=$_POST['date'];
		
		$dia=$_POST['dia'];//j   1 al 31
		$mes=$_POST['mes'];//n   1 al 12
		$año=$_POST['año'];// Y	
		$fechanac=date("Y-m-d",mktime(0, 0, 0, $mes, $dia, $año));
		//$fechanac=create_date(date("Y-m-d",mktime(0, 0, 0, $mes, $dia, $año)));
		//echo "<script> console.log(". DATE("Y",$fechanac).")</script>";
		$sqluser="SELECT Codigo FROM usuarios WHERE dni=$dni or Email='$correo'";

		$resultadouser=$conexion->query($sqluser);
		$filas=$resultadouser->num_rows;

		if($filas>0){

			header("Location: ../errorregistro.html");
		}else{
	
			
			$sqlusuario="INSERT INTO usuarios(Nombre, Apellido, Email, Password, CodigoLocalidad, Dni, Sexo, FechaNacimiento, Capacita) 
			VALUES ('$nombre', '$apellido','$correo','$password_encriptada',$codigolocalidad,$dni,'$sexo','$fechanac', 0)";
			


			$resultadousuario=$conexion->query($sqlusuario);
			if($resultadousuario>0){
				header("Location: ../registroexitoso.html");
			}else{
				echo "<script>
						alert('Error al registrarse');
						window.location='../index.html';
					</script>";
			}


        }
	}

?>