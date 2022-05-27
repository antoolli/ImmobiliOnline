<!-- jstl  -->
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<meta charset="utf-8"></meta>
		<!-- Bootstrap -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link href="css/common.css" rel="stylesheet" type="text/css"></link>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<title>ImmobiliOnline</title>
	</head>
<header class="bg-dark">
	<h1 class="text-center text-warning">ImmobiliOnline</h1>
	<p class="text-warning text-center">il miglior sito dove comprare e vendere immobili online.</p>
	<div id="benvenuto">
		<h4>
			<strong>Benvenuto Admin </strong> <a href="doLogout">LOGOUT</a>
		</h4>
	</div>
	<!-- Elenco  poi faccio diventare nav -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark" id="navAdmin">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/"> Esci</a></li>
			<li class="nav-item"><a class="nav-link" href="/pageAdmin"> Home</a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoIscritti">Elenco Iscritti</a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoAnnunci"> Elenco Annunci</a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoRecensioni"> Elenco Recensioni</a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoAffitti"> Elenco Affitti</a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoAste"> Elenco Aste</a></li>
		</ul>
	</nav>

</header>

<body>
	
		
	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/c2.png"
					class="img-fluid img-thumbnail rounded mx-auto d-block">
				<div class="carousel-caption">
					<h3>Benvenuto admin</h3>
					<p>In questo menu trovi tutte le funzionalita admin</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="img/carosel1.jpg"
					class="img-fluid img-thumbnail rounded mx-auto d-block">
				<div class="carousel-caption">
					<h3>Possibilita di cancellare dati</h3>
					<p>Puoi eliminare annunci , iscrizione e tanto altro</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/c3.jpg"
					class="img-fluid img-thumbnail rounded mx-auto d-block">
				<div class="carousel-caption">
					<h3>Funzionalità di monitoraggio</h3>
					<p>Puoi monitorare tutti gli annunci le iscrizioni e le recensioni che avvengono sul tuo sito</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	
	


	<footer>
		<small> Per maggiori informazioni sui nostri servizi
			contattaci all'indirizzo <a href="mailto:antoolli49@gmail.com">
				antoolli49@gmail.com</a> <br>per maggiori informazioni sui <a
			href="terminieCondizioni.html">Termini e Condizioni </a> </br>
		</small>


	</footer>

</body>

</html>