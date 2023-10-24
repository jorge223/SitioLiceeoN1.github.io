
function mostrarlateral() {
    let seleccionar = document.querySelector(".Navegacion_lateral");

    if (seleccionar.id == "mostrar") {
        seleccionar.id = "oculto";
    } else {
        seleccionar.id = "mostrar";
        seleccionar.classList.remove("d-none");
    }
}

function cambiarImagen() {
    let menu = document.querySelector(".Menu");
    
    if (menu.src.endsWith("/Imagen/Menu.jpeg")) {
        menu.src = "../Imagen/Menu extendido.jpeg";
    } else {
        menu.src = "../Imagen/Menu.jpeg";
    }
}
function cambiarImagenFaq(event) {
    let menu = event.target.parentNode.querySelector("#Menu");
    if (menu.src.endsWith("/Imagen/mostrar.png")) {
        menu.src = "../Imagen/ocultar.png";
    } else {
        menu.src = "../Imagen/mostrar.png";
    }
}

function mostrarFaq(event) {
    let seleccionar = event.target.parentNode.querySelector("#faqContenido");
    if (seleccionar.classList.contains("d-none")) {
        seleccionar.classList.remove("d-none");
        seleccionar.classList.add("d-block");
    } else {
        seleccionar.classList.remove("d-block");
        seleccionar.classList.add("d-none");
        }
}
