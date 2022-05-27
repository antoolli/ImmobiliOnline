window.addEventListener("load",function(){
	addEvent();
});



function addEvent(){
	
	var btnSvuota= document.querySelector("#btnSvuotatutto");
	btnSvuota.addEventListener("click",function(){
		var campoTitolo=document.querySelector("#titolo");
		var campoDescrizione= document.querySelector("#descrizione");
		var campoContratto=document.querySelector("#contratto");
		var campoPrezzo= document.querySelector("#prezzo");
		var campoMetri= document.querySelector("#metri");
		var campoLatitudine=document.querySelector("#latitudine");
		var campoLongitudine=document.querySelector("#longitudine");
		var campoTipologia= document.querySelector("#tipologia");
		
		campoTitolo.value="";
		campoDescrizione.value="";
		campoContratto.value="";
		campoPrezzo.value="";
		campoMetri.value="";
		campoLatitudine.value="";
		campoLongitudine.value="";
		campoTipologia.value="";
		
		
	});
	
	
	
	var btnInserisci=document.querySelector("#btnInserzione");
	btnInserisci.addEventListener("click",function(){
		var campoTitolo=document.querySelector("#titolo");
		var campoDescrizione= document.querySelector("#descrizione");
		var campoContratto= document.querySelector("#contratto");
		var campoPrezzo= document.querySelector("#prezzo");
		var campoMetri= document.querySelector("#metri");
		var campoLatitudine=document.querySelector("#latitudine");
		var campoLongitudine=document.querySelector("#longitudine");
		var campoTipologia= document.querySelector("#tipologia");
			
		var titolo = campoTitolo.value;
		var descrizione= campoDescrizione.value;
		var contratto=campoContratto.value;
		var prezzo= campoPrezzo.value;
		var metri= campoMetri.value;
		var latitudine= campoLatitudine.value;
		var longitudine= campoLongitudine.value;
		var tipologia = campoTipologia.value;
		console.log(tipologia);
		var annuncio= new AnnunciInAffitto(titolo,descrizione,contratto,prezzo,metri,latitudine,longitudine,tipologia);
		console.log(annuncio);
		
		$.ajax({
			type: "POST",
			url: "/addAffitta",
			contentType: "application/json",
			data: JSON.stringify(annuncio),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('il tuo annunncio e stato caricato correttamente visualizzalo nell elenco degli affitti');
			 
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		
		
	});
	
	
}