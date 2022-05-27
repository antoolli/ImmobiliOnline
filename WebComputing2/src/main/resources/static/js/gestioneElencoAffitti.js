window.addEventListener("load",function(){
	addEvent();
});

function addEvent(){
	
	var btnCancella= document.querySelector("#btnCancellaAnnuncio");
	btnCancella.addEventListener("click",function(){
		var selectedCheckBoxes=document.querySelectorAll("input:checked");
	
			if (selectedCheckBoxes.length > 0){
				selectedCheckBoxes.forEach(function(checkBox,index){
					var id = checkBox.getAttribute("id");
					$.ajax({
						type: "POST",
						url: "/deleteAffitto",
						contentType: "application/json",
						data: JSON.stringify(id),
						success: function() {     //se mi restituisce 200
							alertify.set('notifier','position', 'top-center');
 							alertify.success('La Cancellazione è avvenuta con successo');
						},
						error: function(xhr){
							alert(xhr.responseJSON.message);
							console.log(xhr);
						}             
					});
				});
			}else{
					alertify.set('notifier','position', 'top-center');
 					alertify.error('Nessun Elemento Selezionato');
			}
			window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
	});
	
	
	
	var btnAggiungi= document.querySelector("#btnInserisci");
	btnAggiungi.addEventListener("click",function(){
		var campoTitolo=document.querySelector("#CampoTitolo");
		var campoDescrizione= document.querySelector("#CampoDescrizione");
		var campoContratto=document.querySelector("#CampoContratto");
		var campoPrezzo= document.querySelector("#CampoPrezzo");
		var campoMetri= document.querySelector("#CampoMetri");
		var campoLatitudine=document.querySelector("#Campolatitudine");
		var campoLongitudine=document.querySelector("#Campolongitudine");
		var campoTipologia=document.querySelector("#tipologia")
		console.log(campoContratto);
	
		var titolo = campoTitolo.value;
		var descrizione= campoDescrizione.value;
		var tipologia = campoTipologia.value;
		var contratto= campoContratto.value;
		var prezzo= campoPrezzo.value;
		var metri= campoMetri.value;
		var latitudine= campoLatitudine.value;
		var longitudine= campoLongitudine.value;
		var annuncio = new AnnunciInAffitto(titolo,descrizione,contratto,prezzo,metri,latitudine,longitudine,tipologia);
		$.ajax({
			type: "POST",
			url: "/addAffitta",
			contentType: "application/json",
			data: JSON.stringify(annuncio),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('Annuncio caricato Con sucesso');
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
			window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
	});
	
	var btnModifica= document.querySelector("#btnModifica");
	btnModifica.addEventListener("click",function(){
		var selectedCheckBoxes=document.querySelector("input:checked");
		var id = selectedCheckBoxes.getAttribute("id");
		var campoTitolo=document.querySelector("#CampoTitolo");
		var campoDescrizione= document.querySelector("#CampoDescrizione");
		var campoContratto=document.querySelector("#CampoContratto");
		var campoPrezzo= document.querySelector("#CampoPrezzo");
		var campoMetri= document.querySelector("#CampoMetri");
		var campoLatitudine=document.querySelector("#Campolatitudine");
		var campoLongitudine=document.querySelector("#Campolongitudine");
		var campoTipologia=document.querySelector("#tipologia")
	
		var titolo = campoTitolo.value;
		var descrizione= campoDescrizione.value;
		var tipologia = campoTipologia.value;
		var contratto= campoContratto.value;
		var prezzo= campoPrezzo.value;
		var metri= campoMetri.value;
		var latitudine= campoLatitudine.value;
		var longitudine= campoLongitudine.value;
		var annuncio = new AnnunciInAffittoId(id,titolo,descrizione,contratto,prezzo,metri,latitudine,longitudine,tipologia);
		$.ajax({
			type: "POST",
			url: "/addAffitta",
			contentType: "application/json",
			data: JSON.stringify(annuncio),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('Annuncio caricato Con sucesso');
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
		
	});
	
	
}