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
		<!-- JavaScript Alertify -->
				<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
		<title>ImmobiliOnline</title>
		<script language="javascript" src="js/gestionePreferitiVendita.js"></script>
	</head>
	
<header class="bg-dark">
	<h1 class="text-center text-warning">ImmobiliOnline</h1>
	<p class="text-warning text-center"> il miglior sito dove comprare e vendere immobili online.
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
    			<a class="nav-link" href="pagePreferiti"><button type="button" id="Love"  class="btn btn-outline-warning" title="Visualizza elenco Preferiti" ><svg xmlns="http://www.w3.org/2000/svg" width="40" height="35" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  					<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>
					Preferiti</button>
				</a>
  				</div>
			</nav>
		</c:if>
		<c:if test="${username == null}">
			Se ancora non sei iscritto cosa aspetti <a href="pageIscriviti">CLICCA QUI</a>  altrimenti <a href="pageLogin">LOGIN</a>
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
	

	<!--  <div class="container-fluid bg-light">-->
	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary bg-light">
		<h1 id="tit" title="${annuncio.getId()}" class="text-center">Codice annuncio: ${annuncio.getId() }</h1>
		<img src="img/vendesi1.jpg" class=" mx-auto d-block" id="yourImgTagVendita"  />
		<button type="button" id="btnLove"  class="btn btn-outline-danger" title="Aggiungi hai Preferiti" ><svg xmlns="http://www.w3.org/2000/svg" width="40" height="35" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  				<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
				</svg>
				Aggiungi ai preferiti
		</button>
		<h4 class="text-center text-primary"><strong>Titolo:</strong></h4>
		<h5 class="text-center">${annuncio.getTitolo() }</h5>
		<h4 class="text-center text-primary"><strong>Descrizione:</strong></h4>
		<h5 class="text-center">${annuncio.getDescrizione() }</h5>
		<h4 class="text-center text-primary"><strong>Prezzo:</strong></h4>	
			<c:if test="${annuncio.getPrezzoVecchio() != 0}">
			<h5 class="text-center text-primary"><del class="text-danger">${annuncio.getPrezzoVecchio()}</del> <strong>${annuncio.getPrezzo()} €</strong></h5>
			</c:if>
			<c:if test="${annuncio.getPrezzoVecchio() == 0}">
			<h5 class="text-center">${annuncio.getPrezzo()} €</h5>
			</c:if>
		

		<h4 class="text-center text-primary"><strong>Dimensioni:</strong></h4>
		<h5 class="text-center">${annuncio.getMetri()} mq</h5>
		<h4 class="text-center text-primary"><strong>Venditore:</strong></h4>
		<h5 class="text-center">${annuncio.getVenditore()}</h5>
		<h4 class="text-center text-primary"><strong>Tipologia:</strong></h4>
		<h5 class="text-center">${annuncio.getTipologia()}</h5>
		
	

		<div class="btn-group flex-wrap" id="groupbt">
			<form method="post" action="/contattaid">
				<input class="d-none" id="contattaci" type="radio" name="contattaci"
					value="${annuncio.getId()}" checked> <input
					id="btnContattaci" class="btn btn-primary " type="submit"
					value="Contattaci">
			</form>
			<form method="post" action="/viewsMap">
				<input class="d-none" id="visualizzaMappa" type="radio"
					name="visualizzaMappa" value="${annuncio.getId()}" checked>
				<input id="btnVisualizza" class="btn btn-warning " type="submit"
					value="Visualizza Mappa">
			</form>
			<form method="post" action="/Reviews">
				<input class="d-none" id="visualizzaRecensione" type="radio"
					name="visualizzaRecensione" value="${annuncio.getId()}" checked>
				<input id="btnRecensione" class="btn btn-danger " type="submit"
					value="Visualizza Recensione">
			</form>
			</div>
			
			<c:if test="${logger.getUsername().equals(annuncio.getVenditore())}">
			
			<div class="btn-group flex-wrap" id="groupbt">
				<form method="post" action="/ModificaAnnuncioVendita">
					<input class="d-none" id="modificaAnnuncio" type="radio" name="modificaAnnuncio" value="${annuncio.getId()}" checked>
					<input id="btnModificaAnnuncio" class="btn btn-success" type="submit" value="Modifica Annuncio">
				</form>
					
				<div class="row g-3">
  					<div class="col-auto">
    					<label for="Sconto" class="visually-hidden">Sconto</label>
   						 <input type="number" class="form-control" id="sconto" placeholder="Inserisci Sconto in percentuale" value="0" min="0" max="80" step="10">
				  	</div>
  						<div class="col-auto">
   							 <input id="btnSconto" class="btn btn-primary" type="button" value="Sconto">
  						</div>
				</div>
			
			</div>
			</c:if>
			


		
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

<script>
$(document).ready(function(){
	
	$( "#btnSconto").click(function() {
		var percentuale=document.querySelector("#sconto").value;
		$.ajax({
			type: "POST",
			url: "/applicaSconto",
			contentType: "application/json",
			data: JSON.stringify(percentuale),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('lo sconto è stato applicato con successo');
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
	});
});
	
	

</script>

