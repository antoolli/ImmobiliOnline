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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
    			<a class="nav-link" href="pagePreferiti"><button type="button" id="Love"  class="btn btn-outline-warning" title="Visualizza elenco Preferiti" ><svg xmlns="http://www.w3.org/2000/svg" width="40" height="35" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  					<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>
					Preferiti</button>
				</a>
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



	<div class="container mt-3 rounded mx-auto d-block border border-secondary ">
		<h1 class="text-center">Immobili in Vendita:</h1>
			<div class="container">
	 <div class="row">
    	<div class="col-sm"> 
    		<div class="select-wrapper">
				  <label for="defaultSelect"><strong>Filtra per:</strong></label>
				  <form method="post" action="/pageFiltrato">
				  <select id="filtra" name="filtra">
	    			    <option value="appartamenti">Appartamento</option>
						<option value="ville">Villa</option>
						<option value="box">Box Auto</option>
						<option value="terreno">Terreno Edificabile</option>
						<option value="monolocale">Monolocale</option>
						<option value="bilocale">Bilocale</option>
						<option value="garage">Garage</option>
						<option value="tutti">tutti</option>
						
				  </select>
				  	<input class="btn btn-success " id="btnFiltra" type="submit" value="filtra"> 
				  	</form>
			</div>
    </div>
    <div class="col-sm"> 
    	  	<div class="select-wrapper"id="ordinaper">
 				 <label for="defaultSelect"><strong>Ordina per:</strong></label>
  				
  				  <form method="post" action="/pageOrdinaV">
					<select id="ordina" name="ordina">
				     <option value="prezzoC">Prezzo Crescente</option>
				     <option value="prezzoD">Prezzo Decrescente</option>	
				     <option value="grandezzaC">Dimensioni Crescente</option>
				     <option value="grandezzaD">Dimensioni Decrescenti</option>	
  				</select>
  				<input class="btn btn-success " id="btnOrdina" type="submit" value="Ordina">
				</form>    
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



