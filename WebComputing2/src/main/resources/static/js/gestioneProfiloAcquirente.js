window.addEventListener("load",function(){
	addEvent();
});
function addEvent(){
	
	
	
	var btnCancella=document.querySelector("#cancellaUtente");
	btnCancella.addEventListener("click",function(){
		alertify.confirm('Cancella Profilo', 'Premendo su Ok il tuo profilo sara immediatamente cancellato', 
		function(){ 
					$.ajax({
				type: "POST",
				url: "/deleteProfiloAcquirente",
				contentType: "application/json",
				success: function(risposta) {     //se mi restituisce 200
					alertify.set('notifier','position', 'top-center');
 					alertify.success('Cancellato con successo');
 					 window.setTimeout( function() {
  					window.location.reload();
					}, 3000);
				},
				error: function(xhr){
					alert(xhr.responseJSON.message);
					console.log(xhr);
				}             
			});
			
			alertify.success('Ok') }
                , function(){ alertify.error('Cancel')});
                
               
		
	});
	
	
	
	
	
	
}