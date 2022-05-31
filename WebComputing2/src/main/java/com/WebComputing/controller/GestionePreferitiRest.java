package com.WebComputing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.WebComputing.Database;
import com.WebComputing.modal.Annuncio;

@RestController
public class GestionePreferitiRest {
	
	@PostMapping("/addPreferitiVendita")
	public String addPreferitiVendita(HttpServletRequest req) {
		String idAnnuncio=(String) req.getSession().getAttribute("s");
		int id = Integer.parseInt(idAnnuncio);
		System.out.println(id);
		Annuncio annuncio= Database.getInstance().getVenditaDao().findById(id);
		String username= (String) req.getSession().getAttribute("username");
		Database.getInstance().getPreferitiDao().saveUpdate(username, annuncio);
		
		return "Ok";
	}
	
	@PostMapping("/addPreferitiAffitto")
	public String addPreferiti(HttpServletRequest req) {
		String idAnnuncio=(String) req.getSession().getAttribute("idAffitto");
		int id = Integer.parseInt(idAnnuncio);
		Annuncio annuncio= Database.getInstance().getAffittiDao().findById(id);
		String username= (String) req.getSession().getAttribute("username");
		Database.getInstance().getPreferitiDao().saveUpdate(username, annuncio);
		
		
		return "Ok";
	}
	@PostMapping("/deletePreferiti")
	public String deletePreferiti(@RequestBody int id,HttpServletRequest req) {
		String username= (String) req.getSession().getAttribute("username");
		System.out.println(username);
		System.out.print(id);
		Database.getInstance().getPreferitiDao().delete(username, id);
		return "ok";
	}
	
}
