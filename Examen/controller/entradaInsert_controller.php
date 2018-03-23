<?php
    include("../regexps.php");
    include("../utils.php");


    if(count($_POST)>0
        && (($_POST["entrada"]["number"] != null))
    ){
        $nulls = 0;
        foreach($_POST["entrada"] as $key => $value){
            if($value != null)
                $info[$key] = $value;
            else{
                $info[$key] = "";
                $nulls++;
            }
        }
        if(isset($info)) {
            if($nulls == 0){
                insertEntrada($info["number"]);
            }
        }
    }
    
    header("Location: ../entrada.php");
    ?>
