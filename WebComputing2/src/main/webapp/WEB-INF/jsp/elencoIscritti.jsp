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
		<title>ImmobiliOnline</title>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- JavaScript Alertify -->
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
		<script language="javascript" src="js/modelloDati.js"></script>
		<script language="javascript" src="js/gestioneElencoIscritti.js"></script>
	</head>
<header class="bg-dark">
	<h1 class="text-center text-warning">ImmobiliOnline</h1>
	<p class="text-warning text-center">il miglior sito dove comprare e
		vendere immobili online.</p>
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
	<table id="tabIscritti" class="table table-bordered table-striped"
		id="contatti">
		<thead>
			<tr>
				<th>Select:</th>
				<th>Username:</th>
				<th>Email:</th>
				<th>Password</th>
				<th>Nome:</th>
				<th>Cognome:</th>
				<th>Eta:</th>
				<th>Sesso</th>
				<th>Permessi</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${users}" var="us">


				<tr>
					<td><input id="${us.getUsername()}" type="checkbox" /></td>

					<td>${us.getUsername()}</td>
					<td>${us.getEmail()}</td>
					<td>${us.getPassword()}</td>
					<td>${us.getNome()}</td>
					<td>${us.getCognome()}</td>
					<td>${us.getEta()}</td>
					<td>${us.getSesso()}</td>
					<td>${us.getPermessi()}</td>
			</c:forEach>

		</tbody>

	</table>
	<input class="btn btn-danger" id="btnCancella" type="button" value="Cancella Utente" />
	<input class="btn btn-success" id="btnAmministratore" type="button" value="Nomina Amministratore" />

	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary"
		id="log">
		<strong>Modifiche admin:</strong>
		<div class="mb-3 mt-3">
			<input id="CampoUsername" type="text" placeholder="Inserisci Username"> 
			<input id="CampoEmail" type="email" placeholder="Inserisci Email">
			<input id="CampoPassword" type="password" placeholder="Inserisci Password">
			<input id="CampoNome" type="text" placeholder="Inserisci Nome">
			<input id="CampoCognome" type="text" placeholder="Inserisci Cognome">
			<input id="CampoEta" type="number" placeholder="Inserisci età" min="16" max="100">
		</div>

		<div class="mb-3 mt-3">

			<select class="form-control w-25" id="CampoSesso">
				<option value="M">Maschio</option>
				<option value="F">Femmina</option>
			</select> <select class="form-control w-25" id="CampoPermessi">
				<option value="A">Acquirente</option>
				<option value="V">Venditore</option>
				<option value="Admin">Admin</option>
			</select>

			<div class="btn-group" id="bottoni">
				<input class="btn btn-primary" id="btnInserisci" type="button"
					value="Inserisci Utente"> <input class="btn btn-warning"
					id="btnModifica" type="button" value="Modifica Utente" />
			</div>



		</div>
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