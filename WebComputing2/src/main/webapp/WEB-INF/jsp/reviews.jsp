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
		<script language="javascript" src="js/modelloDati.js"></script>
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
			Se ancora non sei iscritto cosa aspetti <a href="pageIscriviti">CLICCA QUI</a>  altrimenti <a href="pageLogin">LOGIN</a>
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
	<h1>Recensioni Clienti:</h1>
	<div
		class="container mt-3 rounded mx-auto d-block border border-secondary bg-light">
		<div class="accordion" id="accordionExample">

			<c:forEach items="${recensioni}" var="recensione">



				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="false" aria-controls="${recensione.getCodiceId()}">
							<strong>Valutazione di: </strong> ${recensione.getValutazione()}
							stelle <strong> al Venditore:</strong>
							${recensione.getVenditore()}
						</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show"
						aria-labelledby="${recensione.getCodiceId()}"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">${recensione.getRecensione()}</div>
					</div>
				</div>
			</c:forEach>

		</div>








		<h1>Scrivi la tua recensione sull'immobile:</h1>
		<form>
			<label for="customRange2" class="form-label">Dai un voto da 0 a 5</label> 
			<input type="range" class="form-range" min="0" max="5" id="range">
			<div class="form-group">
				<label for="comment">Comment:</label>
				<textarea class="form-control" rows="5" id="recensione"></textarea>
			</div>
			<input class="btn btn-primary" id="btnInvia" type="button" value="Invia">
		</form>
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
window.addEventListener("load",function(){
	addEvent();
	
	
	
});

function addEvent(){
	var btnInvia=document.querySelector("#btnInvia");
	
	btnInvia.addEventListener("click",function(){
		var campoRecensione=document.querySelector("#recensione");
		var range= document.querySelector("#range").value;
		var idAnnuncio = ${annuncio.getId()};
		var venditore = "${annuncio.getVenditore()}";
		var valutazione=range;
		var recensione=campoRecensione.value;
	
				
		var rec= new Recensione(idAnnuncio,venditore,recensione,valutazione);
		
		$.ajax({
		type: "POST",
		url: "/addRecensione",
		contentType: "application/json",
		data: JSON.stringify(rec),
		success: function() {     //se mi restituisce 200
			alertify.set('notifier','position', 'top-center');
			alertify.success('La tua Recensione è stata caricata correttamente');
			
		},
		error: function(xhr){
			alert(xhr.responseJSON.message);
			console.log(xhr);
		}             
	 });
		window.setTimeout(function() {
  			window.location.reload();
			}, 3000);
		
	});
	

}

</script>