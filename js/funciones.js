// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')
  
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
  
          form.classList.add('was-validated')
        }, false)
      })
  })()


function permiso(){
  if(calcularEdad()<23){
    alert("Menor de Edad!!!")
  }else{
    alert("mayor de Edad!!!")

  }
}



function calcularEdad() {

    let mes=document.getElementById("mes");
    let año=document.getElementById("año");
    let dia=document.getElementById("dia");

    var fechaActual = new Date();
    var nacimiento = new Date(año.value,mes.value,dia.value)
    var edad = fechaActual.getFullYear() - nacimiento.getFullYear();
    var m = fechaActual.getMonth() - nacimiento.getMonth();

    if (m < 0 || (m === 0 && fechaActual.getDate() < nacimiento.getDate())) {
        edad--;
    }
    
    return edad;
}

  


 function cargarMeses() {
    //Inicializamos el array.
    var array = ["Enero", "Febrero", "Marzo", "Abril", "Mayo","Junio","Julio","Agosto","Septiembre", "Octubre","Noviembre","Diciembre"];
    //Pasamos a la funcion addOptions(el ID del select, las provincias cargadas en el array).
    addOptions("meses", array);
}

//Funcion para agregar opciones a un <select>.
function addOptions(domElement, array) {
  var selector = document.getElementsByName(domElement)[0];
  //Recorremos el array.
  for (val in array) {
      var opcion = document.createElement("option");
      opcion.text = array[val];
      selector.add(opcion);
  }
}