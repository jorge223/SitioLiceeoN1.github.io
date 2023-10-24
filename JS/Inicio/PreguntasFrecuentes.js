window.addEventListener('load', function() {
    let formAniadir = document.querySelector("#FormularioFaq");
    formAniadir.onsubmit = (event) => {
        aniadirFaq(event);
    }
    cargarFaq();
});

async function aniadirFaq(event) {
    event.preventDefault();
    let Titulo = document.querySelector("#TituloFaq");
    let Descripcion = document.querySelector("#TituloDescripcion");
    if (Titulo.value.trim() == "" || Descripcion.value.trim() == "") {
        alert("Por favor, complete todos los campos antes.");
        return;
    }
    let formData = new FormData(event.target);
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/PreguntasFrecuentes.php?consulta=aniadirFaq";
    let config = {
        method: "POST",
        body: formData
    }
    await fetch(url, config);
    location.reload();
}
async function cargarFaq() {

    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/PreguntasFrecuentes.php?consulta=selectTFaq";
    let respuesta = await fetch(url);
    let faq = await respuesta.json();

    let Contenedor = document.getElementById('Contenedor');
    faq.forEach(Faq => {
        let div = document.createElement('div');
        let contenidoOriginal = '';
        div.innerHTML = contenidoOriginal;
        
        div.innerHTML = `
            <select class="selectOpciones mt-5 custom-select">
                <option value="Opciones" selected>Opciones...</option>
                <option value="Eliminar">Eliminar</option>
                <option value="Modificar">Modificar</option>
            </select>

                <div class="card-body">
                    <img src="../Imagen/mostrar.png" alt="error" id="Menu" onclick="mostrarFaq(event), cambiarImagenFaq(event);">
                    <h2 class="mt-3 card-title">${Faq.Titulo}</h2>
                    <div class="d-none" id="faqContenido">
                    <p class="card-text">${Faq.Contenido}</p>
                    <p class="card-text">${Faq.Fecha}</p>
                    </div>
                </div>
        `;

        let select = div.querySelector('select');
        select.addEventListener('change', function () {
            let seleccionado = select.value;
            if (seleccionado == "Eliminar") {
                let confirmacion = window.confirm("¿Deseas eliminar el elemento?");
                if (confirmacion) {
                    window.alert("Se elimino correctamene");
                    eliminarFaq(Faq.Id_pagina);
                } else {
                    select.value = "Opciones";
                }
            } else if (seleccionado == "Modificar") {
                modificarFaq(Faq.Id_pagina, div, event);
            } else if (seleccionado == "Opciones") {
                Contenedor.innerHTML = "";
                    cargarFaq();
                
            }
        });
        Contenedor.appendChild(div);
    });

}


async function eliminarFaq(idPagina) {
    const url = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/PreguntasFrecuentes.php?consulta=eliminarFaq&id=${idPagina}`;
    await fetch(url);
    location.reload();
}

async function modificarFaq(idPagina, div, event) {
    let cambiarEtiquetaH2 = document.createElement('input');
    let cambiarEtiquetaP = document.createElement('input');
    let h2 = div.querySelector('h2');
    let p = div.querySelector('p');
    let btnModificar = document.createElement('button');
    let seleccionar = event.target.parentNode.querySelector("#faqContenido");
    let menu = event.target.parentNode.querySelector("#Menu");
    menu.remove();
    seleccionar.classList.add("d-block");


    btnModificar.textContent = "Modificar";
    cambiarEtiquetaH2.value = h2.textContent;
    cambiarEtiquetaP.value = p.textContent;
    cambiarEtiquetaH2.id = "titulo";
    cambiarEtiquetaP.id = "contenido";
    cambiarEtiquetaH2.placeholder = "Ingresar Titulo";
    cambiarEtiquetaP.placeholder = "Ingresar Descripcion";
    h2.textContent = "";
    p.textContent = "";

    div.appendChild(btnModificar);
    h2.appendChild(cambiarEtiquetaH2);
    p.appendChild(cambiarEtiquetaP);

    btnModificar.onclick = async () => {
        let nuevoTitulo = cambiarEtiquetaH2.value;
        let nuevoContenido = cambiarEtiquetaP.value;
        let formData = new FormData();
        formData.append("titulo", nuevoTitulo);
        formData.append("contenido", nuevoContenido);

        if (nuevoTitulo.trim() == "" || nuevoContenido.trim() == "") {
            alert("Por favor, complete todos los campos antes.");
            return;
        }

        const url = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/PreguntasFrecuentes.php?consulta=modificarFaq&Id=${idPagina}`;
        let config = {
            method: "POST",
            body: formData
        }
        console.log(url);
        await fetch(url, config);
        location.reload();
    }
}

