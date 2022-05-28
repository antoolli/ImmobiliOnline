window.addEventListener("load",function(){
	addEvent();
});






function addEvent(){

	var btnModifica= document.querySelector("#btnModifica");
	btnModifica.addEventListener("click", function(){
		var selectedCheckBoxes=document.querySelector("input:checked");
		if (selectedCheckBoxes != null){
		var id = selectedCheckBoxes.getAttribute("id");
		var campoTitolo=document.querySelector("#CampoTitolo");
		var campoDescrizione= document.querySelector("#CampoDescrizione");
		
		var campoPrezzo= document.querySelector("#CampoPrezzo");
		var campoMetri= document.querySelector("#CampoMetri");
		var campoLatitudine=document.querySelector("#Campolatitudine");
		var campoLongitudine=document.querySelector("#Campolongitudine");
		var campoTipologia=document.querySelector("#tipologia")
		
		var titolo = campoTitolo.value;
		var descrizione= campoDescrizione.value;
		var tipologia = campoTipologia.value;
		var prezzo= campoPrezzo.value;
		var metri= campoMetri.value;
		var latitudine= campoLatitudine.value;
		var longitudine= campoLongitudine.value;
		var annuncio = new AnnunciInVenditaId(id,titolo,descrizione,tipologia,prezzo,metri,latitudine,longitudine);
			$.ajax({
			type: "POST",
			url: "/addVendita",
			contentType: "application/json",
			data: JSON.stringify(annuncio),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('Il tuo annuncio è stato caricato correttamente');
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		
		window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
		}else{alertify.set('notifier','position', 'top-center');
 			alertify.error('Nessun Elemento Selezionato');
			
		}
	});


	
		
	
	
	
	
	


var btnCancella= document.querySelector("#btnCancellaAnnuncio");
	btnCancella.addEventListener("click",function(){
		var selectedCheckBoxes=document.querySelectorAll("input:checked");
		
		if (selectedCheckBoxes.length > 0){
			selectedCheckBoxes.forEach(function(checkBox,index){
				
				var id = checkBox.getAttribute("id");
				
					
			$.ajax({
				type: "POST",
				url: "/deleteVendita",
				contentType: "application/json",
				data: JSON.stringify(id),
				success: function(risposta) {     //se mi restituisce 200
					alertify.set('notifier','position', 'top-center');
 					alertify.success('la Cancellazione è avvenuta con successo');
					
				},
				error: function(xhr){
					alert(xhr.responseJSON.message);
					console.log(xhr);
				}             
			});
			});
		}
		else{
			alertify.set('notifier','position', 'top-center');
 			alertify.error('Nessun Elemento Selezionato');
		}
		
			window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
	
	});
}
