<!-- jstl  -->
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
			<strong>La mia famiglia</strong> <br> Pur nativo di Cutro,
			città  cui sono molto legato, le mie origini familiari sono
			Calabresi. Mio nonno Antonio, di cui porto il nome, era nato,
			infetti, nella città  di Cutro. <br> Mio padre Vincenzo è un
			libero professionista e mia madre unâ' insegnante. <br> Ho una
			sorella, Nuccia, studentessa anch'essa Laureata in Informatica, con
			la quale collaboro professionalmente. <br> Mio nonno,
			giovanissimo, si impiegò presso l'Associazione degli Industriali
			della provincia di Crotone dove prestò ininterrotto servizio per
			quasi 50 anni, fino agli anni 70. L'ho perso, purtroppo, quando avevo
			solo tre anni e mio padre Vincenzo me lo ricorda come una onesta
			persona, dedita esclusivamente alla famiglia ed al lavoro. Conservo
			gelosamente i riconoscimenti assegnatigli dalla Confederazione
			Generale dellâindustria Italiana, dalla Camera di Commercio di
			Crotone e le onorificenze di Cavaliere del lavoro ed Ufficiale
			conferitegli dal Presidente della Repubblica. Da mio padre, dottore
			magistrale in filosofia e lettere, laureato in Economia e commercio,
			ho ricevuto fondamentali insegnamenti oltrechÃ© in ambito economico e
			giuridico anche in quello deontologico; detti insegnamenti,
			unitamente alle conoscenze acquisite nel corso degli studi, mi sono
			di indispensabile aiuto nellâaffrontare con appropriata
			professionalità  le problematiche del campo immobiliare. Dal fratello
			di mio padre, lo zio Giuseppe, ingegnere meccanico, consulente di
			direzione e di organizzazione aziendale, ho ricevuto, inoltre,
			utilissimi consigli in materia di gestione delle imprese.
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