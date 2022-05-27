window.addEventListener("load",function(){
	addEvent();
});


function addEvent(){
	var btnProposta= document.querySelector("#btnProposta");
	btnProposta.addEventListener("click",function(){
		var proposta= document.querySelector("#propostaDiAcquisto").value;
		var prezzoBase= document.querySelector("#prezzoBase").value;
		if(proposta >= prezzoBase){
	
		$.ajax({
			type: "POST",
			url: "/addProposta",
			contentType: "application/json",
			data: JSON.stringify(proposta),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('La tua proposta è stata caricata con successo');
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
 				alertify.error('La tua proposta Deve essere Maggiore o uguale al prezzo di partenza');
		}
	});
	
	
	
	
}