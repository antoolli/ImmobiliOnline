window.addEventListener("load",function(){
	addEvent();
});



function addEvent(){
	
	var btnCancella =document.querySelector("#btnCancellaRecensione");
	btnCancella.addEventListener("click",function(){
		var selectedCheckBoxes=document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0){
			selectedCheckBoxes.forEach(function(checkBox,index){
					var id = checkBox.getAttribute("id");
				console.log(id);
					$.ajax({
						type: "POST",
						url: "/deleteRecensione",
						contentType: "application/json",
						data: JSON.stringify(id),
						success: function(risposta) {     //se mi restituisce 200
						alertify.set('notifier','position', 'top-center');
 						alertify.success('La cancellazione è avvenuta con successo');
					
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
		var campoId=document.querySelector("#CampoId").value;
		var campoVenditore=document.querySelector("#CampoVenditore").value;
		var campoRecensione=document.querySelector("#CampoRecensione").value;
		var campoValutazione=document.querySelector("#CampoValutazione").value;
		var recensione= new Recensione(campoId,campoVenditore,campoRecensione,campoValutazione);
		$.ajax({
			type: "POST",
			url: "/addRecensione",
			contentType: "application/json",
			data: JSON.stringify(recensione),
			success: function(risposta) {     //se mi restituisce 200
					alertify.set('notifier','position', 'top-center');
 					alertify.success('La recensione è stata caricata con sucesso ');
			
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
	
	var btnModifica=document.querySelector("#btnModifica");
	btnModifica.addEventListener("click",function(){
		
		var checkBox = document.querySelector('tbody input:checked');
	
		
			if (checkBox != null){
				var codiceId = checkBox.getAttribute("id");
				console.log(codiceId);
				var campoIdannuncio=document.querySelector("#CampoId").value;
				var campoVenditore=document.querySelector("#CampoVenditore").value;
				var campoRecensione=document.querySelector("#CampoRecensione").value;
				var campoValutazione=document.querySelector("#CampoValutazione").value;
				
				var recensione= new RecensioneId(campoIdannuncio,campoVenditore,campoRecensione,campoValutazione,codiceId);
				console.log(recensione);
				$.ajax({
					type: "POST",
					url: "/addRecensione",
					contentType: "application/json",
					data: JSON.stringify(recensione),
					success: function(risposta) {     //se mi restituisce 200
					alertify.set('notifier','position', 'top-center');
 					alertify.success('Recensione caricata con Successo');
			
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		}else{
				alertify.set('notifier','position', 'top-center');
 				alertify.error('Nessun elemento selezionato');
		}
			window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
		
	});
}