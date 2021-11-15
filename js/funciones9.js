

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


function cargarDatosFechas(){
  cargarMeses();
  cargarDias();
  cargarAños();
}







function cargarMeses(){
  var array = ["Enero", "Febrero", "Marzo", "Abril", "Mayo","Junio","Julio","Agosto","Septiembre", "Octubre","Noviembre","Diciembre"];
  select=document.getElementById("mes");
  for (let i = 0; i < array.length; i++) {
    option=document.createElement('option');
    option.value=i+1;
    option.text=array[i];
    select.appendChild(option);
  }
}

function cargarDias(){
  mes=document.getElementById("mes");
  let dias


  switch (parseInt(mes.value)) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      dias=31;
      break;
    case 2:
      dias=28;
      break;
    case 4:
    case 6:
    case 9:
    case 11:
      dias=30;
      break;
  }
  sel=document.getElementById("dia");
  
  for (let i = sel.options.length; i >=0; i--){
    sel.remove(i);
  }


  for (let i = 1; i <= dias; i++) {
    option=document.createElement('option');
    option.value=i;
    option.text=i
    sel.appendChild(option);
  }
}


function cargarAños(){
  select=document.getElementById("año");
  fAct=new Date();
  for (let i = fAct.getFullYear()-80; i <= fAct.getFullYear(); i++) {
    option=document.createElement('option');
    option.value=i;
    option.text=i
    select.appendChild(option);
  }
}

function validar(){
  let pas=document.getElementById("pwd");
  let pas2=document.getElementById("pwd1");
  
  if(pas.value!=pas2.value){
    alert("Los Password no coinciden!!!!!")
    return false
  }else{
    if(calcularEdad()<17){
      alert("Debe ser mayor a 17 años para poder registrarse!!!")
      return false
    }else{
      return true
    }
    
  }
}




function validarRegistro(){
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
        }else if(validar()==true){
          mostrarDatos(event)
        }

        form.classList.add('was-validated')
      }, false)
    })

    return false;
}



function mostrarDatos(){


  var className = "encabezado-datos";
  let nom = document.getElementById('name');
  let ap = document.getElementById('lastname');
  let email = document.getElementById('email');

  const formularioDeRegistro =document.getElementById("container-registro")
  const contenedorDeDatos = document.getElementById('contenedor');



  formularioDeRegistro.classList.add('borrar');
  //document.removeChild(formularioDeRegistro)
  contenedorDeDatos.classList.add('contenedorDatos');
  
  
  if(contenedorDeDatos.getElementsByClassName(className).length == 0){
    
    fo =document.getElementById("a")
    fo.innerHTML="Registrado Exitosamente <br> Nombre: " + nom.value + " Apellido: " + ap.value + "<br>Email: " + email.value; 
    setTimeout(function redirect(){
      window.location.href='index.html', false;
    }, 4500);
  
  }

}


function validarLog(){
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
}

