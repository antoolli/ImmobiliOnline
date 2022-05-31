window.addEventListener("load",function(){
	addEvent();
});

function addEvent(){
	
	var btnCancella= document.querySelector("#btnCancellaPreferiti");
	btnCancella.addEventListener("click",function(){
		var selectedCheckBoxes=document.querySelectorAll("input:checked");
	
			if (selectedCheckBoxes.length > 0){
				selectedCheckBoxes.forEach(function(checkBox,index){
					var id = checkBox.getAttribute("id");
					$.ajax({
						type: "POST",
						url: "/deletePreferiti",
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
	
}