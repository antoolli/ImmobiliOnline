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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmRdJRju8NSYI_9WqCABJwbrNs_pAnFG0&amp;sensor=false"> </script>
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
      			<div class="container-fluid">
      				<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
          				<img src="img/avatar.jpg" class="rounded-circle" height="50" alt="Avatar"  />
      					  </a>
        				<ul class="dropdown-menu bg-dark">
         					 <li> <a class="dropdown-item bg-dark text-white" href="pageProfiles">My profile</a></li>
          					 <li> <a class="dropdown-item bg-dark text-white" href="doLogout">Logout</a></li>
        				</ul>
      				</li>
      				</div>
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
	</header>


<body>
	
	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/carosel1.jpg"
					class="img-fluid img-thumbnail rounded mx-auto d-block">
				<div class="carousel-caption">
					<h3>I Nostri Agenti</h3>
					<p>I nostri agenti sono sempre disponibile per un sopralluogo 7
						giorni su 7</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="img/c2.png"
					class="img-fluid img-thumbnail rounded mx-auto d-block">
				<div class="carousel-caption">
					<h3>Tutto Online</h3>
					<p>qualsiasi domande che voi avete la risposta è sul vostro
						smartphone</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/c3.jpg"
					class="img-fluid img-thumbnail rounded mx-auto d-block">
				<div class="carousel-caption">
					<h3>La Vostra Casa a Portata di Mano</h3>
					<p>Ci occuperemo noi di tutti la burocrazia e delle possibile
						problematiche</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>


	<nav class="navbar navbar-expand-sm navbar-dark bg-dark" id="navHomePage">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/"> Home</a></li>
			<li class="nav-item"><a class="nav-link" href="pageChisiamo">Chi siamo</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" href="#"> Annunci</a>
				<ul class="dropdown-menu bg-dark">
					<li><a class="dropdown-item bg-dark text-white" href="pageImmInVendita">Immobili in vendita</a></li>
					<li><a class="dropdown-item bg-dark text-white" href="pageImmInAffitto"> Immobili in affitto</a></li>
					<li><a class="dropdown-item bg-dark text-white" href="pageAste"> Aste Online</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" href="#"> Inserisci</a>
				<ul class="dropdown-menu bg-dark">
					<li><a class="dropdown-item bg-dark text-white" href="pageVendi">Vendi Immobile</a></li>
					<li><a class="dropdown-item bg-dark text-white" href="pageAffitta"> Affitta Immobile</a></li>
				</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="pagedoveSiamo"> Dove siamo</a></li>
			<li class="nav-item"><a class="nav-link" href="pageContatti"> Contatti </a></li>
			<li class="nav-item"><a class="nav-link" href="pageAdmin"> Admin </a></li>
		</ul>
	</nav>

	<footer>
		<small> Per maggiori informazioni sui nostri servizi contattaci all'indirizzo <a href="mailto:antoolli49@gmail.com">antoolli49@gmail.com </a>
		 <br> per maggiori informazioni sui <a href="terminieCondizioni.html">Termini e Condizioni </a> </br>
		</small>
	</footer>

</body>

</html>