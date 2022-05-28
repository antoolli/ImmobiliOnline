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
		<script language="javascript" src="js/modelloDati.js"></script>
		<script language="javascript" src="js/GestioneElencoRecensioni.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- JavaScript Alertify -->
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
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
	<h1>Elenco recensioni:</h1>
	<table id="tabRecensioni" class="table table-bordered table-striped"
		id="annunci">
		<thead>
			<tr>
				<th>Select:</th>
				<th>Id Immobile:</th>
				<th>Venditore:</th>
				<th>Recensione:</th>
				<th>Valutazione:</th>
				<th>Reviewer</th>
				<th>CodiceId:</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${recensioni}" var="rec">
				<tr>
					<td><input id="${rec.getCodiceId()}" type="checkbox" /></td>
					<td>${rec.getIdAnnuncio()}</td>
					<td>${rec.getVenditore()}</td>
					<td><details>
   							 <summary>
     						<strong>Clicca per vedere la Recensione:</strong> 
  							  </summary>
   						 <p>${rec.getRecensione()}</p>
 						 </details>
					
					</td>
					<td>${rec.getValutazione()}</td>
					<td>${rec.getReviewer()}</td>
					<td>${rec.getCodiceId()}</td>
			</c:forEach>

		</tbody>
	</table>
	<input class="btn btn-danger" id="btnCancellaRecensione" type="button"
		value="Cancella Recensione" />

	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary"
		id="log">
		<strong>Modifiche admin:</strong>
		<div class="mb-3 mt-3">
			<input id="CampoId" type="number" placeholder="Inserisci Id Immobile" min=0>
			<input id="CampoVenditore" type="text" placeholder="Inserisci Venditore">
			<input id="CampoRecensione" type="text" placeholder="Inserisci Recensione">
			<input id="CampoValutazione" type="number" placeholder="Inserisci Valutazione" min=1 max=5>
			<div class="btn-group  flex-wrap">
				<input class="btn btn-primary" id="btnInserisci" type="button" value="Inserisci Recensione"> 
				<input class="btn btn-warning" id="btnModifica" type="button" value="Modifica Recensione" />
			</div>
		</div>
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