
<html>

<head>
<meta charset="utf-8"></meta>
<!-- Bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/common.css" rel="stylesheet" type="text/css"></link>
<title>ImmobiliOnline</title>

</head>
<header class="bg-dark">

	<h1 class="text-center text-warning">ImmobiliOnline</h1>
	<p class="text-warning text-center">
		il miglior sito dove comprare e vendere immobili online. Se ancora non
		sei iscritto cosa aspetti <a href="pageIscriviti">CLICCA QUI</a>
	</p>
	<!-- Elenco  poi faccio diventare nav -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark  id="navbarMenu"">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/"> Home</a></li>
			<li class="nav-item"><a class="nav-link" href="pageChisiamo">Chi
					siamo</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" role="button"
				data-bs-toggle="dropdown" href="#"> Annunci</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="pageImmInVendita">Immobili
							in vendita</a></li>
					<li><a class="dropdown-item" href="pageImmInAffitto">
							Immobili in affitto</a></li>
				</ul></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" role="button"
				data-bs-toggle="dropdown" href="#"> Inserisci</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="pageVendi">Vendi
							Immobile</a></li>
					<li><a class="dropdown-item" href="pageAffitta"> Affitta
							Immobile</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="pagedoveSiamo">
					Dove siamo</a></li>
			<li class="nav-item"><a class="nav-link" href="pageContatti">
					Contatti </a></li>
		</ul>
	</nav>
	<!-- PERCORSO PAGINA LOGIN -->
</header>

<body>
	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary"
		id="log">
		<form method="post" action="loginServices">
			<div class="mb-3 mt-3 ">
				<label for="username" class="form-label">Username:</label> <input
					type="username" class="form-control" id="username"
					placeholder="Enter username" name="username">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password:</label> <input
					type="password" class="form-control" id="password"
					placeholder="Enter password" name="password">
			</div>
			<div class="form-check mb-3">
				<label class="form-check-label"></label> <input
					class="form-check-input" type="checkbox" name="remember">
				Remember me
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

	<footer>
		<small> Per maggiori informazioni sui nostri servizi
			contattaci all'indirizzo <a href="mailto:antoolli49@gmail.com">
				antoolli49@gmail.com</a> <br>per maggiori informazioni sui <a
			href="terminieCondizioni.html">Termini e Condizioni </a> </br>
		</small>


	</footer>


</body>


<!-- 
<form action="/action_page.php">
 Username: <input type="text" name="username" /> 
		<br />
		 Password: <input type="password" name="pass" /> <br /> <input type="submit" />
</form> -->




</html>