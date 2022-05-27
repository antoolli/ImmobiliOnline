<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script language="javascript" src="js/modelloDati.js"></script>
<script language="javascript" src="js/gestioneImmobiliInVendita.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
          				<img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img (31).webp" class="rounded-circle" height="50" alt="Avatar"  />
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



	<div class="container mt-3 rounded mx-auto d-block border border-secondary ">
		<h1 class="text-center">Hai filtrato l'immobile per:${tipologia}</h1>
		
			<div class="container">
	 <div class="row">
    
    <div class="col-sm"> 
    	  	<div class="select-wrapper">
 				 <label for="defaultSelect"><strong>Ordina per:</strong></label>
  				<select id="OrdinaPer">
				    <option selected="" value="">Scegli un'opzione</option>
				    	<option value="appartamenti">Appartamento</option>
						<option value="ville">Villa</option>
						<option value="box">Box Auto</option>
						<option value="terreno">Terreno Edificabile</option>
						<option value="monolocale">Monolocale</option>
						<option value="bilocale">Bilocale</option>
						<option value="garage">Garage</option>
  				</select>
  				<input class="btn btn-success " id="btnOrdina" type="button"value="Ordina"> 
    
    	</div>
	</div>
</div>
			
			
		<div class="row">
			<c:forEach items="${annunci_vendita}" var="ann">
				<div class="col-lg-4 mt-4">
					<div class="card" id="card" name="${ann.getId() }">
						<img class="card-img-top" src="img/c2.png" alt="Card image"
							style="width: 100%">
						<div class="card-body text-center">
							<h4 class="card-title">${ann.getTitolo() }</h4>
							<p class="card-text">${ann.getDescrizione()}</p>
							<c:if test="${ann.getPrezzoVecchio() != 0}">
							<p class="card-text"><del class="text-danger">${ann.getPrezzoVecchio()}</del> <strong>${ann.getPrezzo()} €</strong></p>
							</c:if>
							<c:if test="${ann.getPrezzoVecchio() == 0}">
								<p class="card-text">Prezzo:<strong> ${ann.getPrezzo()}€ </strong></p>
								</c:if>
							<p class="card-text">Dimensioni:<strong> ${ann.getMetri()}  mq </strong></p>
							<p class="card-text">Venditore:<strong> ${ann.getVenditore()}</strong></p>
							<p class="card-text">Tipologia:<strong> ${ann.getTipologia()}</strong></p>
							
							<form method="get" action="/infoVendita">
								<input class="d-none" id="visualizza" type="radio" name="visualizza" value="${ann.getId()}" checked> 
								<input id="btnInfo" class="btn btn-primary " type="submit" value="info">
							</form>
						</div>
					</div>
				</div>
				
			</c:forEach>
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


