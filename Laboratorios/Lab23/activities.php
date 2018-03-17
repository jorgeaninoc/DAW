<?php include("partials/session_functions.php");?>
<?php include("partials/_header.html"); ?>
<br /><br />
<?php
#permisos admin
$perm["edit"] = 1;
/*
#usuario
$perm["edit"] = 0;*/
?>
<?php include("html/activities.html");?>
<?php include("partials/_footer.html"); ?>
