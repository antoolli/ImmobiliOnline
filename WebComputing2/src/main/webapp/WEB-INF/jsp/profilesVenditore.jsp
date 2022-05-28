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
		<script language="javascript" src="js/gestioneProfiloVenditore.js"></script>
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
		<p class="text-warning text-center"> il miglior sito dove comprare e vendere immobili online.
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
	<section style="background-color: #9de2ff;">
  <div class="container py-5 h-100  flex-wrap">
    <div class="row d-flex justify-content-center align-items-center h-100  flex-wrap">
      <div class="col-8">
        <div class="card" style="border-radius: 15px;">
          <div class="card-body p-4">
            <div class="d-flex text-black  flex-wrap">
              <div class="flex-shrink-0  flex-wrap">
                <img src="img/avatar.jpg"
                  alt="Generic placeholder image" class="img-fluid"
                  style="width: 180px; border-radius: 10px;" />
              </div>
              <div class="flex-grow-1 ms-3 flex-wrap">
                <h5 class="mb-1">  ${logger.getNome()} &nbsp  ${logger.getCognome()}</h5>
                <p class="mb-2 pb-1" style="color: #2b2a2a;">
                	Venditore
                  
                </p>
                <div class="d-flex justify-content-start rounded-3 p-2 mb-2   flex-wrap"
                  style="background-color: #efefef;">
                  <div>
                  	<div class="d-flex justify-content-start rounded-3 p-2 mb-2   flex-wrap"
                  style="background-color: #efefef;">
                  <div>
                    <p class="small text-muted mb-1"> Email:  &nbsp </p>
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
                      In Vendita &nbsp
                    </p>
                    <p class="mb-0">${oggV}</p>
                  </div>
                  <div>
                    <p class="small text-muted mb-1">
                      In Affitto
                    </p>
                    <p class="mb-0">${oggA}</p>
                  </div>
                </div>
                <div class="d-flex pt-1  flex-wrap">
                	<div class="btn-group  flex-wrap">
                 <a href="pageTabelleVendite" > <button type="button" class="btn btn-warning">In vendita </button></a>
                 <a href="pageTabelleAffitti" >  <button type="button" class="btn btn-primary "> In affitto</button> </a>
                 <a href="pageCreaAste">  <button type="button" class="btn btn-success "> Crea Asta</button></a>
                  <button type="button" id="cancellaUtente" class="btn btn-danger">Cancella Profilo </button>
                	</div>
                </div>
              </div>
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