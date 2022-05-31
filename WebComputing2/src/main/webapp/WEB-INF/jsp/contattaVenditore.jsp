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
			<script language="javascript" src="js/GestioneEmail.js" ></script>
			<!-- JavaScript Alertify -->
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	
	<h1>codice Immobile scelto: ${annuncio.getId()} </h1>
		<h2 class="text-center">Invia un messaggio al venditore</h2>
		<div class="container mt-3 rounded mx-auto d-block border border-secondary bg-light">
		<form>
			<div class="mb-3">
  				<label for="labelEmail" class="form-label">Email Venditore:</label>
 				 <input type="email" class="form-control" id="emailVenditore" value="${venditore.getEmail()}" placeholder="${venditore.getEmail()}" aria-label="Disabled input example" disabled>
				</div>
			
			 <div class="mb-3">
    			<label for="LabelEmail" class="form-label">Email address</label>
    			<input type="email" class="form-control" id="emailAcquirente" aria-describedby="emailHelp">
   				 <div id="emailHelp" class="form-text">Inserisci la tua email</div>
  			</div>
  			 <div class="mb-3">
    			<label for="LabelUser" class="form-label">Username</label>
    			<input type="text" class="form-control" id="username" aria-describedby="emailHelp">
   				 <div id="emailUsername" class="form-text">Inserisci il tuo username</div>
  			</div>
				
			<div class="mb-3">
  				<label for="text" class="form-label">Scrivi il tuo Messaggio Specificando l'id dell'Immobile interessato :</label>
  				<textarea class="form-control" id="messaggio" rows="3"></textarea>
			</div>
			<input class="btn btn-primary" id="BtnsendMail" type="button" value="SendMail" />
		</form>
		</div>


	<h3 class="text-center">I nostri Contatti per maggiori informazioni:</h3>

	<table class="table table-bordered table-striped" id="contatti">
		<thead>
			<tr>
				<th>Contatti</th>
				<th>Descrizione</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="#"><img src="img/facebook.svg" alt=""
						width="32" height="32" title="Facebook SVG"></a></td>
				<td>Cliccando sul logo accedi direttamente alla nostra pagina
					facebook dove trovi tutti i commenti dei nostri clienti</td>
			</tr>
			<tr>
				<td><a href="#"><img src="img/instagram.svg" alt=""
						width="32" height="32" title="Instagram SVG"></a></td>
				<td>Cliccando sul logo accedi direttamente alla nostra pagina
					Instagram per non perdere nessuna notizia</td>
			</tr>
			<tr>
				<td><img src="img/telephone.svg" alt="" width="32" height="32"
					title="Telephone SVG"></td>
				<td>Contattaci hai seguenti numeri <strong>3895655525</strong>
					oppure <strong>3987456321</strong>
				</td>
			</tr>
			<tr>
				<td><a href="mailto:antoolli49@gmail.com"><img
						src="img/envelope.svg" alt="" width="32" height="32"
						title="Sveglia SVG"></a></td>
				<td>Contattaci per qualsiasi informazioni su case e per
					problemi burocratici assistenza h24</td>
			</tr>
		</tbody>
	</table>


	<footer>
		<small> Per maggiori informazioni sui nostri servizi
			contattaci all'indirizzo <a href="mailto:antoolli49@gmail.com">
				antoolli49@gmail.com</a> <br>per maggiori informazioni sui <a
			href="terminieCondizioni.html">Termini e Condizioni </a> </br>
		</small>


	</footer>
</body>


</html>