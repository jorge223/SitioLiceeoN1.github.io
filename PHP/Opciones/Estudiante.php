<?php
    include("../conexion.php");

    //Consultas

    function aniadirEstudiante() {
        $conexion = conectar();

        if(isset($_POST["cedula"]) && isset($_POST["nombre"]) && isset($_POST["apellido"]) && isset($_POST["contrasenia"])){
            $cedula = $_POST["cedula"];
            $nombre = $_POST["nombre"];
            $apellido = $_POST["apellido"];
            $contrasenia = $_POST["contrasenia"];

            $consultaDuplicado = $consultaDuplicado = "SELECT COUNT(*) as cuenta FROM estudiante WHERE Ci_e = '$cedula'";
            $resultadoDuplicado = $conexion->query($consultaDuplicado);
            $datos = $resultadoDuplicado->fetch_assoc();
    
            if ($datos["cuenta"] > 0) {
                echo "Duplicado";
                mysqli_close($conexion);
                return;
            }else{
                echo "Agregado";
            }

            if($datos["cuenta"] == 0){
                $consulta = "INSERT INTO estudiante(Ci_e, Nombre, Apellido, Contrasenia) VALUES ('$cedula', '$nombre', '$apellido', '$contrasenia')";
                $respuesta = $conexion->query($consulta);
            }
        }
        mysqli_close($conexion);
    }
    
    function eliminarEstudiante(){

        if(isset($_GET["cedula"])){
            $cedula = $_GET["cedula"];
            $conexion = conectar();

            $consulta = "DELETE FROM `estudiante` WHERE `Ci_e` = '$cedula'";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta));

            mysqli_close($conexion);
        }

    }   

    function modificarEstudiante(){  

        if(isset($_POST["nombre"]) && isset($_POST["apellido"]) && isset($_POST["contrasenia"]) && isset($_POST["condicion"])){
            $nombre = $_POST["nombre"];
            $apellido = $_POST["apellido"];
            $contrasenia = $_POST["contrasenia"];
            $condicion = $_POST["condicion"];

            $conexion = conectar();

            $consulta = "UPDATE `estudiante` SET `Nombre` = '$nombre', `Apellido` = '$apellido', `Contrasenia` = '$contrasenia' WHERE `Ci_e` = '$condicion'";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta));    

            mysqli_close($conexion);
        }

    }

    if(isset($_GET["consulta"])){
        switch($_GET["consulta"]){
            case "aniadirEstudiante":
                aniadirEstudiante();    
        
            break;
            case "eliminarEstudiante":
                eliminarEstudiante();    
            
            break;
            case "modificarEstudiante":
                modificarEstudiante();    
                
            break;        
        }
    }

    //Paginado

    function limitePaginadoEstudiante(){
        $conexion = conectar();

        $consulta = "SELECT COUNT(`Ci_e`) AS total FROM `estudiante`";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro["total"];   
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }

    function paginadoEstudiante(){
            $cantidad = $_GET["cantidad"];
            $conexion = conectar();
            
            $consulta = "SELECT * FROM `estudiante` LIMIT 10 OFFSET $cantidad";
            $respuesta = $conexion->query($consulta);
            while($registro = $respuesta->fetch_assoc()){
                $datos[] = $registro;
            }
            echo(json_encode($datos));

            mysqli_close($conexion);     
    }

    if(isset($_GET["paginado"])){
        switch($_GET["paginado"]){
            case "limitePaginadoEstudiante":
                limitePaginadoEstudiante();

            break;

            case "paginadoEstudiante":
                paginadoEstudiante();

            break;        

        }
    }

    //Filtrado

    function filtradoEstudiante(){
        $cedula = $_GET["cedula"];
        $nombre = $_GET["nombre"];
        $apellido = $_GET["apellido"];

        $conexion = conectar();
        
        $consulta = "SELECT * FROM `estudiante` WHERE `Ci_e` LIKE '$cedula%' AND `Nombre` LIKE '$nombre%' AND `Apellido` LIKE '$apellido%'";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }
    

    if(isset($_GET["filtrado"])){
        switch($_GET["filtrado"]){
            case "filtradoEstudiante":
                filtradoEstudiante();

            break;
        } 
    }
?>