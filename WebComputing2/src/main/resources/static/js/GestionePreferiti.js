window.addEventListener("load",function(){
	addEvent();
});



function addEvent(){
	
	var btnLove= document.querySelector("#btnLove");
	btnLove.addEventListener("click",function(){
		$.ajax({
			type: "POST",
			url: "/addPreferitiAffitto",
			contentType: "application/json",
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 					alertify.success('Aggiunto');
			 
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
	});
}