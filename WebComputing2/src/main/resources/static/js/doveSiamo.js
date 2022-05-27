

window.addEventListener("load",function(){
	 
        var latLng = new google.maps.LatLng(39.3529756, 16.2299496);
        var opzioni = {
          center: latLng,
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("canvas_mappa"), opzioni);
        var marker = new google.maps.Marker({position: latLng, map: map, title: "Cosenza" });
	
	
});


