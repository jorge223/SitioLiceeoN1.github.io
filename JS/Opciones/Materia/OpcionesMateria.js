function ocultarOpciones(opcion) {
    let botonesul = document.querySelector("#botonesPaginado");
    let filtrado = document.querySelector('#divFiltrado');
    let botonEliminar = document.querySelector('#eliminar');
    let botonAgregar = document.querySelector('#agregar');

    switch (opcion) {
        case "modificar":
            botonesul.className = 'd-none';
            filtrado.className = 'd-none';
            botonEliminar.className = 'd-none';
            botonAgregar.className = 'd-none';
            break;
        case "agregar":
            botonesul.className = 'd-none';
            filtrado.className = 'd-none';
            botonEliminar.className = 'd-none';
            break;
    }

}

function mostrarOpciones(opcion) {
    let botonesul = document.querySelector("#botonesPaginado");
    let filtrado = document.querySelector('#divFiltrado');
    let botonEliminar = document.querySelector('#eliminar');
    let botonAgregar = document.querySelector('#agregar');

    switch (opcion) {
        case "modificar":
            botonesul.className = 'pagination pagination-lg mt-3 d-flex justify-content-center';
            filtrado.className = 'input-group flex-nowrap mt-4';
            botonEliminar.className = 'd-block';
            botonAgregar.className = 'btn btn-outline-info mt-2 mb-2 mr-2';
            break;
        case "agregar":
            botonesul.className = 'pagination pagination-lg mt-3 d-flex justify-content-center';
            filtrado.className = 'input-group flex-nowrap mt-4';
            botonEliminar.className = 'd-block';
            break;
    }
}

async function obtenerDatos() {

    const urlProfesor = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?listado=listadoProfesor`;
    let respuestaProfesor = await fetch(urlProfesor);
    let datosProfesor = await respuestaProfesor.json();

    const urlAdministrador = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?listado=listadoAdministrador`;
    let respuestaAdministrador = await fetch(urlAdministrador);
    let datosAdministrador = await respuestaAdministrador.json();

    return { datosProfesor, datosAdministrador };
}

//Agregar

function crearInputs(celdas) {
    celdas.forEach(celda => {
        let input = document.createElement('input');
        celda.innerHTML = '';
        celda.appendChild(input);
    });
}

