<?php
    require_once "util.php";
    $result = getFruitsByName("Manzana");
    echo "<table>";
    echo "<tr>";
    echo "<th> Name </th>";
    echo "<th> Units </th>";
    echo "<th> Quantity </th>";
    echo "<th> Price </th>";
    echo "<th> Country </th>";
    echo "</tr>";
    if(mysqli_num_rows($result)>0){
        while($row = mysqli_fetch_assoc($result)){
            echo "<tr>";
            echo "<td>" . $row["name"]. "</td>";
            echo "<td>" . $row["units"]. "</td>";
            echo "<td>" . $row["quantity"]. "</td>";
            echo "<td>" . $row["price"]. "</td>";
            echo "<td>" . $row["country"]. "</td>";
            echo "</tr>";
        }
    }
    echo "</table>";


?>