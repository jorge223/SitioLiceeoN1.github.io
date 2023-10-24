<?php
    include("../conexion.php");

    if(isset($_GET["consulta"])){
        switch($_GET["consulta"]){
            case "aniadirBlog":
                aniadirBlog();    
        
            break;
            case "eliminarBlog":
                eliminarBlog();    
            
            break;
            case "eliminarTodosComentarios";
            eliminarTodosComentarios();
        
            break;
            case "eliminarComentario";
            eliminarComentario();
        
            break;
            case "modificarBlog":
                modificarBlog();    
                
            break;        
            case "ObtenerBlog":
                ObtenerBlog();    
                
            break;   
            case "darLike":
                darLike();    
                
            break;  
            case "obtenerLike":
                obtenerLike();    
                
            break;  
            case "comentarBlog";
                comentarBlog();
            
            break;
            case "obtenerComentario";
            obtenerComentario();
        
            break;
        }
    }



    //Consultas

function aniadirBlog(){

    if(isset($_POST["titulo"]) && isset($_POST["contenido"])&& isset($_POST["categoria"])){
        $titulo = $_POST["titulo"];
        $contenido = nl2br($_POST["contenido"]);
        $categoria = $_POST["categoria"];

        $conexion = conectar(); 

        $consultaPagina = "INSERT INTO `pagina` (`Id_pagina`, `Titulo`, `Contenido`, `Fecha`, `Categoria`) VALUES (NULL, '$titulo', '$contenido', NOW(), '$categoria');";
        $respuestaPagina = $conexion->query($consultaPagina);
        $idAutoIncrementPagina = $conexion->insert_id;

        $consulta = "INSERT INTO `blog` (`Id_pagina`, `Titulo`, `Contenido`, `Fecha`, `Categoria`, `Hora`) VALUES ('$idAutoIncrementPagina', '$titulo', '$contenido', NOW(), '$categoria', NOW());";
        $respuesta = $conexion->query($consulta);

        echo json_encode($respuesta);
        mysqli_close($conexion);
    } else {
        echo("Hay algún campo de texto vacío");    
    }
}

function darLike(){

    if (isset($_GET["like"]) && isset($_GET["id"])) {
        $like = $_GET["like"];
        $id_pagina = $_GET["id"];
        $conexion = conectar(); 

        $consulta = "UPDATE `blog` SET `Likes` = '$like' WHERE `Id_pagina` = '$id_pagina';";
        $respuesta = $conexion->query($consulta);

        echo json_encode($respuesta);

        mysqli_close($conexion);
        
    } else {
        echo("Hay algún campo de texto vacío");    
    }
}

function obtenerLike(){

    if (isset($_GET["id"])) {
        $id_pagina = $_GET["id"];
        $conexion = conectar(); 

        $consulta_actualizar = "SELECT `Likes` FROM `blog` WHERE `Id_pagina` = '$id_pagina';";
        $respuesta = $conexion->query($consulta_actualizar);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo json_encode($datos);
        
        mysqli_close($conexion);
        
    } else {
        echo("Hay algún campo de texto vacío");    
    }
}

function comentarBlog(){

    if (isset($_POST["comentarioInput"]) && isset($_GET["id_pagina"])&& isset($_GET["id_comentario"])) {
        $contenido = $_POST["comentarioInput"];
        $id_pagina = $_GET["id_pagina"];
        $id_comentario = $_GET["id_comentario"];

        $conexion = conectar(); 
    
        
        $consulta = "INSERT INTO `comentario` (`Id_comentario`, `Id_pagina`, `Contenido`, `Fecha`) VALUES ('$id_comentario', '$id_pagina', '$contenido', NOW());";
        $respuesta = $conexion->query($consulta);
    
        echo json_encode($respuesta);
        mysqli_close($conexion);
    } else {
        echo "Hay algún campo de texto vacío";
    }
    
}

function obtenerComentario(){

    if (isset($_GET["id"])) {
        $id_pagina = $_GET["id"];

        $conexion = conectar(); 
        
        $consulta = "SELECT * FROM `comentario` WHERE `Id_pagina` = '$id_pagina' ORDER by `Fecha` ASC;";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo json_encode($datos);
        mysqli_close($conexion);
    } else {
        echo "Hay algún campo de texto vacío";
    }
    
}


    function eliminarBlog(){
        $conexion = conectar();
        if(isset($_GET["id"])){
            $id = $_GET["id"];

            $consultaPagina = "DELETE FROM `pagina` WHERE `Id_pagina` = '$id'";
            $respuestaPagina =  $conexion->query($consultaPagina);
            echo json_encode($respuestaPagina);

            $consulta = "DELETE FROM `blog` WHERE `Id_pagina` = '$id'";
            $respuesta =  $conexion->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close( $conexion);    
    }

    
    function eliminarTodosComentarios(){

        if(isset($_GET["id"])){
            $id = $_GET["id"];

            $consulta = "DELETE FROM `comentario` WHERE `Id_pagina` = '$id'";
            $respuesta = conectar()->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close(conectar());    
    }

    function eliminarComentario(){

        if(isset($_GET["id"])){
            $id = $_GET["id"];

            $consulta = "DELETE FROM `comentario` WHERE `Id_comentario` = '$id'";
            $respuesta = conectar()->query($consulta);
            echo json_encode($respuesta);
        }else{
            echo("Hay algun campo de texto vacio");    
        }

        mysqli_close(conectar());    
    }

    function ObtenerBlog(){
        $conexion = conectar();
        if(isset($_GET["Id"])) {
        $id = $_GET["Id"];
        $consulta = "SELECT * FROM `blog` WHERE `Id_pagina` = '$id';";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));
        } else{
            echo("Error al obtener la Id");
        }
    }

    function modificarBlog(){

        if(isset($_GET["Id"])&&isset($_POST["Titulo"])&&isset($_POST["Contenido"])&&isset($_POST["Categoria"])){
        $conexion = conectar();
        $id = $_GET["Id"];
        $titulo = $_POST["Titulo"];
        $contenido = nl2br($_POST["Contenido"]);
        $categoria = $_POST["Categoria"];

        $consultaPagina = "UPDATE `pagina` SET `Titulo`='$titulo',`Contenido`='$contenido',`Fecha`=NOW(), `Categoria`='$categoria' WHERE `Id_pagina` = '$id';";
        $respuestaPagina = $conexion->query($consultaPagina);
        echo(json_encode($respuestaPagina));

        $consulta = "UPDATE `blog` SET `Titulo`='$titulo',`Contenido`='$contenido',`Fecha`=NOW(), `Categoria`='$categoria', `Hora`=NOW() WHERE `Id_pagina` = '$id';";
        $respuesta = $conexion->query($consulta);
        echo(json_encode($respuesta));
    }else{
        echo("Ocurrio un error al obtener los campos");
    }
    }

    function limitePaginadoBlog(){
        $conexion = conectar();

        $consulta = "SELECT COUNT(`Id_pagina`) AS total FROM `blog`";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro["total"];   
        }
        echo(json_encode($datos));

        mysqli_close($conexion);
    }

    function paginadoBlog(){
        $cantidad = $_GET["cantidad"];
        $conexion = conectar();
        
        $consulta = "SELECT * FROM `blog` ORDER BY `Fecha` DESC, `Hora` DESC LIMIT 10 OFFSET $cantidad";
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));

        mysqli_close($conexion);     
}

    if(isset($_GET["paginado"])){
        switch($_GET["paginado"]){
            case "limitePaginadoBlog":
                limitePaginadoBlog();

            break;

            case "paginadoBlog":
                paginadoBlog();

            break;        

        }
    }
