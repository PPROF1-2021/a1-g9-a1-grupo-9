<?php
include "conexion.php";
$query=$conexion->query("select * from provincias where codigopais=$_GET[pais] order by Descripcion");
$provincias = array();
while($r=$query->fetch_object()){ $provincias[]=$r; }
print "<option selected disabled value=''>Provincia</option>";
if(count($provincias)>0){

foreach ($provincias as $p) {
	print "<option value='$p->Codigo'>$p->Descripcion</option>";
}
}
?>