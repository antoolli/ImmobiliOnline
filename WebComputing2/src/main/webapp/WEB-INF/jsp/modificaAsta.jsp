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
		<script language="javascript" src="js/gestioneElencoAste.js"></script>
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
	
<p class="text-warning text-center">
		il miglior sito dove comprare e vendere immobili online.
		<c:if test="${username != null}">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark" id="profiles">
 				<div class="container-fluid">
   				 <ul class="navbar-nav">
      			<!-- Avatar -->
      				<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
          				<img src="img/avatar.jpg" class="rounded-circle" height="50" alt="Avatar"  />
      					  </a>
        				<ul class="dropdown-menu bg-dark">
         					 <li> <a class="dropdown-item bg-dark text-white" href="pageProfiles">My profile</a></li>
          					 <li> <a class="dropdown-item bg-dark text-white" href="doLogout">Logout</a></li>
        				</ul>
      				</li>
      				<li class="nav-item"> <h4 class="text-center text-warning" id="benvenuto">Benvenuto ${username}</h4></li>
    		
    			</ul>
  				</div>
			</nav>
		</c:if>
		<c:if test="${username == null}">
			Se ancora non sei iscritto cosa aspetti <a href="pageIscriviti">CLICCA
				QUI</a>  altrimenti <a href="pageLogin">LOGIN</a>
		</c:if>
		</p>
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
	<table id="tabAnnunci" class="table table-bordered table-striped" id="annunci">
		<thead>
			<tr>
				<th>Select:</th>
				<th>Id:</th>
				<th>IdAnnuncio:</th>
				<th>Titolo:</th>
				<th>Prezzo Base:</th>
				<th>Ultimo Prezzo:</th>
				<th>Acquirente:</th>
				<th>Scadenza:</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td><input id="${ann.getId()}" type="checkbox" /></td>
					<td>${ann.getId()}</td>
					<td>${ann.getIdAnnuncio()}</td>
					<td>${ann.getTitolo()}</td>
					<td>${ann.getPrezzoBase()}</td>
					<td>${ann.getUltimoPrezzo()}</td>
					<td>${ann.getAcquirente()}</td>
					<td>${ann.getScadenza()}</td>
			</tr>
		</tbody>
	</table>
	<input class="btn btn-danger" id="btnCancellaAsta" type="button" value="Cancella Asta"/>
	<div class="container mt-3 rounded mx-auto d-block border border-secondary" >
		<strong>Modifiche admin:</strong>
		<div class="mb-4 mt-4" id="modAsta">
			<input id="CampoTitolo" type="text" placeholder="Inserisci Titolo">
			<input id="CampoPrezzoBase" type="number" placeholder="Inserisci Prezzo Base">
			<input id="CampoScadenza" type="date" placeholder="Inserisci data di Scadenza">
		
			<div class="btn-group">
				<input class="btn btn-warning" id="btnModifica" type="button" value="Modifica Asta" />
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