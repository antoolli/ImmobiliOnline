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
	<script language="javascript" src="js/gestioneAsta.js"></script>
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
        				<ul class="dropdown-menu">
         					 <li> <a class="dropdown-item" href="pageProfiles">My profile</a></li>
          					 <li> <a class="dropdown-item" href="doLogout">Logout</a></li>
        				</ul>
      				</li>
     				<li class="nav-item"> <h4 class="text-center text-warning">Benvenuto ${username}</h4></li>
    			</ul>
  				</div>
			</nav>
		</c:if>
		<c:if test="${username == null}">
			Se ancora non sei iscritto cosa aspetti <a href="pageIscriviti">CLICCA
				QUI</a>  altrimenti <a href="pageLogin">LOGIN</a>
		</c:if>
	</p>
	<!-- PERCORSO PAGINA LOGIN -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark"
		id="navbarMenu">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/"> Home</a></li>
			<li class="nav-item"><a class="nav-link" href="pageChisiamo"> Chi siamo</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" href="#"> Annunci</a>
				<ul class="dropdown-menu bg-dark">
					<li><a class="dropdown-item text-white bg-dark" href="pageImmInVendita">Immobiliin vendita</a></li>
					<li><a class="dropdown-item text-white bg-dark" href="pageImmInAffitto"> Immobili in affitto</a></li>
					<li><a class="dropdown-item bg-dark text-white" href="pageAste"> Aste Online</a></li>
				</ul></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" href="#"> Inserisci</a>
				<ul class="dropdown-menu bg-dark">
					<li><a class="dropdown-item text-white bg-dark" href="pageVendi">Vendi Immobile</a></li>
					<li><a class="dropdown-item text-white bg-dark" href="pageAffitta"> Affitta Immobile</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="pagedoveSiamo"> Dove siamo</a></li>
			<li class="nav-item"><a class="nav-link" href="pageContatti">Contatti</a></li>
		</ul>
	</nav>
	

</header>

<body>
	<h1>Seleziona l'immobile per cui vuoi procedere con l'asta:</h1>
	<table id="tabAnnunci" class="table table-bordered table-striped"
		id="annunci">
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
			
			<c:forEach items="${annunci}" var="ann">


				<tr>
					<td><input id="${ann.getId()}" name="${ann.getTitolo()}" type="checkbox" titolo="${ann.getTitolo()}" /></td>
					
					<td>${ann.getId()}</td>
					<td>${ann.getTitolo()}</td>
					<td>${ann.getDescrizione()}</td>
					<td>${ann.getPrezzo()}</td>
					<td>${ann.getMetri()}</td>
					<td>${ann.getLatitudine()}</td>
					<td>${ann.getLongitudine()}</td>
					<td>${ann.getVenditore()}</td>
					<td>${ann.getTipologia()}</td>
			</c:forEach>

		</tbody>
	</table>
		<div class="container mt-3 rounded mx-auto d-block border border-secondary" id="log">
		<strong class="text-justify text-center">Inserisci i dati:</strong>
		<div class="mb-2 mt-2" id="CreaAsta">
			<label for="Prezzo" class="form-label">Termine Asta:</label> 
			<label for="PrezzoLabel" id="PrezzoLabel"class="form-label">Inserisci Prezzo:</label> 
			<div class="input-group mb-5">		
				<input id="CampoScadenza" type="date">	
				<span class="input-group-text">€</span>
				<input type="number" class="form-control" id="CampoPrezzoBase" placeholder="Inserisci Prezzo partenza" name="prezzo" min=0 >
				<span class="input-group-text">.00</span>
				<input class="btn btn-success" id="btnInserisci" type="button"value="Crea Asta"> 
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




