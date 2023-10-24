window.addEventListener('load', function() {
    let formAniadirGaleria = document.querySelector("#FormularioGaleria");
    formAniadirGaleria.onsubmit = (event) => {
        aniadirGaleria(event);
    }
    cargarGaleria();
});

async function aniadirGaleria(event) {
    event.preventDefault();
    let Titulo = document.querySelector("#Titulo");
    let Descripcion = document.querySelector("#Descripcion");
    let img = document.querySelector("#Foto");
    if (Titulo.value.trim() == "" || Descripcion.value.trim() == "" || img.files.length == 0) {
        alert("Por favor, complete todos los campos antes.");
        return;
    }
    let formData = new FormData(event.target);
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Galeria.php?consulta=aniadirGaleria";
    let config = {
        method: "POST",
        body: formData
    }
    await fetch(url, config);
    location.reload();

}
async function cargarGaleria() {

    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Galeria.php?consulta=selectTGaleria";
    let respuesta = await fetch(url);
    let galeria = await respuesta.json();

    let imgGaleria = document.getElementById('imgGaleria');

    galeria.forEach(Galeria => {
        let div = document.createElement('div');
        div.innerHTML = `
            <select class="selectOpciones mt-5 custom-select">
                <option value="Opciones" selected>Opciones...</option>
                <option value="Eliminar">Eliminar</option>
                <option value="Modificar">Modificar</option>
            </select>

            <div class="card mb-3 mt-4">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="${Galeria.Ruta}" alt="error">
                    </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h2 class="mt-3 card-title">${Galeria.Titulo}</h2>
                    <p class="card-text">${Galeria.Contenido}</p>
                </div>
            </div>
          </div>
        </div>
        `;

        let select = div.querySelector('select');
        select.addEventListener('change', function () {
            let seleccionado = select.value;
            if (seleccionado == "Eliminar") {
                let confirmacion = window.confirm("¿Deseas eliminar la Imagen?");
                if (confirmacion) {
                    window.alert("Se elimino correctamene");
                    eliminarGaleria(Galeria.Id_pagina);
                } else {
                    select.value = "Opciones";
                }
            } else if (seleccionado == "Modificar") {
                modificarGaleria(Galeria.Id_pagina, div);
            }
        });

        imgGaleria.appendChild(div);
    });

}


async function eliminarGaleria(idPagina) {
    const url = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Galeria.php?consulta=eliminarGaleria&id=${idPagina}`;
    await fetch(url);
    location.reload();
}

async function modificarGaleria(idPagina, div) {
    console.log("modificar");
    console.log(idPagina);
    let cambiarEtiquetaH2 = document.createElement('input');
    let cambiarEtiquetaP = document.createElement('input');
    let cambiarImg = document.createElement('input');
    let h2 = div.querySelector('h2');
    let p = div.querySelector('p');
    let img = div.querySelector('img');
    let btnModificar = document.createElement('button');

    cambiarImg.type = "file";
    btnModificar.textContent = "Modificar";
    cambiarEtiquetaH2.value = h2.textContent;
    cambiarEtiquetaP.value = p.textContent;
    cambiarEtiquetaH2.id = "titulo";
    cambiarEtiquetaP.id = "descripcion";
    cambiarImg.id = "foto";
    cambiarEtiquetaH2.placeholder = "Ingresar Titulo";
    cambiarEtiquetaP.placeholder = "Ingresar Descripcion";
    h2.textContent = "";
    p.textContent = "";
    img.parentNode.replaceChild(cambiarImg, img);

    div.appendChild(cambiarImg);
    div.appendChild(btnModificar);
    h2.appendChild(cambiarEtiquetaH2);
    p.appendChild(cambiarEtiquetaP);

    btnModificar.onclick = async () => {
        let nuevoTitulo = cambiarEtiquetaH2.value;
        let nuevoContenido = cambiarEtiquetaP.value;
        let nuevaImagen = cambiarImg.files[0];
        let formData = new FormData();
        formData.append("titulo", nuevoTitulo);
        formData.append("descripcion", nuevoContenido);
        formData.append("foto", nuevaImagen);

        if (nuevoTitulo.trim() == "" || nuevoContenido.trim() == "" || !nuevaImagen) {
            alert("Por favor, complete todos los campos antes.");
            return;
        }

        const url = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/Galeria.php?consulta=modificarGaleria&Id=${idPagina}`;
        let config = {
            method: "POST",
            body: formData
        }
        console.log(url);
        await fetch(url, config);
        location.reload();
    }
}

