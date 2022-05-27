window.addEventListener("load",function(){
	addEvent();
});


function addEvent(){
	
	var btnSend=document.querySelector("#BtnsendMail");
	btnSend.addEventListener("click",function(){
		var Camposubject=document.querySelector("#username").value;
		var email=document.querySelector("#emailAcquirente").value;
		var toEmail=document.querySelector("#emailVenditore").value;
		var body=document.querySelector("#messaggio").value;
	
	
		var subject="Inviata da: "+Camposubject+ "   email :"+email;
			var email= new Email(toEmail,subject,body);
		console.log(email);
		
			$.ajax({
						type: "POST",
						url: "/inviaEmail",
						contentType: "application/json",
						data: JSON.stringify(email),
						success: function() {     //se mi restituisce 200
							alertify.set('notifier','position', 'top-center');
 							alertify.success('Email spedita con successo');
						},
						error: function(xhr){
							alert(xhr.responseJSON.message);
							console.log(xhr);
						}             
					});	
	
		
	});
	
}