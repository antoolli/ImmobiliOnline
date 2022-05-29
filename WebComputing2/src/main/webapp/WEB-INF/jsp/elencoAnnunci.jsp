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
		<script language="javascript" src="js/gestioneElencoVendita.js"></script>
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<!-- JavaScript Alertify -->
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
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
			<li class="nav-item"><a class="nav-link" href="/"><strong> Esci </strong></a></li>
			<li class="nav-item"><a class="nav-link" href="/pageAdmin"><strong>
				<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  				<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
				</svg></strong>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoIscritti"><strong>Elenco Iscritti </strong> </a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoAnnunci"><strong>Elenco Annunci </strong> </a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoRecensioni"><strong> Elenco Recensioni</strong></a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoAffitti"><strong> Elenco Affitti </strong></a></li>
			<li class="nav-item"><a class="nav-link" href="pageElencoAste"><strong> Elenco Aste </strong></a></li>
		</ul>
	</nav>

</header>
<body>

	<table id="tbAnnunci" class="table table-bordered table-striped table-sm" >
		<thead>
			<tr>
				<th>Select:</th>
				<th>Id:</th>
				<th>Titolo:</th>
				<th>Descrizione:</th>
				<th>Prezzo:</th>
				<th>Grandezza:</th>
				<th>Latitudine:</th>
				<th>Longitudine:</th>
				<th>Venditore:</th>
				<th>Tipologia:</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${annunci_vendita}" var="ann">


				<tr>
					<td><input id="${ann.getId()}" type="checkbox" /></td>

					<td>${ann.getId()}</td>
					<td>${ann.getTitolo()}</td>
					<td><details>
   							 <summary>
     							<strong>Clicca per vedere la descrizione:</strong> 
  							  </summary>
   						 <p> ${ann.getDescrizione()}</p>
 						 </details>
					
					</td>
					<td>${ann.getPrezzo()}</td>
					<td>${ann.getMetri()}</td>
					<td>${ann.getLatitudine()}</td>
					<td>${ann.getLongitudine()}</td>
					<td>${ann.getVenditore()}</td>
					<td>${ann.getTipologia()}</td>
			</c:forEach>

		</tbody>
	</table>
	<input class="btn btn-danger" id="btnCancellaAnnuncio" type="button" value="Cancella Annuncio" />

	<div class="container mt-3 rounded mx-auto d-block border border-secondary" id="log">
		<strong>Modifiche admin:</strong>
		<div class="mb-4 mt-4" id="elenco">
			<input id="CampoTitolo" type="text" placeholder="Inserisci Titolo">
			<input id="CampoDescrizione" type="text" placeholder="Inserisci Descrizione">
			<input id="CampoPrezzo" type="number" placeholder="Inserisci Prezzo" min=0>
			<input id="CampoMetri" type="number" placeholder="Inserisci Metri" min=0>
		</div>
		<div class="mb-3 mt-3" id="elenco">
			
			<input id="Campolatitudine" type="text" placeholder="Inserisci Latitudine">
			<input id="Campolongitudine" type="text" placeholder="Inserisci Longitudine">
			 <select   id="tipologia">
				<option value="appartamenti">Appartamento</option>
				<option value="ville">Villa</option>
				<option value="box">Box Auto</option>
				<option value="terreno">Terreno Edificabile</option>
				<option value="monolocale">Monolocale</option>
				<option value="bilocale">Bilocale</option>
				<option value="garage">Garage</option>
				</select>
			</div>
				<div class="btn-group  flex-wrap"id ="btnVendita">
			
				<input class="btn btn-primary" id="btnInserisci" type="button"
					value="Inserisci Annuncio"> <input class="btn btn-warning"
					id="btnModifica" type="button" value="Modifica Annuncio" />
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