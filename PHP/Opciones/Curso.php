<?php
    include("../conexion.php");

    if(isset($_GET["consulta"])){
        switch($_GET["consulta"]){
            case "selectTCurso":
                selecttodosCurso();

            break;
            case "selectCurso":
                selectCurso();

            break;
            case "aniadirCurso":
                aniadirCurso();    
        
            break;
            case "eliminarCurso":
                eliminarCurso();    
            
            break;
            case "modificarCurso":
                modificarCurso();    
                
            break;        
        }   
    }

    if(isset($_GET["listado"])){
        switch($_GET["listado"]){
            case "listadoId":
                listadoId();

            break;
            case "listadoCedulaEstudiante":
                listadoCedulaEstudiante();
    
            break;    
        }
    }

    //Consulta

    function selecttodosCurso(){

        $consulta = "SELECT * FROM `cursa`;";
        $respuesta = conectar()->query($consulta);
        $datos = [];
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo (json_encode($datos));
    
        mysqli_close(conectar());    
    }

    function selectCurso(){
    
        if(isset($_POST["id"]) && isset($_POST["cedulaEstudiante"])){
            $id = $_POST["id"];
            $cedulaEstudiante = $_POST["cedulaEstudiante"];

            $consulta = "SELECT `Calificacion`, `Fecha` FROM `cursa` WHERE `Id` = '$id' AND `Ci_e` = '$cedulaEstudiante';";
            $datos = [];
            $respuesta = conectar()->query($consulta);
                while($registro = $respuesta->fetch_assoc()){
                    $datos[] = $registro;
                }
            echo (json_encode($datos));
        }else{
            echo("Hay algun campo de texto vacio");
        }

        mysqli_close(conectar());   
    }

    function aniadirCurso(){

        if(isset($_POST["id"]) && isset($_POST["cedulaEstudiante"]) && isset($_POST["calificacion"]) && isset($_POST["fecha"])){
            $id = $_POST["id"];
            $cedulaEstudiante = $_POST["cedulaEstudiante"];
            $calificacion = $_POST["calificacion"];
            $fecha = $_POST["fecha"];

            $consulta = "INSERT INTO cursa(Id, Ci_e, Calificacion, Fecha) VALUES ('$id', '$cedulaEstudiante', '$calificacion', '$fecha');";
            $respuesta = conectar()->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay un campo de texto vacio");    
        }

        mysqli_close(conectar());       
    }

    function eliminarCurso(){
    
        if(isset($_POST["id"]) && isset($_POST["cedulaEstudiante"])){
            $id = $_POST["id"];
            $cedulaEstudiante = $_POST["cedulaEstudiante"];

            $consulta = "DELETE FROM `cursa` WHERE `Id` = '$id' AND `Ci_e` = '$cedulaEstudiante';"; 
            $respuesta = conectar()->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close(conectar());    
    }

    function modificarCurso(){

        if(isset($_POST["id"]) && isset($_POST["calificacion"]) && isset($_POST["fecha"]) && isset($_POST["cedulaEstudiante"])){
            $id = $_POST["id"];
            $calificacion = $_POST["calificacion"];
            $fecha = $_POST["fecha"];
            $cedulaEstudiante = $_POST["cedulaEstudiante"];

            $consulta = "UPDATE `cursa` SET `Calificacion` = '$calificacion', `Fecha` = '$fecha' WHERE `Id` = '$id' AND `Ci_e` = '$cedulaEstudiante';";
            $respuesta = conectar()->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close(conectar());    
    }

    //Listado

    function listadoId(){

        $consulta = "SELECT `Id` FROM `cursa` ORDER BY `Id` ASC;";
        $respuesta = conectar()->query($consulta);
        $datos = [];
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo (json_encode($datos));
        
        mysqli_close(conectar()); 
    }

    function listadoCedulaEstudiante(){

        $consulta = "SELECT `Ci_e` FROM `cursa`;";
        $respuesta = conectar()->query($consulta);
        $datos = [];
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo (json_encode($datos));
    
        mysqli_close(conectar()); 
    }
?>