<?php
function connectDb(){
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "lab14";

    $con = mysqli_connect($servername, $username, $password, $dbname);
    
    // Check connection
    if(!$con){
        die("Connection failed: " . mysqli_connect_error());
    }

    return $con;
}

/*
La variable $mysql es una conexión establecida anteriormente tomando de ejemplo
la función anterior, podría mandar a llamar la función mandando como parámetro $con
*/
function closeDb($mysql){
    mysqli_close($mysql);
}

function getFruits(){
    $conn = connectDb();
    $sql = "SELECT * FROM Fruit";
    $result = mysqli_query($conn,$sql);
    closeDb($conn);
    return $result;
}

/*
Funcion que regresara los datos de una fruta que tengan en su nombre el parametro.
Ejempo: Si tengo manzana, me puede regresar manzana roja, manzana verde, etc.
*/
function getFruitsByName($fruit_name){
    $conn = connectDb();
    $sql = "SELECT name, units, quantity, price, country FROM Fruit WHERE name LIKE '%".$fruit_name."%'";
    $result = mysqli_query($conn, $sql);
    closeDb($conn);
    return $result;
}

// Regresa todas las frutas donde su precio sea igual o menor que el parametro que recibe
function getCheapestFruits($cheap_price){
    $conn = connectDb();
    $sql = "SELECT name, units, quantity, price, country FROM Fruit WHERE price <= '".$cheap_price."'";
    $result = mysqli_query($conn,$sql);
    closeDb($conn);
    return $result;
}

?>

