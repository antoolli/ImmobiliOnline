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
	<!-- PERCORSO PAGINA LOGIN -->
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
	<article class="container-fluid">
		<h1>
			<b> chi siamo ?</b>
		</h1>
		<p>
			<em><strong> Dott. Antonio Davide Oliverio </strong> </em> <br>
			<strong>Mi presento</strong> <br> Sono nato nel 2000 a Crotone
			ove ho portato a compimento gli studi secondari fino al conseguimento
			della maturità nell' anno 2018. in questa città  ho felicemente
			trascorso la mia adolescenza e la mia prima giovinezza insieme a
			tantissimi amici ed amiche e, naturalmente, alla mia famiglia. Ho
			proseguito gli studi iscrivendomi alla facoltà  di Informatica presso
			l' università  delle Calabria.
		</p>
		
		<p>
			<strong>Perchè ho deciso di operare nel campo immobiliare</strong> <br>
			Conseguita la laurea, ben presto ho avuto modo di convincermi che la
			generale crisi economica degli ultimi due o tre anni avrebbe, tra
			l'altro, richiesto e resi necessari profondi cambiamenti nello stile
			degli operatori del campo immobiliare. Ciò, tuttavia, non mi ha fatto
			desistere dalla scelta di inserirmi nel settore, fortemente convinto
			come sono che i nuovi contesti di mercato avrebbero favorito approcci
			del tutto nuovo alla professione. Credo infatti che lâoperatore
			immobiliare, oltre alla tradizionale mediazione, sarà  in futuro
			chiamato ad affrontare situazioni richiedenti una specifica elevata
			professionalità , frutto anche di un costante aggiornamento, riguardo
			alle complesse problematiche fiscali, creditizie ed amministrative
			inerenti al settore. Esso dovrà , in modo particolare, formarsi nella
			valorizzazione dei patrimoni immobiliari al fine di ottimizzarne i
			rendimenti. La professione dovrà  fere i conti anche con le
			importanti recenti modifiche ho scelto di esercitare la professione
			in forma autonoma ed individuale, consapevole delle maggiori
			difficoltà  che ciò avrebbe comportato per il mio inserimento; ho
			voluto con ciò sentirmi libero di dare slancio alle mie personali
			iniziative senza le limitazioni delle usuali forme associative, che
			mi avrebbero costretto entro linee operative in gran parte
			prestabilite. <br> Con entusiasmo e convinzione sono, quindi,
			diventato un giovane imprenditore, fiducioso nellâavvenire e <em>nette</em>
			prospettive che il mondo , anche in momenti difficili come
			l'attuale, ci mette a disposizione; spetta soprattutto a noi
			giovani saperle individuare e cogliere.
		</p>

	</article>


	<footer>
		<small> Per maggiori informazioni sui nostri servizi
			contattaci all'indirizzo <a href="mailto:antoolli49@gmail.com">
				antoolli49@gmail.com</a> <br>per maggiori informazioni sui <a
			href="terminieCondizioni.html">Termini e Condizioni </a> </br>
		</small>


	</footer>
</body>


</html>