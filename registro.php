<?php
include("php/conexion.php");
$query=$conexion->query("select * from paises");
$paises = array();
while($r=$query->fetch_object()){ $paises[]=$r; }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/styles.css">
  <link
  rel="shortcut icon"
  href="img/students.png"
  type="image/x-icon"
/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>Registro</title>
</head>
<body class="d-flex flex-column min-vh-100" id="body" onload="cargarDatosFechas()">
<header id="header">
  <nav class="navbar navbar-light" id="navbar-general">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.html"><img src="https://img.icons8.com/wired/64/000000/students.png"/>Plataforma Educativa</a>
      <a class="navbar-brand" href="login.html">Iniciar Sesion</a>
      <a class="navbar-brand" href="registro.php">Registrarse</a>
      <a class="navbar-brand" href="perfil.html">Perfil</a>
      <form class="d-flex">
        <input type="search" class="form-control me-2" placeholder="Buscar" aria-label="Search">
        <a class="navbar-brand" href="resultados.html">
        <button class="btn btn-outline-dark" id="buscar-button">Buscar</button></a>
      </form>
    </div>
  </nav>
</header>   
<section>
  <div class="container" id="contenedor">
    <div id="a"></div>
  </div>
  <div class="container" id="container-registro"><br>
    <h2>Crear una cuenta</h2> <br>
    <form class="form-inline needs-validation" role="form" id="form" method="POST" action="php/registro.php"  novalidate>
      <div class="form-group" id="form-group-Nombre">
        <label for="name">Nombre*</label>
        <input id="name" name="nombre" class="form-control" type="text"  minlength="2" required>
        <div class="invalid-feedback">
          Ingresar Nombre!!
        </div>
     </div><br>   
      <div class="form-group" id="form-group-Apellido">
         <label for="lastname">Apellido*</label>
         <input id="lastname" name="apellido" class="form-control" type="text"   minlength="2" required>
         <div class="invalid-feedback">
          Ingresar Apellido!!
        </div>
      </div><br>
     <div class="form-group" id="form-group-Email">
      <label for="email">Correo electronico</label>
      <input id="email" name="correo" class="form-control" type="email" placeholder="ejemplo@outlook.com" required>
      <div class="invalid-feedback">
        Ingresar Correo!!
      </div>
   </div><br>
      <div class="form-group" id="form-group-contraseña">
         <label for="pwd">Contraseña*</label>
         <input id="pwd" class="form-control" name="contraseña" type="password" placeholder="Crea una contraseña" required>
         <div class="invalid-feedback">
          Ingresar Contraseña!!
        </div>
      </div><br>
      <div class="form-group" id="form-group-recontraseña">
          <label for="pwd1">Confirmar contraseña*</label>
          <input id="pwd1" class="form-control" type="password"  placeholder="Ingrese nuevamente la contraseña" required>
          <div class="invalid-feedback">
            Ingresar Usuario!!
          </div>
      </div><br>
      <div class="form-group" id="form-group-Pais">
        <label for="country">Pais de residencia</label>
        <select class="form-control" id="pais" name="pais" size="1" aria-label=".form-select-1" required>
          <option selected disabled value="">Pais</option>
          <?php foreach($paises as $p):?>
            <option value="<?php echo $p->Codigo; ?>"><?php echo $p->Descripcion; ?></option>
          <?php endforeach; ?>
        </select>
        <div class="invalid-feedback">
          Seleccionar Pais
        </div>
        </div><br>
      <div class="form-group" id="form-group-Provincia">
          <label for="province">Provincia</label>
          <select class="form-control" id="provincia" name="provincia" size="1" aria-label=".form-select-1" required>
            <option selected disabled value="">Provincia</option>
          </select>
          <div class="invalid-feedback">
            Seleccionar Provincia
          </div>
      </div><br>
      <div class="form-group" id="form-group-Localidad">
        <label for="province">Localidad</label>
        <select class="form-control" id="localidad" name="localidad" size="1" aria-label=".form-select-1" required>
          <option selected disabled value="">Localidad</option>
        </select>
        <div class="invalid-feedback">
          Seleccionar Localidad
        </div>
    </div><br>
     <div class="form-group" id="form-group-DNI">
      <label for="doc">N° de documento*</label>
      <input id="doc" name="dni" class="form-control" type="number" min="0" required>
      <div class="invalid-feedback">
        Ingresar N° de documento
      </div>
   </div><br>
   <div class="form-group" id="form-group-Genero">
    <label for="gender">Genero</label>
    <label class="form-check-label" for="flexRadioDefault1" style="padding-left: 2rem;"><input class="form-check-input" name="sexo" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="M" checked> Masculino </label>
    <label class="form-check-label" for="flexRadioDefault2" style="padding-left: 0.5rem;"><input class="form-check-input" name="sexo" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="F"> Femenino </label>
  </div><br>
  <div class="form-inline" role="form" id="form-Fecha">
    <label for="date">Fecha de Nacimiento* </label>
    <!--<input class="form-group form-control-sm" type="date" id="date" name="dia">-->
    <select class="form-group form-control-sm" size="1" id="dia" name="dia"  aria-label=".form-select-1">
    </select>

    <select class="form-group form-control-sm" id="mes" name="mes" size="1" aria-label=".form-select-1" onchange="cargarDias()">

    </select>
    <select class="form-group form-control-sm" size="1" id="año" name="año" aria-label=".form-select-1">
    </select>
    
  </div><br>
  <div class="form-group" id="form-group-button">
  <button type="submit" value="submit" name="registrar"  class="btn btn-primary" id="registro- button"  onmouseover="cambiarBoton()" onmouseout="cambiarBoton2()">Crear</button><br>
  </div>
  </form>
</div><br>
</section>
<footer class="mt-auto" id="footer">
  <ul class="footlist">
    <li><a href="https://www.linkedin.com"><img
      class="link"
      src="img/icono-linkedin.jpeg"
    ></img></a></li>
  <li><a href="https://www.facebook.com">
      <img
        class="link"
        src="img/icon-facebook.jpeg"
      ></img></a></li>
  <li><a href="https://www.instagram.com">
          <img
            class="link"
            src="img/icon-instagram.jpeg"
          ></img></a></li>
    <li><a href="#">Privacidad</a></li>
    <li><a href="#">Terminos y condiciones</a></li>
    <li><a href="contacto.html">Contactanos</a></li>
  </ul>
  <span class="navbar-text navbar-left" id="span">
    >Copyright 2021, Todos los derechos reservados | Plataforma grupo9 ISPC
    | Practicas profesionalizantes
  </span>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="js/funciones9.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#pais").change(function(){
      $.get("php/provincias.php","pais="+$("#pais").val(), function(data){
				$("#provincia").html(data);
				//console.log(data);
			});
		});

		$("#provincia").change(function(){   
      console.log("hola")  
			$.get("php/localidades.php","provincia="+$("#provincia").val(), function(data){
				$("#localidad").html(data);
				console.log(data);
			});
		});
	});
</script>

</body>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       