async function agregarMateria(celdas, selects) {

    let inputsFiltrado = Array.from(celdas).filter(inputs => inputs.every(input => input.value.trim() !== ''));

    let selectsFiltrado = selects.filter(select =>
        Array.from(select).every(option => option.value === "profesor" || option.value === "administrador")
    );

    if (inputsFiltrado.length !== 0 && selectsFiltrado.length !== 0) {
        let datos = '';

        for (let i = 0; i < inputsFiltrado.length; i++) {

            let indexProfesor = selectsFiltrado[i][0].selectedIndex;
            let indexAdministrador = selectsFiltrado[i][1].selectedIndex;

            console.log(indexProfesor);
            console.log(indexAdministrador);

            let formData = new FormData();
            formData.append('nombre', inputsFiltrado[i][0].value);
            formData.append('horario', inputsFiltrado[i][1].value);
            formData.append('cedulaprofesor', selectsFiltrado[i][0][indexProfesor].textContent.replace(/\D/g, ''));
            formData.append('cedulaadministrador', selectsFiltrado[i][1][indexAdministrador].textContent.replace(/\D/g, ''));

            let config = {
                method: 'POST',
                body: formData
            }

            const urlAniadir = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?consulta=aniadirMateria`;
            let respuesta = await fetch(urlAniadir, config);
            datos = await respuesta.text();
        }

        if (datos === "Duplicado") {
            alert("Materia ya existente en la base de datos, use otra cédula o elimine la existente");
        } else if (datos === "Agregado") {
            alert("Materia creada correctamente");
        } else {
            alert("Error al crear la materia");
        }
    } else {
        alert("Ingrese datos o seleccione las cedulas para agregar una materia");
    }
}

function eliminarCheckYModificar(fila) {
    let checkbox = fila.querySelector('input[type="checkbox"]');
    let modificar = document.querySelector('#botonModificar');

    if (checkbox && modificar) {
        let tdCheck = checkbox.parentNode;
        let tdModificar = modificar.parentNode;

        tdCheck.parentNode.removeChild(tdCheck);
        tdModificar.parentNode.removeChild(tdModificar);
    }
}



function crearSelects(celdas, datosProfesor, datosAdministrador) {

    let selectProfesor = document.createElement('select');
    datosProfesor.forEach((dato, i) => {
        let option = document.createElement('option');

        if (i === 0) {
            let option = document.createElement('option');
            option.innerHTML = 'Elegir profesor...';
            option.disabled = true;
            option.selected = true;

            selectProfesor.appendChild(option);
        }

        option.innerHTML = dato.Ci_p + "-" + dato.Nombre;
        option.value = "profesor";

        selectProfesor.appendChild(option);
    });

    celdas[0].innerHTML = '';
    celdas[0].appendChild(selectProfesor);

    let selectAdministrador = document.createElement('select');
    datosAdministrador.forEach((dato, i) => {
        let option = document.createElement('option');

        if (i === 0) {
            let option = document.createElement('option');
            option.innerHTML = 'Elegir administrador...';
            option.disabled = true;
            option.selected = true;

            selectAdministrador.appendChild(option);
        }

        option.innerHTML = dato.Ci_a + "-" + dato.Nombre;
        option.value = "administrador";

        selectAdministrador.appendChild(option);
    });

    celdas[1].innerHTML = '';
    celdas[1].appendChild(selectAdministrador);

}

let clickAgregar = false;
let inputs = [];
async function agregar() {

    //Oculta las demas opciones
    ocultarOpciones("agregar");

    let tabla = document.querySelector('#tabla');
    let cantidadFilas = 0;
    let filas = Array.from(tabla.querySelectorAll('tr:not(:has(th))'));


    //Crea y agrega mas filas si son menores a 10
    if (filas.length <= 10) {
        cantidadFilas = 10 - filas.length;

        for (let i = 0; i < cantidadFilas; i++) {
            let tr = document.createElement('tr');

            for (let h = 0; h < 4; h++) {

                let td = document.createElement('td');
                tr.appendChild(td);
            }
            tabla.appendChild(tr);
            filas.push(tr);
        }
    }

    //Primer click
    if (!clickAgregar) {
        let { datosProfesor, datosAdministrador } = await obtenerDatos();

        filas.forEach(fila => {

            //Elimina los checked y los botones modificar
            eliminarCheckYModificar(fila);

            //Crea los inputs y agrega en las filas
            crearInputs(fila.querySelectorAll('td:nth-child(-n+2)'));
            crearSelects(fila.querySelectorAll('td:nth-child(n+3)'), datosProfesor, datosAdministrador);
        });

        inputs = [];
        //Selecciona los inputs y les asigna placeholder
        filas.forEach((fila, i) => {
            inputs.push(Array.from(fila.querySelectorAll('input')));

            let nombre = inputs[i][0];
            let horario = inputs[i][1];

            nombre.placeholder = 'Nombre';
            horario.placeholder = 'Horario';

        });


    }

    //Segundo click
    if (clickAgregar) {
        let selects = Array.from(filas).map(fila => Array.from(fila.querySelectorAll('td select')));
        //Consulta agregar
        agregarMateria(inputs, selects);

        //Timeout para evitar perdida de datos
        setTimeout(function () {
            mostrarOpciones("agregar");
            tablaMateria();
        }, 500);
    }

    clickAgregar = !clickAgregar;
}

//Eliminar

async function eliminar() {

    let tabla = document.querySelector('#tabla');
    let checksTabla = Array.from(tabla.querySelectorAll('input[type="checkbox"]'));
    //Revisa si los checks estan seleccionados
    let seleccionados = Array.from(checksTabla.filter(checks => checks.checked));
    let Tr = [];

    //Revisa si hay algun checked seleccionado
    if (seleccionados.length === 0) {
        alert("Seleccione un checkbox para eliminar una materia");
    } else {
        for (let i = 0; i < seleccionados.length; i++) {
            Tr[i] = seleccionados[i].closest('tr');
        }

        let confirmar = confirm('¿Estas seguro que quieres eliminar las materias seleccionadas?');
        if (confirmar) {
            //Manda las consultas de las filas del checked
            Tr.forEach(async (tr) => {

                const url = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?consulta=eliminarMateria&cedulaprofesor=${tr.cells[2].textContent}&cedulaadministrador=${tr.cells[3].textContent}`;
                let respuesta = await fetch(url);

                tr.remove();
            });
            alert("Se elimino correctamente la materia");


        } else {
            alert("Cancelado...");
        }

    }

    //Timeout para evitar perdida de datos
    setTimeout(function () {
        tablaMateria();
    }, 500);

}

