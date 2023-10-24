<?php
    include("../conexion.php");

    //Consultas

    function aniadirAdministrador() {
        $conexion = conectar();

        if(isset($_POST["cedula"]) && isset($_POST["nombre"]) && isset($_POST["apellido"]) && isset($_POST["contrasenia"])){
            $cedula = $_POST["cedula"];
            $nombre = $_POST["nombre"];
            $apellido = $_POST["apellido"];
            $contrasenia = $_POST["contrasenia"];

            $consultaDuplicado = $consultaDuplicado = "SELECT COUNT(*) as cuenta FROM administrador WHERE Ci_a = '$cedula'";
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
                $consulta = "INSERT INTO administrador(Ci_a, Nombre, Apellido, Contrasenia) VALUES ('$cedula', '$nombre', '$apellido', '$contrasenia')";
                $respuesta = $conexion->query($consulta);
            }
        }
        mysqli_close($conexion);
    }
    
    function eliminarAdministrador(){

        if(isset($_GET["cedula"])){
            $cedula = $_GET["cedula"];
            $conexion = conectar();

            $consulta = "DELETE FROM `administrador` WHERE `Ci_a` = '$cedula'";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta));

            mysqli_close($conexion);
        }

    }   

    function modificarAdministrador(){  

        if(isset($_POST["nombre"]) && isset($_POST["apellido"]) && isset($_POST["contrasenia"]) && isset($_POST["condicion"])){
            $nombre = $_POST["nombre"];
            $apellido = $_POST["apellido"];
            $contrasenia = $_POST["contrasenia"];
            $condicion = $_POST["condicion"];

            $conexion = conectar();

            $consulta = "UPDATE `administrador` SET `Nombre` = '$nombre', `Apellido` = '$apellido', `Contrasenia` = '$contrasenia' WHERE `Ci_a` = '$condicion'";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta));    

            mysqli_close($conexion);
        }

    }

    if(isset($_GET["consulta"])){
        switch($_GET["consulta"]){
            case "aniadirAdministrador":
                aniadirAdministrador();    
        
            break;
            case "eliminarAdministrador":
                eliminarAdministrador();    
            
            break;
            case "modificarAdministrador":
                modificarAdministrador();    
                
            break;        
        }
    }

    //Paginado

    function limitePaginadoAdministrador(){
        $conexion = conectar();

        $consulta = "SELECT COUNT(`Ci_a`) AS total FROM `administrador`";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro["total"];   
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }

    function paginadoAdministrador(){
            $cantidad = $_GET["cantidad"];
            $conexion = conectar();
            
            $consulta = "SELECT * FROM `administrador` LIMIT 10 OFFSET $cantidad";
            $respuesta = $conexion->query($consulta);
            while($registro = $respuesta->fetch_assoc()){
                $datos[] = $registro;
            }
            echo(json_encode($datos));

            mysqli_close($conexion);     
    }

    if(isset($_GET["paginado"])){
        switch($_GET["paginado"]){
            case "limitePaginadoAdministrador":
                limitePaginadoAdministrador();

            break;

            case "paginadoAdministrador":
                paginadoAdministrador();

            break;        

        }
    }

    //Filtrado

    function filtradoAdministrador(){
        $cedula = $_GET["cedula"];
        $nombre = $_GET["nombre"];
        $apellido = $_GET["apellido"];

        $conexion = conectar();
        
        $consulta = "SELECT * FROM `administrador` WHERE `Ci_a` LIKE '$cedula%' AND `Nombre` LIKE '$nombre%' AND `Apellido` LIKE '$apellido%'";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }
    

    if(isset($_GET["filtrado"])){
        switch($_GET["filtrado"]){
            case "filtradoAdministrador":
                filtradoAdministrador();

            break;
        } 
    }
?>