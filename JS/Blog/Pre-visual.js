
window.onload = () => {
    let formAniadir = document.querySelector("#FormularioBlogAniadir");
    let inputAniadir = formAniadir.querySelectorAll("input:not([type='submit']), textarea");
    formAniadir.onsubmit = (event) => {
        event.preventDefault();
        aniadir(event, inputAniadir);
    }
    limiteBlog();
    cargarBlog(0);
    
}

function mostratOpciones() {
    let formulario = document.querySelector("#FormularioBlogAniadir");

    if (formulario.className === "ocultarForm") {
        formulario.className = "mostrarForm";
    } else {
        formulario.className = "ocultarForm";
    }
}

async function limiteBlog() {
    const urlLimite = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Blog.php?paginado=limitePaginadoBlog";
    let respuestaLimite = await fetch(urlLimite);
    let limite = await respuestaLimite.json();

    let cantidadBotones = Math.ceil(limite / 10);

    if (cantidadBotones > 0) {
        let botonesdiv = document.querySelector("#botonesPaginadoBlog");
        botonesdiv.innerHTML = "";
        for (let i = 0; i < cantidadBotones; i++) {
            crearBtn(i);
        }
    } else {
        alert("No hay blogs para mostrar");
    }
}

async function cargarBlog(i) {

    let contenedorBlog = document.getElementById("blogContenedor");
    contenedorBlog.innerHTML = "";
    let limitePaginado = 10 * i;
    const urlPaginado = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Blog.php?paginado=paginadoBlog&cantidad=${limitePaginado}`;
    let respuesta = await fetch(urlPaginado);
    let blog = await respuesta.json();
    let limiteLetras = 100;
    blog.forEach(Blog => {
        let enlace = document.createElement('a');
        enlace.href = `../../HTML/Blog/blog.html?consulta=ObtenerBlog&Id=${Blog.Id_pagina}`;

        enlace.innerHTML = `

            <h2 class="mt-3">${Blog.Titulo}</h2>
            <p>${Blog.Contenido.slice(0, limiteLetras) + "..."}</p>

            `
        contenedorBlog.appendChild(enlace);

    });
}

function crearBtn(i) {
    let botonesdiv = document.querySelector("#botonesPaginadoBlog");
    let botones = document.createElement("button");
    let li = document.createElement("li");
    li.className = "page-item";
    botones.className = "page-link";
    botones.innerHTML = i;

    botones.onclick = () => {
        cargarBlog(i);
    }
    li.appendChild(botones);
    botonesdiv.appendChild(li);
}

async function aniadir(event, inputAniadir) {
    let formData = new FormData(event.target);
    let titulo = formData.get('titulo'); 
    let contenido = formData.get('contenido');
    let categoria = formData.get('categoria');
    
    if (titulo.trim() == "" || contenido.trim() == "" || categoria == "Elegir...") {
        alert("Por favor, complete todos los campos antes de enviar el blog.");
        inputAniadir.forEach(function (inputAniadir) {
            inputAniadir.value = ""
            let select = document.querySelector('select');
            select.value = "Elegir";
        });
        return;
    }
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Blog.php?consulta=aniadirBlog";
    let config = {
        method: "POST",
        body: formData
    }
    await fetch(url, config);
    cargarBlog(0);
    limiteBlog();
    inputAniadir.forEach(function (inputAniadir) {
        inputAniadir.value = ""
        let select = document.querySelector('select');
        select.value = "Elegir";
    });
    
}



