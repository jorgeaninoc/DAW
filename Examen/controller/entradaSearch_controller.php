<?php
include("../utils.php");
echo "<table class='table table-hover'>";
echo buildTableData(queryAllEntradas());
echo "</table>";

?>
