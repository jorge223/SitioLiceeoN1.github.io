function checktable() {

    let checktable = document.createElement("input");
    checktable.type = "checkbox";
    checktable.id = "check";
    return checktable;
}

function botonesModificar() {

    let botonModificar = document.createElement("button");
    botonModificar.onclick = (event) => {
        modificar(event);
    };
    botonModificar.id = "botonModificar";
    botonModificar.innerHTML = "Modificar";
    botonModificar.className = 'border border-dark btn-outline-secondary';
    return botonModificar;
}

function limpiarBotones() {
    let botonesUl = document.querySelector("#botonesPaginado");
    Array.from(botonesUl.querySelectorAll('li')).forEach(botonli => {
        botonli.remove();
    });
}


async function tablaMateria() {

    let botonesUl = document.querySelector("#botonesPaginado");
    let tabla = document.querySelector("#tabla");

    limpiarBotones();

    function limpiarTabla() {

        tabla.innerHTML = '';
        tabla.querySelectorAll('tr').forEach(columna => {
            columna.remove();
        });

        tabla.innerHTML += `
            <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Horario</th>
                <th scope="col">Cedula Profesor</th>
                <th scope="col">Cedula Administrador</th>
                <th scope="col">            
                    <button class="btn btn-outline-danger" id="eliminar" onclick="eliminar()">Eliminar</button>
                </th>
                <th scope="col">            
                    <button class="btn btn-outline-info mt-2 mb-2 mr-2" id="agregar" onclick="agregar()">Agregar</button>
                </th>
            </tr>
        `;
    }

    //Obtiene la cantidad de botones
    let cantidadBotones = 0;
    const urlLimite = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?paginado=limitePaginadoMateria`;
    let respuestaLimite = await fetch(urlLimite);
    let limite = await respuestaLimite.json();
    cantidadBotones = Math.ceil(limite / 10);

    function crearBotones(i) {
        let boton = document.createElement("button");
        boton.className = "page-link btn-sm";
        boton.id = "botonesPaginado"
        boton.innerHTML = i;

        let li = document.createElement("li");
        li.className = "page-item";
        li.id = "contenedorBotones";
        li.appendChild(boton);

        botonesUl.appendChild(li);

        boton.onclick = async () => {
            let limitePaginado = 10 * i;

            const urlPaginado = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?paginado=paginadoMateria&cantidad=${limitePaginado}`;
            let respuestaPaginado = await fetch(urlPaginado);
            let datosPaginado = await respuestaPaginado.json();

            limpiarTabla();

            datosPaginado.forEach(Datos => {
                let row = tabla.insertRow(-1);
                let celdaNombre = row.insertCell(0);
                let celdaHorario = row.insertCell(1);
                let celdaCedulaProfesor = row.insertCell(2);
                let celdaCedulaAdministrador = row.insertCell(3);
                let celdaCheckTable = row.insertCell(4);
                let celdaModificar = row.insertCell(5);

                celdaNombre.textContent = Datos.Nombre;
                celdaHorario.textContent = Datos.Horario;
                celdaCedulaProfesor.textContent = Datos.Ci_p;
                celdaCedulaAdministrador.textContent = Datos.Ci_a;
                celdaCheckTable.appendChild(checktable());
                celdaModificar.appendChild(botonesModificar());
            });

            //Vacia los inputs si se usa el boton en el filtrado
            let inputNombre = document.querySelector("#nombre");
            let inputHorario = document.querySelector("#horario");
            let inputCedulaProfesor = document.querySelector("#cedulaProfesor");
            let inputCedulaAdministrador = document.querySelector("#cedulaAdministrador");

            inputNombre.value = '';
            inputHorario.value = '';
            inputCedulaProfesor.value = '';
            inputCedulaAdministrador.value = '';
        };

        if (i == 0) {
            onclickButton = boton.onclick;
        }
    }

    //Crea los botones
    for (let i = 0; i < cantidadBotones; i++) {
        crearBotones(i);
    }


    async function actualizarFiltrado() {

        let inputNombre = document.querySelector("#nombre");
        let inputHorario = document.querySelector("#horario");
        let inputCedulaProfesor = document.querySelector("#cedulaProfesor");
        let inputCedulaAdministrador = document.querySelector("#cedulaAdministrador");

        if (inputNombre.value == "" && inputHorario.value == "" && inputCedulaProfesor.value == "" && inputCedulaAdministrador.value == "") {
            limpiarTabla();
            onclickButton();

        } else {
            limpiarTabla();

            let nombre = inputNombre.value;
            let horario = inputHorario.value;
            let cedulaProfesor = inputCedulaProfesor.value;
            let cedulaAdministrador = inputCedulaAdministrador.value;

            const urlFiltrado = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Materia.php?filtrado=filtradoMateria&nombre=${nombre}&horario=${horario}&cedulaprofesor=${cedulaProfesor}&cedulaadministrador=${cedulaAdministrador}`;
            let respuestaFiltrado = await fetch(urlFiltrado);

            try {
                let datosFiltrados = await respuestaFiltrado.json();

                datosFiltrados.forEach(Datos => {
                    let row = tabla.insertRow(-1);
                    let celdaNombre = row.insertCell(0);
                    let celdaHorario = row.insertCell(1);
                    let celdaCedulaProfesor = row.insertCell(2);
                    let celdaCedulaAdministrador = row.insertCell(3);
                    let celdaCheckTable = row.insertCell(4);
                    let celdaModificar = row.insertCell(5);

                    celdaNombre.textContent = Datos.Nombre;
                    celdaHorario.textContent = Datos.Horario;
                    celdaCedulaProfesor.textContent = Datos.Ci_p;
                    celdaCedulaAdministrador.textContent = Datos.Ci_a;
                    celdaCheckTable.appendChild(checktable());
                    celdaModificar.appendChild(botonesModificar());
                });

            } catch (error) {
                alert("Ninguna materia encontrada");
                inputNombre.value = '';
                inputHorario.value = '';
                inputCedulaProfesor.value = '';
                inputCedulaAdministrador.value = '';

                onclickButton();
            }
        }
    }


    let botonFiltrado = document.querySelector("#filtrado");
    botonFiltrado.onclick = actualizarFiltrado;

    //Actualizo el filtrado segun los parametros que ponga el usuario
    actualizarFiltrado();
    onclickButton();
}



window.onload = () => {
    tablaMateria();
}
