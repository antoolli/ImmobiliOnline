package com.WebComputing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.WebComputing.Database;
import com.WebComputing.modal.Asta;
import com.WebComputing.modal.Iscritti;

@RestController
public class GestioneAstaRest {

	@PostMapping("/addAsta")
	public String addAsta(@RequestBody Asta asta, HttpServletRequest req) {
		String venditore= (String) req.getSession().getAttribute("username");
		asta.setVenditore(venditore);
		if (Database.getInstance().getAsteDao().saveUpdate(asta)) {
			return "ok";
		}
		
		return null;
	}
	
	@PostMapping("/addProposta")
	public String addProposta(@RequestBody int proposta, HttpServletRequest req) {
		String acquirente= (String) req.getSession().getAttribute("username");
		Iscritti i = Database.getInstance().getIscrittiDao().findByUsernameiS(acquirente);
		String email= i.getEmail();
		int id= Integer.parseInt( (String) req.getSession().getAttribute("idAsta"));
		
		if (Database.getInstance().getAsteDao().addOfferta(acquirente, id, proposta,email))
			return "ok";
		
		return "error";
	}
	
	@PostMapping("/deleteAsta")
	public String deleteAsta(@RequestBody int id) {
		if(Database.getInstance().getAsteDao().delete(id)) {
			return"ok";
		}
		return "error";
	}
	
	
}
