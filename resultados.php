<?php 
  include("php/conexion.php");
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
    rel="shortcut icon"
    href="img/students.png"
    type="image/x-icon"
   />
    <title>Resultados</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/styles.css" />
    <link
      rel="shortcut icon"
      href="https://img.icons8.com/wired/64/000000/students.png"
      type="image/x-icon"
    />
  </head>
  <body class="d-flex flex-column min-vh-100" id="body">
    <header>
      <nav class="navbar navbar-light" id="navbar-general">
        <div class="container-fluid">
          <a class="navbar-brand" href="index.html"
            ><img src="https://img.icons8.com/wired/64/000000/students.png" />
            Plataforma Educativa</a>
          <a class="navbar-brand" href="login.html">Iniciar Sesion</a>
          <a class="navbar-brand" href="registro.php">Registrarse</a>
          <a class="navbar-brand" href="perfil.html">Perfil</a>
          <form class="d-flex">
            <input
              type="search"
              class="form-control me-2"
              placeholder="Buscar"
              aria-label="Search"
            />
            <a href="resultados.html"></a>
            <button class="btn btn-outline-dark" id="buscar-button">
              Buscar
            </button>
          </form>
        </div>
      </nav>
    </header>
    <section>
      <div class="container-fluid">
      <article id="cards">
        <div class="card mb-6" style="max-width: 800px" id="card" >
        <?php
          $sql="select * from cursos";
          $resultado=mysqli_query($conexion,$sql);
          while($mostrar=mysqli_fetch_array($resultado)){ 
          ?>

          <div class="row g-0">
            <div class="col-md-4">
              <a href="curso.html">
              <img
                src="<?php echo "img\\" . $mostrar['Logo']; ?>"
                class="img-fluid rounded-start"
                alt="html image"
              />
            </a>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <a href="curso.html"><h5 class="card-title"><?php echo $mostrar['Nombre']?></h5></a>
                <p class="card-text">
                <?php echo $mostrar['Descripcion']?>
                </p>
              </div>
            </div>
          </div>
          <?php
      }
      ?>
        </div>
        
      </article>
      </div>
    </section>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
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
  </body>
</html>
