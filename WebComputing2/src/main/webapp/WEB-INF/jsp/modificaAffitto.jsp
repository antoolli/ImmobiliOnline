<!-- jstl  -->
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
	<head>
		<meta charset="utf-8"></meta>
		<!-- Bootstrap -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link href="css/common.css" rel="stylesheet" type="text/css"></link>
		<title>ImmobiliOnline</title>
		<script src="js/modelloDati.js"></script>
		<script src="js/GestioneModificaAffitto.js"></script>
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
	<p class="text-warning text-center">il miglior sito dove comprare e vendere immobili online.</p>
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

	<table id="tabAnnunci" class="table table-bordered table-striped"
		id="annunci">
		<thead>
			<tr>
				<th>Select:</th>
				<th>Id:</th>
				<th>Titolo:</th>
				<th>Descrizione:</th>
				<th>Contratto</th>
				<th>Prezzo:</th>
				<th>Grandezza:</th>
				<th>Latitudine:</th>
				<th>Longitudine:</th>
				<th>Venditore:</th>
				<th>Tipologia:</th>
			</tr>
		</thead>
		<tbody>


				<tr>
					<td><input id="${annuncio.getId()}" type="checkbox" /></td>

					<td>${annuncio.getId()}</td>
					<td>${annuncio.getTitolo()}</td>
					<td><details>
   							 <summary>
     						<strong>Clicca per vedere la descrizione:</strong> 
  							  </summary>
   						 <p> ${annuncio.getDescrizione()}</p>
 						 </details>
					
					</td>
					<td>${annuncio.getContratto()}</td>
					<td>${annuncio.getPrezzo()}</td>
					<td>${annuncio.getMetri()}</td>
					<td>${annuncio.getLatitudine()}</td>
					<td>${annuncio.getLongitudine()}</td>
					<td>${annuncio.getVenditore()}</td>
					<td>${annuncio.getTipologia()}</td>
			

		</tbody>
	</table>
	<input class="btn btn-danger" id="btnCancellaAnnuncio" type="button"
		value="Cancella Annuncio" />

	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary"
		id="log">
		<strong>Modifiche il tuo annuncio:</strong>
		<div class="mb-4 mt-4" id="elencoAnnuncio">
			<input id="CampoTitolo" type="text" placeholder="Inserisci Titolo">
			<input id="CampoDescrizione" type="text" placeholder="Inserisci Descrizione">
			<input id="CampoContratto" type="number" placeHolder="Inserisci mesi Contratto"> 
			<input id="CampoPrezzo" type="number" placeholder="Inserisci Prezzo" min=0>
		</div>
		<div class="mb-3 mt-3" id="elencoAnnuncio">	
			
			<input id="CampoMetri" type="number" placeholder="Inserisci Metri" min=0> 
			<input id="Campolatitudine" type="text" placeholder="Inserisci Latitudine"> 
			<input id="Campolongitudine" type="text" placeholder="Inserisci Longitudine"> 
			
				 <select class="tipologia1" id="tipologia">
				<option value="appartamenti">Appartamento</option>
				<option value="ville">Villa</option>
				<option value="box">Box Auto</option>
				<option value="terreno">Terreno Edificabile</option>
				<option value="monolocale">Monolocale</option>
				<option value="bilocale">Bilocale</option>
				<option value="garage">Garage</option>
				</select>
				
			
			<div class="btn-group">
		<!--  		<input class="btn btn-primary" id="btnInserisci" type="button" value="Inserisci Annuncio">-->
				<input class="btn btn-warning" id="btnModifica" type="button" value="Modifica Annuncio" />
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