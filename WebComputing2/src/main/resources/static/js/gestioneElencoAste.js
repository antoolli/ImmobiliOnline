window.addEventListener("load",function(){
	addEvent();
});

function addEvent(){
	
	var btnCancella= document.querySelector("#btnCancellaAsta");
	btnCancella.addEventListener("click",function(){ 
		var selectedCheckBoxes=document.querySelectorAll("input:checked");
		
		if (selectedCheckBoxes.length > 0){
			selectedCheckBoxes.forEach(function(checkBox,index){
				
				var id = checkBox.getAttribute("id");
			console.log(id);
				
					
			$.ajax({
				type: "POST",
				url: "/deleteAsta",
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
	
	var btnModifica= document.querySelector("#btnModifica");
	btnModifica.addEventListener("click", function(){
		var selectedCheckBoxes=document.querySelector("input:checked");
		if(selectedCheckBoxes != null){

		var id = selectedCheckBoxes.getAttribute("id");
		var campoTitolo=document.querySelector("#CampoTitolo");
		var CampoPrezzoBase= document.querySelector("#CampoPrezzoBase");
		var CampoScadenza= document.querySelector("#CampoScadenza");
		
		var titolo = campoTitolo.value;
		var prezzoBase=CampoPrezzoBase.value;
		var scadenza=CampoScadenza.value;
		asta= new AstaId(id,titolo,scadenza, prezzoBase);
		console.log(asta);
		
			$.ajax({
			type: "POST",
			url: "/addAsta",
			contentType: "application/json",
			data: JSON.stringify(asta),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('Asta modificata  correttamente');
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		
		window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
		}else{
		alertify.set('notifier','position', 'top-center');
 				alertify.error('nessun elemento selezionato');
	}	
	
	});
	
	
	
}