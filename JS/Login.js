window.onload = () => {

    let form = document.querySelector("#sesion");
    form.onsubmit = (event) => {
        login(event);
    }
}

async function login(event){
    event.preventDefault();

    const url = `http://localhost/Sitio_Liceo_Nº1/PHP/login.php?sesion=iniciarSesion`;
    let formdata = new FormData(event.target);
    let config = {
        method: 'POST',
        body: formdata
    }

    let respuesta = await fetch(url, config);
    let datos = await respuesta.json();

    if(datos){
        alert(datos);
    }else{
        alert("Usuario o contraseña incorrectos");
    }
}