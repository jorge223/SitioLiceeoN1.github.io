window.onload = () => {

    let formSelect = document.querySelector("#FormularioAvisoSelect");

    let formSelectTodo = document.querySelector("#FormularioAvisoSelectTodo");

    let formAniadir = document.querySelector("#FormularioAvisoAniadir");
    let inputAniadir = formAniadir.querySelectorAll("input:not([type='submit'])");

    let formEliminar = document.querySelector("#FormularioAvisoEliminar");

    let formModificar = document.querySelector("#FormularioAvisoModificar");
    let inputModificar = formModificar.querySelectorAll("input:not([type='submit'])");

    formSelect.onsubmit = (event) => {
        select(event);
    }

    formSelectTodo.onsubmit = (event) => {
        selectTodo();
    }

    formAniadir.onsubmit = (event) => {
        aniadir(event, input);
    }

    formEliminar.onsubmit = (event) => {
        eliminar(event);
    }

    formModificar.onsubmit = (event) => {
        modificar(event, input);
    }

}

async function select(event) {

    event.preventDefault();
    console.log("a");
    let formData = new FormData(event.target);
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Aviso.php?consulta=selectAviso";
    let config = {
        method: "POST",
        body: formData
    }
    let respuesta = await fetch(url, config);

}

async function selectTodo() {

    event.preventDefault();
    console.log("a");
    let formData = new FormData();
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Aviso.php?consulta=selectTAviso";
    let config = {
        method: "POST",
        body: formData
    }
    let respuesta = await fetch(url, config);

}

async function aniadir(event, input) {

    event.preventDefault();
    console.log("a");
    let formData = new FormData(event.target);
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Aviso.php?consulta=aniadirAviso";
    let config = {
        method: "POST",
        body: formData
    }
    await fetch(url, config);
    input.forEach(function (input) {
        input.value = ""
    });
}

async function eliminar(event) {

    event.preventDefault();
    console.log("a");
    let formData = new FormData(event.target);
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Aviso.php?consulta=eliminarAviso";
    let config = {
        method: "POST",
        body: formData
    }
    await fetch(url, config);
}

async function modificar(event, input) {

    event.preventDefault();
    console.log("a");
    let formData = new FormData(event.target);
    const url = "http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Aviso.php?consulta=modificarAviso";
    let config = {
        method: "POST",
        body: formData
    }
    await fetch(url, config);
    input.forEach(function (input) {
        input.value = ""
    });
}