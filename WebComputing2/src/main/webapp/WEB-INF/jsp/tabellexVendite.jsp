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
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/it_IT/sdk.js#xfbml=1&version=v13.0" nonce="BaDgSV5d"></script>
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
          				<img src="img/profilo.png" class="rounded-circle" height="50" alt="Avatar"  />
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
	<div class="container mt-3 rounded mx-auto d-block border border-secondary ">
			<h1 class="text-center">Immobili in Vendita:</h1>
		<div class="row">
			<c:forEach items="${annunci}" var="ann">

				<div class="col-lg-4 mt-4">
					<div class="card" id="card" name="${ann.getId() }">
						<img class="card-img-top" src="img/c2.png" alt="Card image"
							style="width: 100%">
						<div class="card-body text-center">
							<h4 class="card-title">${ann.getTitolo() }</h4>
							<p class="card-text">${ann.getDescrizione()}</p>
							<p class="card-text">Prezzo:<strong>${ann.getPrezzo()}€ </strong> </p>
							<p class="card-text">Dimensioni:<strong> ${ann.getMetri()} mq</strong></p>
							<p class="card-text">Venditore:<strong> ${ann.getVenditore()}</strong></p>
							<p class="card-text">Tipologia:<strong> ${ann.getTipologia()}</strong></p>
							<form method="get" action="/infoVendita">
								<input class="d-none" id="visualizza" type="radio" name="visualizza" value="${ann.getId()}" checked> </input>
									 <input id="btnInfo" class="btn btn-primary " type="submit" value="info">
							</form>
							<div class="fb-share-button" data-href="http://localhost:8080/infoVendita?visualizza=${ann.getId()}" data-layout="button" data-size="large">
							<a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A8080%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Condividi</a></div>
						</div>
						</div>
					</div>
			</c:forEach>
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