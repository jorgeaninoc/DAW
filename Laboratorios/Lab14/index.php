<!DOCTYPE HTML>
<html>
	<head>
		<title>Lab 14: PHP y consultas dinámicas a la base de datos</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body class="is-preload">
			<header id="header">
				<a class="logo" href="../../index.html">Jorge Alberto Niño Cabal A01172309</a>
				<nav>
					<a href="#">Menu</a>
				</nav>
			</header>
			<nav id="menu">
				<ul class="links">
					<li><a href="../../index.html">Home</a></li>
				</ul>
			</nav>
			<section id="banner">
				<div class="inner">
					<h1>Lab 14: PHP y consultas dinámicas a la base de datos.</h1>
					<br/>
				</div>
			</section>
			<section class="wrapper">
				<div class="inner">
					<div class="highlights">
						<section>
							<div class="content">
								<header>
									<h2><a href="tabla.php">Pagina: CLICK AQUI</a></h2>
								</header>
								<p>Pagina con consulta a la base de datos.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<h3>¿Qué es ODBC y para qué es útil?</h3>
								</header>
								<p>
                                    Open Data Base Conectivity, que es lo mismo que conectividad abierta de base de datos.
                                    Es un estándar de acceso a las bases de datos que hace posible el acceder a cualquier dato
                                    desde cualquier aplicación sin importar el gestor de base de datos que almacene los datos.
								</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<h3>¿Que es SQL Injection?</h3>
								</header>
								<p>
                                    Sucede cuando se le pide al usuario un input como un id o contraseña y el usuario ingresa
                                    una sentencia SQL que correra en la base de datos sin que el administrador del sistema sepa.
                                    Puede causar la destrucción de la base de datos o el acceso al sistema por parte del usuario
                                    con permisos de super usuario.
								</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<h3>¿Qué técnicas puedes utilizar para evitar ataques de SQL Injection? </h3>
								</header>
								<p>
                                    Una manera común para evitar estos ataques es prohibir al usuario introducir caracteres especiales como comillas o interpretarlas de diferentes maneras como texto para que no 
                                    se identifique como el abrir o cerrar el texto de una consulta.  
								</p>
							</div>
						</section>
						
					</div>
				</div>
			</section>
			<footer id="footer">
					<div class="inner">
						<div class="content">
							<section>
								<h3>Referencias</h3>
								<p>[1] https://www.uv.es/jac/guia/gestion/gestion3.htm <br/>
								[2] https://www.w3schools.com/sql/sql_injection.asp<br/>
								[3] https://www.genbetadev.com/seguridad-informatica/evita-los-ataques-de-inyeccion-de-sql<br/>
								</p>
							</section>
						</div>
					</div>
			</footer>
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
	</body>
</html>
