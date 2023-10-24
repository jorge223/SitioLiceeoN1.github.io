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

function limpiarBotones(){
    let botonesUl = document.querySelector("#botonesPaginado");
    Array.from(botonesUl.querySelectorAll('li')).forEach(botonli =>{
        botonli.remove();
    });
}


async function tablaAdministrador() {

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
                <th scope="col">Cedula</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Contraseña</th>
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
    const urlLimite = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Administrador.php?paginado=limitePaginadoAdministrador`;
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

            const urlPaginado = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Administrador.php?paginado=paginadoAdministrador&cantidad=${limitePaginado}`;
            let respuestaPaginado = await fetch(urlPaginado);
            let datosPaginado = await respuestaPaginado.json();

            limpiarTabla();

            datosPaginado.forEach(Datos => {
                let row = tabla.insertRow(-1);
                let celdaCi = row.insertCell(0);
                let celdaNombre = row.insertCell(1);
                let celdaApellido = row.insertCell(2);
                let celdaContrasenia = row.insertCell(3);
                let celdaCheckTable = row.insertCell(4);
                let celdaModificar = row.insertCell(5);

                celdaCi.textContent = Datos.Ci_a;
                celdaNombre.textContent = Datos.Nombre;
                celdaApellido.textContent = Datos.Apellido;
                celdaContrasenia.textContent = Datos.Contrasenia;
                celdaCheckTable.appendChild(checktable());
                celdaModificar.appendChild(botonesModificar());
            });

            //Vacia los inputs si se usa el boton en el filtrado
            let inputCedula = document.querySelector("#cedula");
            let inputNombre = document.querySelector("#nombre");
            let inputApellido = document.querySelector("#apellido");

            inputCedula.value = '';
            inputNombre.value = '';
            inputApellido.value = '';
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
    let inputCedula = document.querySelector("#cedula");
    let inputNombre = document.querySelector("#nombre");
    let inputApellido = document.querySelector("#apellido");

    if (inputCedula.value == "" && inputNombre.value == "" && inputApellido.value == "") {
        limpiarTabla();
        onclickButton();

    } else {
        limpiarTabla();

        let cedula = inputCedula.value;
        let nombre = inputNombre.value;
        let apellido = inputApellido.value;

        const urlFiltrado = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Administrador.php?filtrado=filtradoAdministrador&cedula=${cedula}&nombre=${nombre}&apellido=${apellido}`;
        let respuestaFiltrado = await fetch(urlFiltrado);

        try{
                let datosFiltrados = await respuestaFiltrado.json();

                datosFiltrados.forEach(Datos => {
                    let row = tabla.insertRow(-1);
                    let celdaCi = row.insertCell(0);
                    let celdaNombre = row.insertCell(1);
                    let celdaApellido = row.insertCell(2);
                    let celdaContrasenia = row.insertCell(3);
                    let checkbox = row.insertCell(4);
                    let modificar = row.insertCell(5);

                    celdaCi.textContent = Datos.Ci_a;
                    celdaNombre.textContent = Datos.Nombre;
                    celdaApellido.textContent = Datos.Apellido;
                    celdaContrasenia.textContent = Datos.Contrasenia;
                    checkbox.appendChild(checktable());
                    modificar.appendChild(botonesModificar());
                });

            } catch (error) {
                alert("Ningun administrador encontrado");
                inputCedula.value = '';
                inputNombre.value = '';
                inputApellido.value = '';

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
    tablaAdministrador();
}