//Modificar

let clickModificar = false;
async function modificarMateria(filas, condiciones) {

    let filasInput = filas.slice(1);
    if (filasInput.every(fila => fila.children[0].value.trim() !== '')) {

        let indexProfesor = filas[2].children[0].selectedIndex;
        let indexAdministrador = filas[3].children[0].selectedIndex;

        let formData = new FormData();
        formData.append('nombre', filas[0].children[0].value);
        formData.append('horario', filas[1].children[0].value);
        formData.append('cedulaprofesor', filas[2].children[0][indexProfesor].textContent.replace(/\D/g, ''));
        formData.append('cedulaadministrador', filas[3].children[0][indexAdministrador].textContent.replace(/\D/g, ''));

        let config = {
            method: 'POST',
            body: formData
        }

        const urlModificar = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?consulta=modificarMateria&condicionprofesor=${condiciones[0]}&condicionadministrador=${condiciones[1]}`;
        let respuesta = await fetch(urlModificar, config);
        let datos =  await respuesta.text();

        if(datos === "Duplicado"){
            alert("Cedula de profesor y administrador en uso, utilice otra cedula o elimine la materia existente");
        }else if(datos === "Modificado"){
            alert("Materia modificada correctamente");
        }
    } else {
        alert("Ingrese los datos para modificar un profesor");
    }
}

let tds = [];
let condiciones = [];
async function modificar(event) {

    //Oculta las demas opciones
    ocultarOpciones("modificar");
    let botonClick = event.target;

    //Primer click
    if (!clickModificar) {
        let filas = botonClick.parentNode.parentNode;
        let filasTabla = Array.from(filas.parentNode.querySelectorAll('tr:not(:has(th))'));
        let filasNoInput = Array.from(filasTabla).filter(fila => fila !== filas);

        let { datosProfesor, datosAdministrador } = await obtenerDatos();

        //Vacia las filas no seleccionadas
        filasNoInput.forEach(fila => {
            fila.innerHTML = '';
        });

        let checkbox = filas.querySelector('input[type="checkbox"]');
        let tdCheck = checkbox.parentNode;
        let informacion = [];

        tdCheck.parentNode.removeChild(tdCheck);
        tds = Array.from(filas.children).slice(0, - 1);

        //Crea los botones y incorpora al td
        tds.forEach((td, i) => {

            if (i == 0 || i == 1) {
                let input = document.createElement('input');
                informacion.push(td.textContent);
                td.innerHTML = '';
                td.appendChild(input);
            }

            if (i == 2) {
                condiciones.push(td.textContent);
                td.innerHTML = '';
                let selectProfesor = document.createElement('select');
                datosProfesor.forEach((dato, i) => {
                    let option = document.createElement('option');

                    if (i === 0) {
                        let option = document.createElement('option');
                        option.innerHTML = 'Elegir profesor...';
                        option.disabled = true;
                        option.selected = true;

                        selectProfesor.appendChild(option);
                    }

                    option.innerHTML = dato.Ci_p + "-" + dato.Nombre;
                    option.value = "profesor";

                    selectProfesor.appendChild(option);
                });
                td.appendChild(selectProfesor);
            } else if (i == 3) {
                condiciones.push(td.textContent);
                td.innerHTML = '';
                let selectAdministrador = document.createElement('select');
                datosAdministrador.forEach((dato, i) => {
                    let option = document.createElement('option');

                    if (i === 0) {
                        let option = document.createElement('option');
                        option.innerHTML = 'Elegir administrador...';
                        option.disabled = true;
                        option.selected = true;

                        selectAdministrador.appendChild(option);
                    }

                    option.innerHTML = dato.Ci_a + "-" + dato.Nombre;
                    option.value = "administrador";

                    selectAdministrador.appendChild(option);

                });
                td.appendChild(selectAdministrador);
            }
        });

        tds[0].children[0].placeholder = informacion[0];
        tds[1].children[0].placeholder = informacion[1];
    }

    //Segundo click
    if (clickModificar) {

        //Manda la consulta update
        modificarMateria(tds, condiciones);

        //Timeout para evitar perdida de datos
        setTimeout(function () {
            mostrarOpciones("modificar")
            onclickButton();
        }, 500);

    }
    clickModificar = !clickModificar;
}