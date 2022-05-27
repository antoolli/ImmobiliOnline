window.addEventListener("load",function(){
	addEvent();
	
	
	
	
});


function addEvent(){
	
	
	
	var btnSvuota= document.querySelector("#btnSvuotatutto");
	btnSvuota.addEventListener("click",function(){
		var campoTitolo=document.querySelector("#titolo");
		var campoDescrizione= document.querySelector("#descrizione");
		var campoPrezzo= document.querySelector("#prezzo");
		var campoMetri= document.querySelector("#metri");
		var campoLatitudine=document.querySelector("#latitudine");
		var campoLongitudine=document.querySelector("#longitudine");
		var campoTipologia=document.querySelector("#tipologia")
		campoTitolo.value="";
		campoDescrizione.value="";
		campoPrezzo.value="";
		campoMetri.value="";
		campoLatitudine.value="";
		campoLongitudine.value="";
		campoTipologia.value="";
		
		
	});
	
	
	var btnAggiungi= document.querySelector("#btnInserzione");
	btnAggiungi.addEventListener("click",function(){
		
		var campoTitolo=document.querySelector("#titolo");
		var campoDescrizione= document.querySelector("#descrizione");
		var campoFile= document.querySelector("#file");
		var campoPrezzo= document.querySelector("#prezzo");
		var campoMetri= document.querySelector("#metri");
		var campoLatitudine=document.querySelector("#latitudine");
		var campoLongitudine=document.querySelector("#longitudine");
		var campoTipologia=document.querySelector("#tipologia")
		
		console.log(campoFile);
		
		var titolo = campoTitolo.value;
		var descrizione= campoDescrizione.value;
		var tipologia = campoTipologia.value;
		var prezzo= campoPrezzo.value;
		var metri= campoMetri.value;
		var latitudine= campoLatitudine.value;
		var longitudine= campoLongitudine.value;
		
		var annuncio = new AnnunciInVendita(titolo,descrizione,tipologia,prezzo,metri,latitudine,longitudine);
		console.log(annuncio);
		
		$.ajax({
			type: "POST",
			url: "/addVendita",
			contentType: "application/json",
			data: JSON.stringify(annuncio),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('il tuo annunncio e stato caricato correttamente visualizzalo nell elenco delle vendite');
			
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		
		
	});
	
	
	
	
	
}