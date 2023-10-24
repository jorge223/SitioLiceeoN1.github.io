<?php
    include("../conexion.php");

    //Consultas

    function aniadirMateria() {
        $conexion = conectar();

        if(isset($_POST["nombre"]) && isset($_POST["horario"]) && isset($_POST["cedulaprofesor"]) && isset($_POST["cedulaadministrador"])){
            
            $nombre = $_POST["nombre"];
            $horario = $_POST["horario"];
            $cedulaProfesor = $_POST["cedulaprofesor"];
            $cedulaAdministrador = $_POST["cedulaadministrador"];

            $consultaDuplicado = $consultaDuplicado = "SELECT COUNT(*) as `cuenta` FROM `materia` WHERE `Ci_p` = '$cedulaProfesor' AND Ci_a = '$cedulaAdministrador'";
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
                $consulta = "INSERT INTO materia(Nombre, Horario, Ci_p, Ci_a) VALUES ('$nombre', '$horario', '$cedulaProfesor', '$cedulaAdministrador')";
                $respuesta = $conexion->query($consulta);
            }
        }
        mysqli_close($conexion);
    }
    
    function eliminarMateria(){

        if(isset($_GET["cedulaprofesor"]) && isset($_GET["cedulaadministrador"])){
            $cedulaProfesor = $_GET["cedulaprofesor"];
            $cedulaAdministrador = $_GET["cedulaadministrador"];            
            $conexion = conectar();

            $consulta = "DELETE FROM `materia` WHERE `Ci_p` = '$cedulaProfesor' AND `Ci_a` = '$cedulaAdministrador'";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta));

            mysqli_close($conexion);
        }

    }   

    function modificarMateria(){  

        if(isset($_POST["nombre"]) && isset($_POST["horario"]) && isset($_POST["cedulaprofesor"]) && isset($_POST["cedulaadministrador"])){
            
            $nombre = $_POST["nombre"];
            $horario = $_POST["horario"];
            $cedulaProfesor = $_POST["cedulaprofesor"];
            $cedulaAdministrador = $_POST["cedulaadministrador"];

            $condicionProfesor = $_GET["condicionprofesor"];
            $condicionAdministrador = $_GET["condicionadministrador"];
            $conexion = conectar();

            $consultaDuplicado = $consultaDuplicado = "SELECT COUNT(*) as `cuenta` FROM `materia` WHERE `Ci_p` = '$cedulaProfesor' AND Ci_a = '$cedulaAdministrador'";
            $resultadoDuplicado = $conexion->query($consultaDuplicado);
            $datos = $resultadoDuplicado->fetch_assoc();
    
            if ($datos["cuenta"] > 0) {
                echo "Duplicado";
                mysqli_close($conexion);
                return;
            }else{
                echo "Modificado";
            }

            $consulta = "UPDATE `materia` SET `Nombre` = '$nombre', `Horario` = '$horario', `Ci_p` = '$cedulaProfesor', `Ci_a` = '$cedulaAdministrador' WHERE `Ci_p` = '$condicionProfesor' AND `Ci_a` = '$condicionAdministrador'";
            $respuesta = $conexion->query($consulta);

            mysqli_close($conexion);
        }

    }

    if(isset($_GET["consulta"])){
        switch($_GET["consulta"]){
            case "aniadirMateria":
                aniadirMateria();    
        
            break;
            case "eliminarMateria":
                eliminarMateria();    
            
            break;
            case "modificarMateria":
                modificarMateria();    
                
            break;        
        }
    }

    //Paginado

    function limitePaginadoMateria(){
        $conexion = conectar();

        $consulta = "SELECT COUNT(`Id`) AS total FROM `materia`";
        $respuesta = $conexion->query($consulta);

        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro["total"];   
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }

    function paginadoMateria(){
            $cantidad = $_GET["cantidad"];
            $conexion = conectar();
            
            $consulta = "SELECT * FROM `materia` LIMIT 10 OFFSET $cantidad";
            $respuesta = $conexion->query($consulta);
            while($registro = $respuesta->fetch_assoc()){
                $datos[] = $registro;
            }
            echo(json_encode($datos));

            mysqli_close($conexion);     
    }

    if(isset($_GET["paginado"])){
        switch($_GET["paginado"]){
            case "limitePaginadoMateria":
                limitePaginadoMateria();

            break;

            case "paginadoMateria":
                paginadoMateria();

            break;        

        }
    }

    //Filtrado

    function filtradoMateria(){
        $nombre = $_GET["nombre"];
        $horario = $_GET["horario"];
        $cedulaProfesor = $_GET["cedulaprofesor"];
        $cedulaAdministrador = $_GET["cedulaadministrador"];

        $conexion = conectar();
        
        $consulta = "SELECT * FROM `materia` WHERE `Nombre` LIKE '$nombre%' AND `Horario` LIKE '$horario%' AND `Ci_p` LIKE '$cedulaProfesor%' AND `Ci_a` LIKE '$cedulaAdministrador%'";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }
    

    if(isset($_GET["filtrado"])){
        switch($_GET["filtrado"]){
            case "filtradoMateria":
                filtradoMateria();

            break;
        } 
    }

    //Listado

    function listadoProfesor(){
        $conexion = conectar();
        
        $consulta = "SELECT `Ci_p`, `Nombre` FROM `profesor`";

        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
        
    }

    function listadoAdministrador(){
        $conexion = conectar();
        
        $consulta = "SELECT `Ci_a`, `Nombre`  FROM `administrador`";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }

    if(isset($_GET["listado"])){
        switch($_GET["listado"]){
            case "listadoProfesor":
                listadoProfesor();

            break;
            case "listadoAdministrador":
                listadoAdministrador();

            break;
        } 
    }
?>