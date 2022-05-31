package com.WebComputing.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.WebComputing.Database;

import com.WebComputing.modal.annunciInVendita;


@RestController
public class gestioneVenditeRest {

	
	@PostMapping("/addVendita")
	public String addVendita(@RequestBody annunciInVendita annunci ,HttpServletRequest req) throws Exception{
		String username= (String) req.getSession().getAttribute("username");
		annunci.setVenditore(username);
		if (Database.getInstance().getVenditaDao().saveUpdate(annunci));
		return null;
	}
	
	@PostMapping("/deleteVendita")
	public String deleteVendita(@RequestBody int id)throws Exception {
		if (Database.getInstance().getVenditaDao().delete(id)) {
			Database.getInstance().getPreferitiDao().deleteId(id);
			return "ok";
		}
		
		return null;
	}

	@PostMapping("/applicaSconto")
	public String applicaSconto(@RequestBody int sconto,HttpServletRequest req) {
		String idAnnuncio=   (String) req.getSession().getAttribute("s");
		int id = Integer.parseInt(idAnnuncio);
		Database.getInstance().getVenditaDao().applicaSconto(id, sconto);
			 return null;
	}
	
	
	

}
