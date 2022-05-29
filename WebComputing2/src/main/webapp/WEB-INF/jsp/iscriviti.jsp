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
		<script language="javascript" src="js/modelloDati.js"></script>
		<script language="javascript" src="js/gestioneIscrizioni.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- JavaScript Alertify -->
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
		<title>ImmobiliOnline</title>
	</head>

<header class="bg-dark">
	<h1 class="text-center text-warning">ImmobiliOnline</h1>
	<p class="text-warning text-center"> il miglior sito dove comprare e vendere immobili online.Hai gia un Account fai <a href="pageLogin">LOGIN</a> </p>
	<!-- PERCORSO PAGINA LOGIN -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark"
		id="navbarMenu">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/"><strong>
				<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  				<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
				</svg></strong>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="pageChisiamo"><strong>Chi siamo</strong> </a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" href="#"><strong> Annunci</strong></a>
				<ul class="dropdown-menu bg-dark">
					<li><a class="dropdown-item text-white bg-dark" href="pageImmInVendita">Immobiliin vendita</a></li>
					<li><a class="dropdown-item text-white bg-dark" href="pageImmInAffitto"> Immobili in affitto</a></li>
					<li><a class="dropdown-item bg-dark text-white" href="pageAste"> Aste Online</a></li>
				</ul></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" href="#"><strong> Inserisci </strong></a>
				<ul class="dropdown-menu bg-dark">
					<li><a class="dropdown-item text-white bg-dark" href="pageVendi">Vendi Immobile</a></li>
					<li><a class="dropdown-item text-white bg-dark" href="pageAffitta"> Affitta Immobile</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="pagedoveSiamo"><strong> Dove siamo</strong></a></li>
			<li class="nav-item"><a class="nav-link" href="pageContatti"><strong>Contatti</strong></a></li>
		</ul>
	</nav>
	
</header>
<body>
	<h1>Benvenuto nella pagine delle iscrizioni compila tutti i campi:</h1>

	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary"
		id="log">
		<form method="post" action="doIscrizione">
			<div class="mb-3 mt-3">
				<label for="username" class="form-label">Username:</label> 
				<input type="text" class="form-control" id="username" placeholder="Immetti Username" name="username">
			</div>

			<div class="mb-3 mt-3">
				<label for="email" class="form-label">Email:</label> 
				<input type="email" class="form-control" id="email" placeholder="Immetti Email" name="email">
			</div>


			<div class="mb-3 mt-3">
				<label for="password" class="form-label">Password:</label> 
				<input type="password" class="form-control" id="pass" placeholder="Immetti Password" name="pass">
			</div>

			<div class="mb-3 mt-3">
				<label for="nome" class="form-label">Nome:</label> 
				<input type="text" class="form-control" id="nome" placeholder="Immetti nome" name="nome">
			</div>
			<div class="mb-3 mt-3">
				<label for="cognome" class="form-label">Cognome:</label>
				<input type="text" class="form-control" id="cognome" placeholder="Immetti Cognome" name="cognome">
			</div>
			<div class="mb-3 mt-3">
				<label for="data"> Età: </label> 
				<input class="form-control" id="eta" type="number" min="16" max="100" name="Età"> <br />
			</div>
			<div class="mb-3 mt-3">
				<label id="sesso1" for="sesso"> Sesso: </label> <input id="sesso2"
					type="radio" name="Sex" value="M"> Maschio  <input
					id="sesso3" type="radio" name="Sex" value="F"> Femmina  <br />
			</div>
			<div class="mb-3 mt-3">
				<label id="permessi" for="permessi"> Cosa Sei : </label> 
				<input id="permessi1" type="radio" name="Permessi" value="V"> Venditore
				 <input id="permessi2" type="radio" name="Permessi"value="A">Acquirente <br />
			</div>

			<input class="btn btn-primary" id="btnIscriviti" type="button" value="Iscriviti">
			<input class="btn btn-danger" id="btnSvuotatutto" type="button" value="Svuota Tutto">
		</form>
	</div>



	<footer>
		<small> Per maggiori informazioni sui nostri servizi
			contattaci all'indirizzo <a href="mailto:antoolli49@gmail.com">
				antoolli49@gmail.com</a> <br>per maggiori informazioni sui <a
			href="terminieCondizioni.html">Termini e Condizioni </a>
		</small>


	</footer>
</body>



</html>