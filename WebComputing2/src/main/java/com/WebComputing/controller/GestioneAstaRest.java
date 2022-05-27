package com.WebComputing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.WebComputing.Database;
import com.WebComputing.modal.Asta;

@RestController
public class GestioneAstaRest {

	@PostMapping("/addAsta")
	public String addAsta(@RequestBody Asta asta, HttpServletRequest req) {
		
		if (Database.getInstance().getAsteDao().saveUpdate(asta)) {
			return "ok";
		}
		
		return null;
	}
	
	@PostMapping("/addProposta")
	public String addProposta(@RequestBody int proposta, HttpServletRequest req) {
		String acquirente= (String) req.getSession().getAttribute("username");
		int id= Integer.parseInt( (String) req.getSession().getAttribute("idAsta"));
		
		if (Database.getInstance().getAsteDao().addOfferta(acquirente, id, proposta))
			return "ok";
		
		return null;
	}
	
	@PostMapping("/deleteAsta")
	public String deleteAsta(@RequestBody int id) {
		if(Database.getInstance().getAsteDao().delete(id)) {
			return"ok";
		}
		return null;
	}
	
	
}
