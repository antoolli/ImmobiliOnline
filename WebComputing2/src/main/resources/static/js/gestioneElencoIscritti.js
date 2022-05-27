


window.addEventListener("load",function(){
	addEvent();	
});





function addEvent(){
	
		var btnAdmin= document.querySelector("#btnAmministratore")
		btnAdmin.addEventListener("click",function(){
		var checkBox = document.querySelector('tbody input:checked');
			if (checkBox != null){
				var user = checkBox.getAttribute("id");
				console.log(user);
				$.ajax({
					type: "POST",
					url: "/nominaAdmin",
					contentType: "application/json",
					data: JSON.stringify(user),
					success: function(risposta) {     //se mi restituisce 200
						alertify.set('notifier','position', 'top-center');
 						alertify.success('hai nominato un nuovo admin');
					},
					error: function(xhr){
						alert(xhr.responseJSON.message);
						console.log(xhr);
				}             
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
		var campoUsername= document.querySelector("#CampoUsername");
		var campoEmail= document.querySelector("#CampoEmail");
		var campoPassword= document.querySelector("#CampoPassword");
		var campoNome= document.querySelector("#CampoNome");
		var campoCognome= document.querySelector("#CampoCognome");
		var campoEta= document.querySelector("#CampoEta");
		var campoSesso= document.querySelector("#CampoSesso");
		var campoPermessi= document.querySelector("#CampoPermessi");
		
		
		
		var username= campoUsername.value;
		var email= campoEmail.value;
		var password= campoPassword.value;
		var nome= campoNome.value;
		var cognome= campoCognome.value;
		var eta= campoEta.value;
		var sesso= campoSesso.value;
		var permessi= campoPermessi.value;
		
		campoUsername.value="";
		campoEmail.value="";
		campoPassword.value="";
		campoNome.value="";
		campoCognome.value="";
		campoEta.value="";
		campoSesso.value="";
		campoPermessi.value="";
		
		var iscritto = new Iscritti(username,email,password,nome,cognome,eta ,sesso,permessi);
		IscritticonUsername [username]=iscritto;
		
		
		$.ajax({
			type: "POST",
			url: "/addUser",
			contentType: "application/json",
			data: JSON.stringify(iscritto),
			success: function(risposta) {     //se mi restituisce 200
				alertify.set('notifier','position', 'top-center');
 				alertify.success('Utente caricato con Successo');
				
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
	
	
	
	var btnCancella= document.querySelector("#btnCancella");
	btnCancella.addEventListener("click",function(){
		var selectedCheckBoxes=document.querySelectorAll("input:checked");
		
		if (selectedCheckBoxes.length > 0){
			selectedCheckBoxes.forEach(function(checkBox,index){
				
				var username = checkBox.getAttribute("id");
				console.log(username);
						
			$.ajax({
				type: "POST",
				url: "/deleteUser",
				contentType: "application/json",
				data: JSON.stringify(username),
				success: function(risposta) {     //se mi restituisce 200
					alertify.set('notifier','position', 'top-center');
 					alertify.success('Cancellato con successo');
				},
				error: function(xhr){
					alert(xhr.responseJSON.message);
					console.log(xhr);
				}             
			});
			});
		}
		else{
				alertify.set('notifier','position', 'top-center');
 				alertify.error('Nessun Elemento Selezionato');
			}
			window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
	
	});
	
	
		var btnModifica=document.querySelector("#btnModifica");
	btnModifica.addEventListener("click",function(){
	
		var checkBox = document.querySelector('tbody input:checked');
		if (checkBox != null){
			var user = checkBox.getAttribute("id");
		
			var campoEmail= document.querySelector("#CampoEmail");
			var campoPassword= document.querySelector("#CampoPassword");
			var campoNome= document.querySelector("#CampoNome");
			var campoCognome= document.querySelector("#CampoCognome");
			var campoEta= document.querySelector("#CampoEta");
			var campoSesso= document.querySelector("#CampoSesso");
			var campoPermessi= document.querySelector("#CampoPermessi");
			var email= campoEmail.value;
			var password= campoPassword.value;
			var nome= campoNome.value;
			var cognome= campoCognome.value;
			var eta= campoEta.value;
			var sesso= campoSesso.value;
			var permessi= campoPermessi.value;
			var campoUsername=document.querySelector("#CampoUsername");
			var u=campoUsername.value;
			if(u == ""){
				var iscritto = new Iscritti(user,email,password,nome,cognome,eta ,sesso,permessi);
				console.log(iscritto);
				$.ajax({
					type: "POST",
					url: "/addUser",
					contentType: "application/json",
					data: JSON.stringify(iscritto),
					success: function() {     //se mi restituisce 200
						alertify.set('notifier','position', 'top-center');
 						alertify.success(' Utente caricato con successo');
						},
						error: function(xhr){
						alert(xhr.responseJSON.message);
						console.log(xhr);
						}             
				});
			}else{
				alertify.set('notifier','position', 'top-center');
 				alertify.error('Non puoi modificare il valore username poichè è univoco modifica tutti gli altri parametri');
			}
		}else{
				alertify.set('notifier','position', 'top-center');
 				alertify.error('Nessun Elemento Selezionato');
			}
			window.setTimeout( function() {
  			window.location.reload();
			}, 3000);
			
		
	});
	
}

