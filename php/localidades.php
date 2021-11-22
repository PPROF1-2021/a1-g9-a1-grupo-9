<?php
include "conexion.php";
$query=$conexion->query("select * from localidades where codigoprovincia=$_GET[provincia] order by Descripcion");
$localidades = array();
while($r=$query->fetch_object()){ 
	$localidades[]=$r; 
}
print "<option selected disabled value=''>Localidad</option>";
if(count($localidades)>0){
foreach ($localidades as $l) {
	print "<option value='$l->Codigo'>$l->Descripcion</option>";
}
}
?>