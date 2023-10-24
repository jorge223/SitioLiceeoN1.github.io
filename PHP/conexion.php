<?php
    
    function conectar(){ 
        $enlace = new Mysqli("localhost", "root","","liceo_nº1bd", 3306);

        if($enlace -> connect_error != null){
            echo $enlace -> connect_error;
        }
        
        return $enlace;
    }

?>
