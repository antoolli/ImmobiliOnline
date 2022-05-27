package com.WebComputing.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.WebComputing.Database;
import com.WebComputing.modal.Recensione;

@RestController
public class GestioneRecensioneRest {

	
	//todo controllare perche non modifica recensione
	@PostMapping("/addRecensione")
	public String addRecensione(@RequestBody Recensione recensione, HttpServletRequest req) {
		String  reviewer = (String) req.getSession().getAttribute("username"); 
		recensione.setReviewer(reviewer);
		Database.getInstance().getRecensioneDao().save(recensione);
		
	
		
		return "ok";
	}
	
	@PostMapping("/deleteRecensione")
	public String deleteVendita(@RequestBody int id)throws Exception {
		if (Database.getInstance().getRecensioneDao().delete(id)) {
			return "ok";
		}
		
		return "errore";
	}
	
}
