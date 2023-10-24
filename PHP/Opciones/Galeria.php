<?php
    include("../conexion.php");

    if($_GET["consulta"]){
        switch($_GET["consulta"]){
            case "selectTGaleria":
                selectTGaleria();

            break;
            case "selectGaleria":
                selectGaleria();

            break;
            case "aniadirGaleria":
                aniadirGaleria();    
        
            break;
            case "eliminarGaleria":
                eliminarGaleria();    
            
            break;
            case "modificarGaleria":
                modificarGaleria();    
                
            break;        
        }
    }

    function selectTGaleria(){
        $consulta = "SELECT * FROM galeria";
        $conexion = conectar();
        $datos = [];
        $respuesta = $conexion->query($consulta);
        while($registro = $respuesta->fetch_assoc()){
            $datos[] = $registro;
        }
        echo(json_encode($datos));
    }

function aniadirGaleria() {
    if (isset($_FILES["foto"]) && isset($_POST["titulo"]) && isset($_POST["descripcion"])) {
        $nombre = $_FILES["foto"]["name"];
        $temporal = $_FILES["foto"]["tmp_name"];
        $titulo = $_POST["titulo"];
        $descripcion = $_POST["descripcion"];
        $carpeta = '/Sitio_Liceo_Nº1/Imagen/Galeria/';
        $nombreUnico = time() . '_' . $nombre;
        $ruta = $carpeta . $nombreUnico;
        

        if (move_uploaded_file($temporal, $_SERVER['DOCUMENT_ROOT'] . $ruta)) {
            $conexion = conectar();

            $consultaPagina = "INSERT INTO `pagina` (`Id_pagina`, `Titulo`, `Contenido`) VALUES (NULL, '$titulo', '$descripcion');";
            $respuestaPagina = $conexion->query($consultaPagina);
            $idAutoIncrementPagina = $conexion->insert_id;

            $consulta = "INSERT INTO `galeria`(`Id_pagina`, `Titulo`, `Contenido`, `Ruta`) VALUES ('$idAutoIncrementPagina', '$titulo', '$descripcion', '$ruta')";
            $respuesta = $conexion->query($consulta);

            mysqli_close($conexion);
        }
    }
}


function eliminarGaleria() {
    $conexion = conectar();

    if (isset($_GET["id"])) {
        $id = $_GET["id"];

        $consultaRutaImagen = "SELECT Ruta FROM galeria WHERE Id_pagina = '$id'";
        $resultadoRutaImagen = $conexion->query($consultaRutaImagen);
        if ($resultadoRutaImagen && $dato = $resultadoRutaImagen->fetch_assoc()) {
            $rutaImagen = $_SERVER['DOCUMENT_ROOT'] . $dato['Ruta'];

            if (file_exists($rutaImagen)) {
                unlink($rutaImagen);
            }
        }

        $consultaPagina = "DELETE FROM `pagina` WHERE `Id_pagina` = '$id'";
        $respuestaPagina = $conexion->query($consultaPagina);

        $consulta = "DELETE FROM `galeria` WHERE `Id_pagina` = '$id'";
        $respuesta = $conexion->query($consulta);

        echo json_encode($respuesta, $respuestaPagina);
    } else {
        echo "Falta el parámetro 'id' en la URL.";
    }

    mysqli_close($conexion);
}


    function modificarGaleria(){

        if (isset($_FILES["foto"]) && isset($_POST["titulo"]) && isset($_POST["descripcion"]) && isset($_GET["Id"])) {
            $id = $_GET["Id"];
            $nombre = $_FILES["foto"]["name"];
            $temporal = $_FILES["foto"]["tmp_name"];
            $titulo = $_POST["titulo"];
            $descripcion = $_POST["descripcion"];
            $carpeta = '/Sitio_Liceo_Nº1/Imagen/Galeria/';
            $nombreUnico = time() . '_' . $nombre;
            $ruta = $carpeta . $nombreUnico;
        
            if (move_uploaded_file($temporal, $_SERVER['DOCUMENT_ROOT'] . $ruta)) {
                
                $conexion = conectar();   
                
                $consultaRutaImagen = "SELECT Ruta FROM galeria WHERE Id_pagina = '$id'";
                $resultadoRutaImagen = $conexion->query($consultaRutaImagen);
                if ($resultadoRutaImagen && $dato = $resultadoRutaImagen->fetch_assoc()) {
                    $rutaImagen = $_SERVER['DOCUMENT_ROOT'] . $dato['Ruta'];
        
                    if (file_exists($rutaImagen)) {
                        unlink($rutaImagen);
                    }
                }
                $consultaPagina = "UPDATE `pagina` SET `Titulo`='$titulo',`Contenido`='$descripcion' WHERE `Id_pagina` = $id";
                $respuestaPagina = $conexion->query($consultaPagina);

                $consulta = "UPDATE `galeria` SET `Titulo`='$titulo',`Contenido`='$descripcion',`Ruta`='$ruta' WHERE `Id_pagina` = $id";
                $respuesta = $conexion->query($consulta);
                echo json_encode($respuesta, $respuestaPagina);

                mysqli_close($conexion);
            }

            
        }
    }
?>