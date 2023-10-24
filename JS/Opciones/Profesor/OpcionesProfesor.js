function ocultarOpciones(opcion){
    let botonesul = document.querySelector("#botonesPaginado");
    let filtrado = document.querySelector('#divFiltrado');
    let botonEliminar = document.querySelector('#eliminar');
    let botonAgregar = document.querySelector('#agregar');

    switch(opcion){
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

function mostrarOpciones(opcion){
    let botonesul = document.querySelector("#botonesPaginado");
    let filtrado = document.querySelector('#divFiltrado');
    let botonEliminar = document.querySelector('#eliminar');
    let botonAgregar = document.querySelector('#agregar');

    switch(opcion){
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

//Agregar

function crearInputs(celdas){
    celdas.forEach(celda =>{
        let input = document.createElement('input');
        celda.innerHTML = '';
        celda.appendChild(input);   
    });
}

async function agregarProfesor(celdas){

    let inputsFiltrado = Array.from(celdas).filter(inputs => inputs.every(input => input.value.trim() !== ''));
    
    if(inputsFiltrado.length !== 0){
        let datos = '';

        for(let i = 0; i<inputsFiltrado.length; i++){
            let formData = new FormData();
            formData.append('cedula', inputsFiltrado[i][0].value);
            formData.append('nombre', inputsFiltrado[i][1].value);
            formData.append('apellido', inputsFiltrado[i][2].value);
            formData.append('contrasenia', inputsFiltrado[i][3].value);

            let config = {
                method: 'POST',
                body: formData
            }

            const urlAniadir = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Profesor.php?consulta=aniadirProfesor`;
            let respuesta = await fetch(urlAniadir, config);
            datos = await respuesta.json();
        }

        if(datos === "Duplicado"){
            alert("Profesor ya existente en la base de datos, use otra cédula o elimine el existente");
        }else if(datos === "Agregado"){
            alert("Profesor creado correctamente");
        }else if(datos === "Error"){
            alert("Error al crear al profesor");
        }
    }else{
        alert("Ingrese datos para agregar un profesor");
    }
}

function eliminarCheckYModificar(fila){
    let checkbox = fila.querySelector('input[type="checkbox"]');
    let modificar = document.querySelector('#botonModificar');

    if(checkbox && modificar){
        let tdCheck = checkbox.parentNode;
        let tdModificar = modificar.parentNode;

        tdCheck.parentNode.removeChild(tdCheck);
        tdModificar.parentNode.removeChild(tdModificar);
    }
}

let clickAgregar = false;
function agregar(){

    //Oculta las demas opciones
    ocultarOpciones("agregar");

    let tabla = document.querySelector('#tabla');
    let cantidadFilas = 0;
    let filas = Array.from(tabla.querySelectorAll('tr:not(:has(th))'));

    //Crea y agrega mas filas si son menores a 10
    if(filas.length <= 10){
        cantidadFilas = 10 - filas.length;

        for(let i=0; i<cantidadFilas; i++){
            let tr = document.createElement('tr');
            
            for(let h=0; h<4; h++){
                
                let td = document.createElement('td');
                tr.appendChild(td);
            }
            tabla.appendChild(tr);
            filas.push(tr);
        }
    }

    //Primer click
    if(!clickAgregar){
        filas.forEach(fila => {
            //Elimina los checked y los botones modificar
            eliminarCheckYModificar(fila);

            //Crea los inputs en las filas
            crearInputs(fila.querySelectorAll('td'));
        });

        inputs = [];
        //Selecciona los botones y les asigna placeholder
        filas.forEach((fila, i) => {
            inputs.push(Array.from(fila.querySelectorAll('input')));

            let cedula = inputs[i][0];
            let nombre = inputs[i][1];
            let apellido = inputs[i][2];
            let contrasenia = inputs[i][3];

            cedula.placeholder = 'Cedula';
            nombre.placeholder = 'Nombre';
            apellido.placeholder = 'Apellido';
            contrasenia.placeholder = 'Contraseña';
        });     
    }

    //Segundo click
    if(clickAgregar){

        //Consulta agregar
        agregarProfesor(inputs);

        //Timeout para evitar perdida de datos
        setTimeout(function() {
            mostrarOpciones("agregar");
            tablaProfesor();
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
    if(seleccionados.length === 0){
        alert("Seleccione un checkbox para eliminar un profesor");
    } else{
        for (let i = 0; i < seleccionados.length; i++) {
            Tr[i] = seleccionados[i].closest('tr');
        }

        let confirmar = confirm('¿Estas seguro que quieres eliminar los profesores seleccionados?');
        if(confirmar){

            //Manda las consultas de las filas del checked
            Tr.forEach(async (tr) => {

                const url = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Profesor.php?consulta=eliminarProfesor&cedula=${tr.cells[0].textContent}`;
                let respuesta = await fetch(url);
                let datos = await respuesta.json();
            
                tr.remove();
            });

            /*if(datos === "Error"){
                alert("Error al eliminar al profesor");
                return;

            }else if(datos === "Exito"){
                console.log("a");
                alert("Se elimino correctamente al profesor");
            }*/
        }else{
            alert("Cancelado...");
        }

    }

    //Timeout para evitar perdida de datos
    setTimeout(function() {
        tablaProfesor();
    }, 500);

}

//Modificar

let clickModificar = false;
async function modificarProfesor(filas){

    let filasInput = filas.slice(1);
    if(filasInput.every(fila => fila.children[0].value.trim() !== '')){
        
        let formData = new FormData();
        formData.append('condicion', filas[0].textContent);
        formData.append('nombre', filas[1].children[0].value);
        formData.append('apellido', filas[2].children[0].value);
        formData.append('contrasenia', filas[3].children[0].value);

        let config = {
            method: 'POST',
            body: formData
        }

        const urlModificar = `http://localhost/Sitio_Liceo_Nº1/PHP/Opciones/Profesor.php?consulta=modificarProfesor`;
        let respuesta = await fetch(urlModificar, config);
        let datos = await respuesta.json();

        if(datos === "Error"){
            alert("Error al crear el profesor");
        }
        
    }else{
        alert("Ingrese los datos para modificar un profesor");
    }
}

let tdInputs = [];
function modificar(event) {

    //Oculta las demas opciones
    ocultarOpciones("modificar");
    let botonClick = event.target;
    
    //Primer click
    if(!clickModificar){
        let filas = botonClick.parentNode.parentNode;
        let filasTabla = Array.from(filas.parentNode.querySelectorAll('tr:not(:has(th))'));
        let filasNoInput = Array.from(filasTabla).filter(fila => fila !== filas );

        //Vacia las filas no seleccionadas
        filasNoInput.forEach(fila => {
            fila.innerHTML = '';
        });

        let checkbox = filas.querySelector('input[type="checkbox"]');
        let tdCheck = checkbox.parentNode;            
        let informacion = [];

        tdCheck.parentNode.removeChild(tdCheck);

        tdInputs = Array.from(filas.children).slice(0, - 1);
        //Crea los botones y incorpora al td
        tdInputs.forEach((td, i) => {
            informacion.push(td.textContent);
            if(i === 0){
                return;
            }

            let input = document.createElement('input');
            td.innerHTML = '';
            td.appendChild(input);
        });
        tdInputs[1].children[0].placeholder = informacion[1];
        tdInputs[2].children[0].placeholder = informacion[2];
        tdInputs[3].children[0].placeholder = informacion[3];
    }
    
    //Segundo click
    if(clickModificar){

        //Manda la consulta update
        modificarProfesor(tdInputs);

        //Timeout para evitar perdida de datos
        setTimeout(function() {
            mostrarOpciones("modificar")
            onclickButton();
        }, 500);

    }
    clickModificar = !clickModificar;
}