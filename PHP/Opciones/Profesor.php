<?php
    include("../conexion.php");

    function respuesta($dato){
        echo(json_encode($dato));
    }

    //Consultas

    function aniadirProfesor() {
        $conexion = conectar();

        if(isset($_POST["cedula"]) && isset($_POST["nombre"]) && isset($_POST["apellido"]) && isset($_POST["contrasenia"])){
            $cedula = $_POST["cedula"];
            $nombre = $_POST["nombre"];
            $apellido = $_POST["apellido"];
            $contrasenia = $_POST["contrasenia"];

            $consultaDuplicado = $consultaDuplicado = "SELECT COUNT(*) as cuenta FROM profesor WHERE Ci_p = '$cedula'";
            $resultadoDuplicado = $conexion->query($consultaDuplicado);
            $datos = $resultadoDuplicado->fetch_assoc();
    
            if ($datos["cuenta"] > 0) {
                respuesta("Duplicado"); ;
                mysqli_close($conexion);
                return;
            }else{
                respuesta("Agregado");
            }

            if($datos["cuenta"] == 0){
                $consulta = "INSERT INTO profesor(Ci_p, Nombre, Apellido, Contrasenia) VALUES ('$cedula', '$nombre', '$apellido', '$contrasenia')";
                $respuesta = $conexion->query($consulta);

                if(!$respuesta){
                    respuesta("Error");
                }
            }
        }
        mysqli_close($conexion);
    }
    
    function eliminarProfesor(){

        $cedula = $_GET["cedula"];
        $conexion = conectar();

        $consulta = "DELETE FROM `profesor` WHERE `Ci_p` = '$cedula'";
        $respuesta = $conexion->query($consulta);

        if(!$respuesta){
            respuesta("Error");
            mysqli_close($conexion);
            exit;
        }
        respuesta("Exito");
        
        mysqli_close($conexion);
    }   

    function modificarProfesor(){  

        if(isset($_POST["nombre"]) && isset($_POST["apellido"]) && isset($_POST["contrasenia"]) && isset($_POST["condicion"])){
            $nombre = $_POST["nombre"];
            $apellido = $_POST["apellido"];
            $contrasenia = $_POST["contrasenia"];
            $condicion = $_POST["condicion"];

            $conexion = conectar();

            $consulta = "UPDATE `profesor` SET `Nombre` = '$nombre', `Apellido` = '$apellido', `Contrasenia` = '$contrasenia' WHERE `Ci_p` = '$condicion'";
            $respuesta = $conexion->query($consulta);

            if(!$respuesta){
                respuesta("Error");
                mysqli_close($conexion);
                exit;
            }
            respuesta($respuesta);

            mysqli_close($conexion);
        }
    }

    if(isset($_GET["consulta"])){
        switch($_GET["consulta"]){
            case "aniadirProfesor":
                aniadirProfesor();    
        
            break;
            case "eliminarProfesor":
                eliminarProfesor();    
            
            break;
            case "modificarProfesor":
                modificarProfesor();    
                
            break;        
        }
    }
    //Paginado

    function limitePaginadoProfesor(){
        $conexion = conectar();

        $consulta = "SELECT COUNT(`Ci_p`) AS total FROM `profesor`";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro["total"];   
        }

        if(!$respuesta){
            respuesta("Error");
            mysqli_close($conexion);
            exit;
        }
        respuesta($datos);
        
        mysqli_close($conexion);
    }

    function paginadoProfesor(){
        $cantidad = $_GET["cantidad"];
        $conexion = conectar();
            
        $consulta = "SELECT * FROM `profesor` LIMIT 10 OFFSET $cantidad";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }

        if(!$respuesta){
            respuesta("Error");
            mysqli_close($conexion);
            exit;
        }

        respuesta($datos);

        mysqli_close($conexion);     
    }

    if(isset($_GET["paginado"])){
        switch($_GET["paginado"]){
            case "limitePaginadoProfesor":
                limitePaginadoProfesor();

            break;

            case "paginadoProfesor":
                paginadoProfesor();

            break;        
        }
    }   

    //Filtrado

    function filtradoProfesor(){
        $cedula = $_GET["cedula"];
        $nombre = $_GET["nombre"];
        $apellido = $_GET["apellido"];

        $conexion = conectar();
        
        $consulta = "SELECT * FROM `profesor` WHERE `Ci_p` LIKE '$cedula%' AND `Nombre` LIKE '$nombre%' AND `Apellido` LIKE '$apellido%'";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }

        if(!$respuesta){
            respuesta("Error");
            mysqli_close($conexion);
            exit;
        }
        respuesta($datos);
        
        mysqli_close($conexion);
    }
    
    if(isset($_GET["filtrado"])){
        switch($_GET["filtrado"]){
            case "filtradoProfesor":
                filtradoProfesor();

            break;
        }   
    }

?>