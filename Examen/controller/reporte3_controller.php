<?php
include("../utils.php");
echo "<table class='table table-hover'>";
echo buildTableData(querySystemFailures());
echo "</table>";
echo "<table class='table table-hover'>";
echo buildTableData(querySucesses());
echo "</table>";


?>
