<!DOCTYPE HTML>
<html>
	<head>
		<title>Lab 9 - Ejercicio 4</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body class="is-preload">
			<header id="header">
				<a class="logo" href="index.html">Lab 9 Menu</a>
				<nav>
					<a href="#menu">Menu</a>
				</nav>
			</header>
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Lab 9 Menu</a></li>
                    <li><a href="ejercicio1.php">Ejercicio 1</a></li>
                    <li><a href="ejercicio2.php">Ejercicio 2</a></li>
                    <li><a href="ejercicio3.php">Ejercicio 3</a></li>
                    <li><a href="ejercicio5.php">Ejercicio 5</a></li>
				</ul>
			</nav>
			<div id="heading" >
				<h1>Tabla de N</h1>
			</div>
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
				<h2>1. N = 15</h2>
				<h2>2. N = 30</h2>
				<?php
					include "functions.php";
					ejercicio4();
				?>
					</div>
				</div>
			</section>
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="script.js"></script>
	</body>
</html>