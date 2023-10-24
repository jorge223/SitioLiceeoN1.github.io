window.onload = () => {
    let Comentarios = document.querySelector("#Comentarios");
    let inputAniadir = Comentarios.querySelectorAll("input:not([type='submit'])");

    Comentarios.onsubmit = (event) => {
        comentarBlog(event, inputAniadir);
    }
    likeBlog();
    blogIndividual();
    mostrarComentario();
}

async function blogIndividual() {
    const urlParameto = new URLSearchParams(window.location.search);
    const blogId = urlParameto.get("Id");
    const url = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/Blog.php?consulta=ObtenerBlog&Id=${blogId}`;
    let respuesta = await fetch(url);
    let Blog = await respuesta.json();
    const blogIndividual = document.getElementById('blogIndividual');
    blogIndividual.innerHTML = `
        <select class="selectOpciones custom-select mt-3">
            <option value="Seleccionar" selected>Seleccionar...</option>
            <option value="Eliminar">Eliminar</option>
            <option value="Modificar">Modificar</option>
        </select>
        <h2 class="mt-3">${Blog[0].Titulo}</h2>
        <p>${Blog[0].Contenido}</p>
        <p>Fecha: ${Blog[0].Fecha}/ Hora: ${Blog[0].Hora}</p>
        <p>Dirigido para: ${Blog[0].Categoria}</p>
    `;
    let select = blogIndividual.querySelector('select');
    select.addEventListener('change', function () {
        let seleccionado = select.value;
        if (seleccionado == "Eliminar") {
            let confirmacion = window.confirm("¿Deseas eliminar el blog?");
            if (confirmacion) {
                window.alert("Se elimino correctamene el blog");
                eliminarBlog(Blog[0].Id_pagina);
                eliminarComentario(Blog[0].Id_pagina);
                window.location.href = "../../HTML/Blog/pre-visual.html";
            }else{
                select.value = "Seleccionar";
            }
        } else if (seleccionado == "Modificar") {
            modificarBlog(Blog[0].Id_pagina);
        }
    });
}

async function likeBlog() {
    let estado = true;
    let like = document.getElementById("like");
    const urlParametro = new URLSearchParams(window.location.search);
    const blogId = urlParametro.get("Id");
    const urlLikes = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/Blog.php?consulta=obtenerLike&id=${blogId}`;
    let img = document.createElement('img');
    let respuestaLikes = await fetch(urlLikes);
    let resultado = await respuestaLikes.json();
    let likecuenta = 0;
    
    img.src = "../../Imagen/like.webp";
    if (resultado && resultado.length > 0 && resultado[0].Likes !== undefined) {
        likecuenta = resultado[0].Likes;
    }
    like.appendChild(img);
    like.appendChild(document.createTextNode(likecuenta));
    like.onclick = async function () {
        if (estado == true) {
            likecuenta++;
            estado = false;
        } else if (estado == false) {
            likecuenta--;
            estado = true;
        }
        like.innerHTML = '';
        like.appendChild(img);
        like.appendChild(document.createTextNode(likecuenta));
        const urlParametro = new URLSearchParams(window.location.search);
        const blogId = urlParametro.get("Id");
        const url = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/Blog.php?consulta=darLike&id=${blogId}&like=${likecuenta}`;
        await fetch(url);
    };
}

async function comentarBlog(event, inputAniadir) {
    event.preventDefault();
    let comentario = document.querySelector("#comentarioInput").value;
    if(comentario.trim()==""){
        alert("Por favor, introduza tu comentario para enviar el comentario.");
        return;
    }
    let formData = new FormData(event.target);
    const urlParametro = new URLSearchParams(window.location.search);
    const blogId = urlParametro.get("Id");
    const url = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/Blog.php?consulta=comentarBlog&id_pagina=${blogId}&id_comentario&comentarioInput`;
    let config = {
        method: "POST",
        body: formData
    }
    await fetch(url, config);
    inputAniadir.forEach(function (inputAniadir) {
        inputAniadir.value = "";
    });
    window.location.reload();

}

async function mostrarComentario() {
    try {

        const urlParameto = new URLSearchParams(window.location.search);
        const blogId = urlParameto.get("Id");
        const url = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/Blog.php?consulta=obtenerComentario&id=${blogId}`;
        let respuesta = await fetch(url);
        let comentario = await respuesta.json();
        const comentarioDiv = document.getElementById('comentarioDiv');
        comentario.forEach(Comentario => {
            let divContenedor = document.createElement('div');
            let eliminarBtn = document.createElement('button');
            eliminarBtn.className = "btn btn-outline-light";
            divContenedor.innerHTML = `
                <p>${Comentario.Contenido}</p>
                <p>Fecha: ${Comentario.Fecha}</p>
            `;
            eliminarBtn.innerText = "Eliminar";
            divContenedor.appendChild(eliminarBtn);
            comentarioDiv.appendChild(divContenedor);
            eliminarBtn.onclick = () => {
                eliminarComentario(Comentario.Id_comentario);
            }
        });
    } catch (error) { }
}

async function eliminarBlog(idPagina) {
    const urlBlog = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Blog.php?consulta=eliminarBlog&id=${idPagina}`;
    await fetch(urlBlog);
}
async function eliminarTodosComentarios(idPagina) {
    const urlComentario = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Blog.php?consulta=eliminarTodosComentarios&id=${idPagina}`;
    await fetch(urlComentario);
}

async function eliminarComentario(idComentario) {
    const urlComentario = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Blog.php?consulta=eliminarComentario&id=${idComentario}`;
    await fetch(urlComentario);
    location.reload();
}


function modificarBlog(idPagina) {

    let cambiarEtiquetaH2 = document.createElement('input');
    let cambiarEtiquetaPcontenido = document.createElement('textarea');
    let contenedorBlog = document.querySelector("#blogIndividual");
    let h2 = contenedorBlog.querySelector('h2');
    let p = contenedorBlog.querySelectorAll('p');
    let modificarBtn = document.createElement('button');

    let arreglodeElementosPcontenido = Array.from(p);
    let seleccionarPcontenido = arreglodeElementosPcontenido.slice(0, 1);

    let arreglodeElementosPcategoria = Array.from(p);
    let seleccionarPcategoria = arreglodeElementosPcategoria.slice(-1);

    cambiarEtiquetaH2.value = h2.textContent;
    cambiarEtiquetaPcontenido.value = seleccionarPcontenido[0].textContent;
    modificarBtn.innerText = "Modificar";
    modificarBtn.type = "button";
    modificarBtn.id = "Modificar";
    modificarBtn.className = "btn btn-secondary";
    cambiarEtiquetaPcontenido.id = "Contenido";
    cambiarEtiquetaH2.id = "Titulo";
    h2.textContent = "";
    seleccionarPcontenido[0].textContent = "";
    seleccionarPcategoria[0].innerHTML = `
    <select name="Categoria">
        <option selected>Seleccionar...</option>
        <option>Administrador</option>
        <option>Profesor</option>
        <option>Estudiante</option>
    </select>
    `;
    cambiarEtiquetaH2.placeholder = "Ingresar Titulo";
    cambiarEtiquetaPcontenido.placeholder = "Ingresar Contenido";
    contenedorBlog.style.paddingTop = "50px";
    contenedorBlog.appendChild(modificarBtn);
    h2.appendChild(cambiarEtiquetaH2);
    seleccionarPcontenido[0].appendChild(cambiarEtiquetaPcontenido);

    modificarBtn.onclick = async () => {

        let nuevoTitulo = cambiarEtiquetaH2.value;
        let nuevoContenido = cambiarEtiquetaPcontenido.value;
        let nuevaCategoria = document.querySelector("select[name='Categoria']").value;

        let formData = new FormData();
        formData.append("Titulo", nuevoTitulo);
        formData.append("Contenido", nuevoContenido);
        formData.append("Categoria", nuevaCategoria);

        if (nuevoTitulo.trim() == "" || nuevoContenido.trim() == "" || nuevaCategoria == "Seleccionar...") {
            alert("Por favor, complete todos los campos antes de enviar el blog.");
            location.reload();
            return;
        }

        const url = `http://localhost/Sitio_Liceo_N%C2%BA1/PHP/Opciones/Blog.php?consulta=modificarBlog&Id=${idPagina}`;
        let config = {
            method: "POST",
            body: formData
        }
        await fetch(url, config);
    }
}
