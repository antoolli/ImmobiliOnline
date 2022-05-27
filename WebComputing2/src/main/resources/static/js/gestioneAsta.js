

window.addEventListener("load",function(){
	addEvent();
});

function addEvent(){
	
var btnCrea= document.querySelector("#btnInserisci");
	btnCrea.addEventListener("click", function(){
		var selectedCheckBoxes=document.querySelector("input:checked");
		if (selectedCheckBoxes != null){
			var title=document.querySelector("input:checked");
			var titolo=title.getAttribute("titolo");
			var idAnnuncio = selectedCheckBoxes.getAttribute("id");
			var prezzoBase= document.querySelector("#CampoPrezzoBase").value;
			var scadenza= document.querySelector("#CampoScadenza").value;
			//Controllo data che non sia inferiore al presente
			var countDate= new Date(scadenza).getTime();
			var date= new Date().getTime();
			var gap = countDate -  date  ;
			if (gap > 0){
				var asta= new Asta(idAnnuncio,titolo,scadenza,prezzoBase);
				$.ajax({
					type: "POST",
					url: "/addAsta",
					contentType: "application/json",
					data: JSON.stringify(asta),
					success: function(risposta) {     //se mi restituisce 200
						alertify.set('notifier','position', 'top-center');
		 				alertify.success('Asta creata con successo');
					},
					error: function(xhr){
						alert(xhr.responseJSON.message);
						console.log(xhr);
					}             
				});
			}else{
				alertify.set('notifier','position', 'top-center');
 				alertify.error('Data non valida inserisci data futura di almeno un giorno');
				
			}
		}else {
			alertify.set('notifier','position', 'top-center');
 			alertify.error('Nessun Elemento Selezionato'); 				
		}
		
	});	

}	