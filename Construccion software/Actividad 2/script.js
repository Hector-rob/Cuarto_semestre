function mostrarMensaje(){
    nombre = document.getElementById("nombre").value;
    apellidos = document.getElementById("apellidos").value;
    edad = document.getElementById("edad").value; 
    datos = "Tu nombre es: " + nombre + "\<br>Tus apellido es: " + apellidos + 
    "\<br>Tu edad: " + edad + " años\<br>Que gusto tenerte por aqui!" ;
    document.getElementById("datos").innerHTML = datos
}