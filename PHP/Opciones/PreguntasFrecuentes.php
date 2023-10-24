<?php
    include("../conexion.php");

    if($_GET["consulta"]){
        switch($_GET["consulta"]){
            case "selectTFaq":
                selectTFaq();

            break;
            case "selectFaq":
                selectFaq();
                
            break;
            case "aniadirFaq":
                aniadirFaq();    
        
                break;
            case "eliminarFaq":
                eliminarFaq();    
            
            break;
            case "modificarFaq":
                modificarFaq();    
                
            break;        
        }
    }

    //Consultas

    function selectTFaq(){   
        $conexion = conectar();
        $consulta = "SELECT * FROM `faq`;";
        $respuesta = $conexion->query($consulta);
        $datos = [];
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }

    function aniadirFaq(){

        if(isset($_POST["titulo"]) && isset($_POST["contenido"])){
            $conexion = conectar();
            $titulo = $_POST["titulo"];
            $contenido = $_POST["contenido"];

            $consultaPagina = "INSERT INTO `pagina` (`Id_pagina`, `Titulo`, `Contenido`) VALUES (NULL, '$titulo', '$descripcion');";
            $respuestaPagina = $conexion->query($consultaPagina);
            $idAutoIncrementPagina = $conexion->insert_id;

            $consulta = "INSERT INTO `faq`(`Id_pagina`, `Titulo`, `Contenido`, `Fecha`) VALUES ('$idAutoIncrementPagina','$titulo','$contenido',NOW())";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta));
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close($conexion);    
    }

    function eliminarFaq(){
        $conexion = conectar();

        if(isset($_GET["id"])){
            $id = $_GET["id"];
            $consultaPagina = "DELETE FROM `pagina` WHERE `Id_pagina` = '$id'";
            $respuestaPagina = $conexion->query($consultaPagina);

            $consulta = "DELETE FROM `faq` WHERE `Id_pagina` = '$id';";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta, $respuestaPagina));
        }else{
            echo("Hay algun campo de texto vacio");
        }

        mysqli_close($conexion);
    }

    function modificarFaq(){
        $conexion = conectar();

        if(isset($_POST["titulo"]) && isset($_POST["contenido"])){
            $id = $_GET["Id"];
            $titulo = $_POST["titulo"];
            $contenido = $_POST["contenido"];

            $consultaPagina = "UPDATE `pagina` SET `Titulo`='$titulo',`Contenido`='$contenido',`Fecha`=NOW() WHERE `Id_pagina` = $id";
            $respuestaPagina = $conexion->query($consultaPagina);

            $consulta = "UPDATE `faq` SET `Titulo` = '$titulo', `Contenido` = '$contenido', `Fecha` = NOW() WHERE `Id_pagina` = '$id';";
            $respuesta = $conexion->query($consulta);
            echo(json_encode($respuesta, $respuestaPagina));
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close($conexion);       
    }
?>