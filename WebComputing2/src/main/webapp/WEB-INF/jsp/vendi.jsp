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
	<script language="javascript" src="js/modelloDati.js"></script>
	<script language="javascript" src="js/gestioneAnnunciVendita.js"></script>
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
			<div id="benvenuto">
				
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
			</div>
		</c:if>
		<c:if test="${username == null}">
			Se ancora non sei iscritto cosa aspetti <a href="pageIscriviti">CLICCA
				QUI</a>  altrimenti <a href="pageLogin">LOGIN</a>
		</c:if>
	</p>
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
	<h1>Metti in vendita il tuo Immobile:</h1>
	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary"
		id="log">
		<form method="post" action="doInserzione">
			<div class="mb-3 mt-3">
				<label for="Titolo" class="form-label">Titolo:</label> <input
					type="text" class="form-control" id="titolo"
					placeholder="Immetti Titolo" name="Titolo">
			</div>
			<div class="mb-3 mt-3">
				<label for="Descrizione" class="form-label">Descrizione:</label> <input
					type="text" class="form-control" id="descrizione"
					placeholder="Descrivi il tuo articolo" name="descrizione">
			</div>
			<div class=" mb-3 mt-3 row">

			
			</div>

			
			<label for="Prezzo" class="form-label">Inserisci Prezzo:</label> 
			<div class="input-group mb-3">			
				<span class="input-group-text">€</span>
				<input type="number" class="form-control" id="prezzo" placeholder="Inserisci Prezzo" name="prezzo" >
				<span class="input-group-text">.00</span>
			</div>
			<div class="mb-3 mt-3">
				<label for="metri" class="form-label">Grandezza in metri quadrati</label> 
				<input type="number" class="form-control" id="metri" placeholder="Grandezza in metri quadrati" name="metri">
			</div>
			<div class="mb-3 mt-3">
				<label for="latitudine" class="form-label">Inserisci Posizione:</label> 
				<input type="text" class="form-control" id="latitudine" placeholder="Inserisci Latitudine" name="latitudine">
				 <input type="text" class="form-control" id="longitudine" placeholder="Inserisci Longitudine" name="longitudine">
			</div>
			<div class="mb-3 mt-3">
				<label for="latitudine" class="form-label">Scegli la tipologia:</label> 
				 <select class="form-control" id="tipologia">
				<option value="appartamenti">Appartamento</option>
				<option value="ville">Villa</option>
				<option value="box">Box Auto</option>
				<option value="terreno">Terreno Edificabile</option>
				<option value="monolocale">Monolocale</option>
				<option value="bilocale">Bilocale</option>
				<option value="garage">Garage</option>
				</select>
			</div>
			


			<input class="btn btn-primary" id="btnInserzione" type="button"
				value="Aggiungi"> <input class="btn btn-danger"
				id="btnSvuotatutto" type="button" value="Svuota Tutto">



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
