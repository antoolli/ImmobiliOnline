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
		<!-- JavaScript Alertify -->
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
		<script language="javascript" src="js/gestioneProfiloAcquirente.js"></script>
		
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
  				</div>
			</nav>
		</c:if>
		<c:if test="${username == null}">
			Se ancora non sei iscritto cosa aspetti <a href="pageIscriviti">CLICCA
				QUI</a>  altrimenti <a href="pageLogin">LOGIN</a>
		</c:if>
		</p>
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
	<section style="background-color: #9de2ff;">
  <div class="container py-5 h-100  flex-wrap">
    <div class="row d-flex justify-content-center align-items-center h-100  flex-wrap">
      <div class="col-8">
        <div class="card" style="border-radius: 15px;">
          <div class="card-body p-5">
            <div class="d-flex text-black  flex-wrap">
              <div class="flex-shrink-0  flex-wrap">
                <img src="img/avatar.jpg"
                  alt="Generic placeholder image" class="img-fluid"
                  style="width: 180px; border-radius: 10px;" />
              </div>
              <div class="flex-grow-1 ms-3  flex-wrap">
                <h5 class="mb-1">  ${logger.getNome()} &nbsp  ${logger.getCognome()}</h5>
                <p class="mb-2 pb-1" style="color: #2b2a2a;">
                	Acquirente
                  
                </p>
                <div class="d-flex justify-content-start rounded-3 p-2 mb-2  flex-wrap"
                  style="background-color: #efefef;">
                  <div>
                    <p class="small text-muted mb-1">
                      Email:  &nbsp
                    </p>
                    <p class="mb-0">${logger.getEmail()}&nbsp &nbsp</p>
                  </div>
                  <div>
                    <p class="small text-muted mb-1">
                       Eta: &nbsp
                    </p>
                    <p class="mb-0">${logger.getEta()} </p>
                  </div>
                  <div>
                    <p class="small text-muted mb-1">
                      Sesso: &nbsp
                    </p>
                    <p class="mb-0">${logger.getSesso()}</p>
                  </div>
                  <div>
                    <p class="small text-muted mb-1">
                      Recensioni:
                    </p>
                    <p class="mb-0">${numRec}</p>
                  </div>
                </div>
                <div class="d-flex pt-1  flex-wrap">
                  <a href="VisualizzaRecensioniAcquirente">  <button type="button" id="btnVisualizza" class="btn btn-warning">Visualizza Recensioni </button> </a>
               		<div class="dropdown">
				 	 <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">Info Aste</button>
				  		<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				    	<li><a class="dropdown-item" href="pageAste" > <button type="button" class="btn btn-success "> Partecipa Asta</button></a></li>
				    	<li><a class="dropdown-item" href="AsteAcquirente"><button type="button" class="btn btn-success ">  Visualizza Aste</button></a></li>
				  </ul>
					</div>
                   <button type="button" id="cancellaUtente" class="btn btn-danger">Cancella Profilo </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

	<footer>
		<small> Per maggiori informazioni sui nostri servizi
			contattaci all'indirizzo <a href="mailto:antoolli49@gmail.com">
				antoolli49@gmail.com</a> <br>per maggiori informazioni sui <a
			href="terminieCondizioni.html">Termini e Condizioni </a> </br>
		</small>


	</footer>

</body>
</html>