<?php
    include("conexion.php");
    session_start();

    function iniciarSesion(){
        $conexion = conectar();

       if(isset($_POST["cedula"]) && isset($_POST["contrasenia"])){
            $cedula = $_POST["cedula"];
            $contrasenia = $_POST["contrasenia"];

            $consulta = "SELECT `Ci_p`,`Nombre`,`Apellido` FROM `profesor` WHERE `Ci_p` = '$cedula' AND `Contrasenia` = '$contrasenia' 
            UNION 
            SELECT `Ci_e`,`Nombre`,`Apellido` FROM `estudiante` WHERE `Ci_e` = '$cedula' AND `Contrasenia` = '$contrasenia'
            UNION 
            SELECT `Ci_a`,`Nombre`,`Apellido` FROM `administrador` WHERE `Ci_a` = '$cedula' AND `Contrasenia` = '$contrasenia'";

            $respuesta = $conexion->query($consulta);
            while($registro = $respuesta->fetch_assoc()){
                $datos[] = $registro;   
            }

            if ($datos) {
                echo(json_encode($datos));
                $_SESSION['usuario'] = $datos; 
            }else if(!$datos) {
                echo(json_encode('Incorrecto'));
            }

        } 

        mysqli_close($conexion);
    }

    function cerrarSesion(){
        $_SESSION['usuario'] = null;
    }

    function obtenerSesion(){
        echo(json_encode($_SESSION['usuario']));
    }

    if(isset($_GET['sesion'])){
        switch($_GET['sesion']){
            case "iniciarSesion":
                iniciarSesion();
            break;
            case "cerrarSesion":
                cerrarSesion();
            break;
            case "obtenerSesion":
                obtenerSesion();
            break;            
        }
    }
?>