<!DOCTYPE HTML>
<html>
	<head>
		<title>Lab 14 Query SQL</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="../assets/css/main.css" />
    </head>

    <body class="is-preload">
        <header id="header">
            <a class="logo" href="index.php">Lab 14 Menu</a>
            <nav>
                <a href="index.php">Menu</a>
            </nav>
        </header>
        <h2>Todas las frutas.</h2>
        <?php include("query1.php"); ?>;
        <br><br><br>
        <h2>Frutas con "Manzana" en su nombre.</h2>
        <?php include("query2.php"); ?>;
        <br><br><br>
        <h2>Frutas con precio menor o igual a 54.</h2>
        <?php include("query3.php"); ?>;


        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/browser.min.js"></script>
        <script src="../assets/js/breakpoints.min.js"></script>
        <script src="../assets/js/util.js"></script>
        <script src="../assets/js/main.js"></script>
        <script src="script.js"></script>
	</body>
</html>
