window.addEventListener("load",function(){
	addEvent();
});



function addEvent(){
	
	var btnLove= document.querySelector("#btnLove");
	btnLove.addEventListener("click",function(){
		alert("ok");
		$.ajax({
			type: "POST",
			url: "/addPreferitiVendita",
			contentType: "application/json",
			success: function(risposta) {     //se mi restituisce 200
				alert("aggiunto");
			 
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
	});
}