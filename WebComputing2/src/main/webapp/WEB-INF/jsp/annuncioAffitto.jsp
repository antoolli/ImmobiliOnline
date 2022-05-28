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

	<!--  <div class="container-fluid bg-light">-->
	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary bg-light">
		<h1 id="tit" title="${annuncio.getId()}" class="text-center"> Codice annuncio: ${annuncio.getId() }</h1>
		<img src="img/c2.png" class="img-thumbnail mx-auto d-block" id="yourImgTag"  />
		<h4 class="text-center text-primary"><strong> Titolo:</strong></h4>
		<h5 class="text-center">${annuncio.getTitolo() }</h5>
		<h4 class="text-center text-primary"><strong>Descrizione:</strong></h4>
		<h5 class="text-center">${annuncio.getDescrizione() }</h5>
		<h4 class="text-center text-primary"><strong>Contratto di:</strong></h4>
		<h5 class="text-center">${annuncio.getContratto()} mesi</h5>
		<h4 class="text-center text-primary"><strong>Prezzo:</strong></h4>
			<c:if test="${annuncio.getPrezzoVecchio() != 0}">
			<h5 class="text-center"><del class="text-danger">${annuncio.getPrezzoVecchio()}</del> <strong>${annuncio.getPrezzo()} €</strong></h5>
			
			</c:if>
			<c:if test="${annuncio.getPrezzoVecchio() == 0}">
			<h5 class="text-center">${annuncio.getPrezzo()} €</h5>
			</c:if>		
		<h4 class="text-center text-primary"><strong>Dimensioni:</strong></h4>
		<h5 class="text-center ">${annuncio.getMetri()} mq</h5>
		<h4 class="text-center text-primary"><strong>Venditore:</strong></h4>
		<h5 class="text-center">${annuncio.getVenditore()}</h5>
		<h4 class="text-center text-primary"><strong>Tipologia:</strong></h4>
		<h5 class="text-center">${annuncio.getTipologia()}</h5>


		<div class="btn-group  flex-wrap" id="groupbt">
			<form method="post" action="/contattaidAffitti">
				<input class="d-none" id="contattaci" type="radio" name="contattaci" value="${annuncio.getId()}" checked> 
				<input id="btnContattaci" class="btn btn-primary " type="submit" value="Contattaci">
			</form>
			<form method="post" action="/viewsMapAffitto">
				<input class="d-none" id="visualizzaMappa" type="radio" name="visualizzaMappa" value="${annuncio.getId()}" checked>
				<input id="btnVisualizza" class="btn btn-warning " type="submit" value="Visualizza Mappa">
			</form>
			<form method="post" action="/ReviewsAffitto">
				<input class="d-none" id="visualizzaRecensione" type="radio" name="visualizzaRecensione" value="${annuncio.getId()}" checked>
				<input id="btnRecensione" class="btn btn-danger " type="submit"
					value="Visualizza Recensione">
			</form>
			</div>
			<c:if test="${logger.getUsername().equals(annuncio.getVenditore())}">
			<div class="btn-group flex-wrap" id="groupbt">
				<form method="post" action="/ModificaAnnuncioAffitto">
					<input class="d-none" id="modificaAnnuncio" type="radio" name="modificaAnnuncio" value="${annuncio.getId()}" checked>
					<input id="btnRecensione" class="btn btn-success" type="submit" value="Modifica Annuncio">
				</form>
				<div class="row g-3">
  					<div class="col-auto">
    					<label for="Sconto" class="visually-hidden">Sconto</label>
   						 <input type="number" class="form-control" id="sconto" placeholder="Inserisci Sconto in percentuale" value="0" min="0" max="90" step="10">
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
			url: "/applicaScontoAffitto",
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

