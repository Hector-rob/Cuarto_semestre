//Aquí va codigo y logica
//declarar variables
x = 5
console.log("Hola desde fuera")
function ejemplo(){
    console.log("Hola buenas noches")
}
function boton2(){
    alert("boton 2")
}
function boton3(){
    //Podemos modificar por id los elementos
    document.getElementById("parrafito").innerHTML = "<h1> cambie <h1/>"
}

function cambiarInput(){
    ejemplito = document.getElementById("textito").value;
    alert(ejemplito);
    document.getElementById("textito").value = "Hola desde js";



}