<?php

function connect() {
    $ENV = "dev";
    if ($ENV == "dev") {
        $mysql = mysqli_connect("localhost","root","","examen");
                                        //root si estan en windows
    }
    $mysql->set_charset("utf8");
    return $mysql;
}

function disconnect($mysql) {
    mysqli_close($mysql);
}

function insertEntrada($number){
    $connection = connect();
    if (!isset($_SESSION['start_time']))
    {
        $str_time = time();
        $_SESSION['start_time'] = $str_time;
    }
    if($number != "4 8 15 16 23 42" || (date("i",time()) - date("i",$_SESSION["start_time"])) > 100){
        $statement = mysqli_prepare($connection,"
        insert into entrada (number,status,date)
        values (?, 'SYSTEM FAILURE', ?);
        ");
        $statement->bind_param("ss",$number,date("Y-m-d h:i:sa"));
        $statement->execute();
        disconnect($connection);
        $str_time = time();
        $_SESSION['start_time'] = $str_time;
    }
    else{
        $statement = mysqli_prepare($connection,"
        insert into entrada (number,status,date)
        values (?, 'SUCCESS', ?);
        ");
        $statement->bind_param("ss",$number,date("Y-m-d h:i:sa"));
        $statement->execute();
        disconnect($connection);
    }
}


function queryAllEntradas(){
    $connection = connect();
    $statement = mysqli_prepare($connection,"
    select *
    from entrada
    order by date desc
    ");
    $statement->execute();
    $result = $statement->get_result();
    disconnect($connection);
    return $result;
}

function queryAllFails(){
    $connection = connect();
    $statement = mysqli_prepare($connection,"
    select date
    from entrada
    where status = 'SYSTEM FAILURE'
    order by date desc
    ");
    $statement->execute();
    $result = $statement->get_result();
    disconnect($connection);
    return $result;
}

function querySystemFailures(){
    $connection = connect();
    $statement = mysqli_prepare($connection,"
    select count(idEntrada) as 'FAILURES'
    from entrada
    where status = 'SYSTEM FAILURE'
    ");
    $statement->execute();
    $result = $statement->get_result();
    disconnect($connection);
    return $result;
}
function querySucesses(){
    $connection = connect();
    $statement = mysqli_prepare($connection,"
    select count(idEntrada) as 'SUCCESES'
    from entrada
    where status = 'SUCCESS'
    ");
    $statement->execute();
    $result = $statement->get_result();
    disconnect($connection);
    return $result;
}


function getTable($tableName) {
    $db = connect();
    if ($db != NULL) {

        //Specification of the SQL query
        $query='SELECT * FROM ' . $tableName;
        $query;
         // Query execution; returns identifier of the result group
        $results = $db->query($query);
         // cycle to explode every line of the results
        disconnect($db);
        return $results;
    }
    return false;
}



function buildTableData($result){ //Booleano para ver si agarro idEmpleado o idProyecto
    $contador = 0;
    $table = "";
    if(mysqli_num_rows($result)>0){
        $fieldNumber = mysqli_num_fields($result);
        $table .= "<thead>";
        for($i = 0; $i < $fieldNumber; $i++){
              $table .= "<td><strong>  ".mysqli_fetch_field_direct($result, $i)->name." </strong> </td>";
        }
        $table .= "</thead><tbody>";
        while($row = mysqli_fetch_assoc($result)){
            $table .= "<tr>";
            foreach($row as $data){
                $table .= "<td>$data</td>";
            }
            $table .= "</tr>";
            $contador += 1;
        }
        $table .= "</tbody>";
    }else{
        echo "<thead><td>No hay resultados</td></thead>";
    }
    return $table;
}



?>
