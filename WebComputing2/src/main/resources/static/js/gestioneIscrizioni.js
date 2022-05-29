window.addEventListener("load",function(){
	addEvent();
});


function addEvent(){
	var btnAggiungi= document.querySelector("#btnIscriviti");
	btnAggiungi.addEventListener("click",function(){
		var campoUsername= document.querySelector("#username");
		var campoEmail= document.querySelector("#email");
		var campoPassword= document.querySelector("#pass");
		var campoNome= document.querySelector("#nome");
		var campoCognome= document.querySelector("#cognome");
		var campoEta= document.querySelector("#eta");
		var campoSesso= document.querySelector('input[name="Sex"]:checked');
		var campoPermessi= document.querySelector('input[name="Permessi"]:checked');
		
			
		
		var username= campoUsername.value;
		var email=campoEmail.value;
		var password=campoPassword.value;
		var nome= campoNome.value;
		var cognome = campoCognome.value;
		var eta=  campoEta.value;
		var sesso= campoSesso.value;
		var permessi=campoPermessi.value;
		var iscritto = new Iscritti(username,email,password,nome,cognome,eta,sesso,permessi);
		
			$.ajax({
			type: "POST",
			url: "/addUser",
			contentType: "application/json",
			data: JSON.stringify(iscritto),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('La tua Iscrizione è andata a buon fine Clicca Su Login o ritorna alla Home');
				campoUsername.value="";
				campoEmail.value="";
				campoPassword.value="";
				campoNome.value="";
				campoCognome.value="";
				campoEta.value="";
			},
			error: function(xhr){
				alert(xhr.responseJSON.message);
				console.log(xhr);
			}             
		});
		
		
	});
	
	var btnSvuotaTutto= document.querySelector("#btnSvuotatutto");
	btnSvuotaTutto.addEventListener("click",function(){
		var campoUsername= document.querySelector("#username");
		var campoEmail= document.querySelector("#email");
		var campoPassword= document.querySelector("#pass");
		var campoNome= document.querySelector("#nome");
		var campoCognome= document.querySelector("#cognome");
		var campoEta= document.querySelector("#eta");
		campoUsername.value="";
		campoEmail.value="";
		campoPassword.value="";
		campoNome.value="";
		campoCognome.value="";
		campoEta.value="";
		
		
	});

}
