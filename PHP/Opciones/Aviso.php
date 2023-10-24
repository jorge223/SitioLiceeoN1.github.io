<?php
    include("../conexion.php");

    if(isset($_GET["consulta"])){
        switch($_GET["consulta"]){

            case "selectTAviso":
                selecttodosAvisos();

            break;
            case "selectAviso":
                selectAviso();

            break;
            case "aniadirAviso":
                aniadirAviso();    
        
            break;
            case "eliminarAviso":
                eliminarAviso();    
            
            break;
            case "modificarAviso":
                modificarAviso();    
                
            break;        
        }
    }

    //Consultas

    function selecttodosAvisos(){
    
        $consulta = "SELECT * FROM `aviso`";
        $respuesta = conectar()->query($consulta);
        $datos = [];
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo (json_encode($datos));
    
        mysqli_close(conectar());    
    }

    function selectAviso(){

        if(isset($_POST["condicion"])){
            $condicion = $_POST["condicion"];

            $consulta = "SELECT aviso(Id_pagina, Titulo, Contenido, Fecha, Categoria) FROM `aviso` WHERE `Id_pagina` = '$condicion'";
            $datos = [];
            $respuesta = conectar()->query($consulta);
                while($registro = $respuesta->fetch_assoc()){
                    $datos[] = $registro;
                }
            echo(json_encode($datos));
        }else{
            echo("Hay algun campo de texto vacio");
        }

        mysqli_close(conectar());  
    }

    function aniadirAviso(){

        if(isset($_POST["id"]) && isset($_POST["titulo"]) && isset($_POST["contenido"]) && isset($_POST["fecha"]) && isset($_POST["categoria"])){
            $id = $_POST["id"];
            $titulo = $_POST["titulo"];
            $contenido = $_POST["contenido"];
            $fecha = $_POST["fecha"];
            $categoria = $_POST["categoria"];

        $consulta = "INSERT INTO aviso(Id_pagina, Titulo, Contenido, Fecha, Categoria) VALUES ('$id', '$titulo', '$contenido', '$fecha', '$categoria')";
        $respuesta = conectar()->query($consulta);
        echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close(conectar());    
    }

    function eliminarAviso(){

        if(isset($_POST["id"])){
            $id = $_POST["id"];
       
            $consulta = "DELETE FROM `aviso` WHERE `Id_pagina` = '$id'";
            $respuesta = conectar()->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close(conectar());    
    }

    function modificarAviso(){

        if(isset($_POST["titulo"]) && isset($_POST["contenido"]) && isset($_POST["fecha"]) && isset($_POST["categoria"]) && isset($_POST["condicion"])){
            $titulo = $_POST["titulo"];
            $contenido = $_POST["contenido"];
            $fecha = $_POST["fecha"];
            $categoria = $_POST["categoria"];
            $condicion = $_POST["condicion"];

            $consulta = "UPDATE `aviso` SET `Titulo` = '$titulo', `Contenido` = '$contenido', `Fecha` = '$fecha', `Categoria` = '$categoria' WHERE `Id_pagina` = '$condicion'";
            $respuesta = conectar()->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");
        }

        mysqli_close(conectar());     
    }
?>