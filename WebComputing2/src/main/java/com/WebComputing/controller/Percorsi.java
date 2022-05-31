package com.WebComputing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import com.WebComputing.Database;
import com.WebComputing.modal.AnnuncioInAffitto;
import com.WebComputing.modal.Iscritti;

import com.WebComputing.modal.annunciInVendita;


@Controller
public class Percorsi {

	
	@GetMapping("/pageAdmin")
	public String pageAdmin(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
			if(i.getPermessi().equals("Admin")) {
				List<Iscritti>users=  Database.getInstance().getIscrittiDao().findAll();
				req.setAttribute("users", users);
				return "admin";
			}
		}
		
			return "notAutorizhed";
		
		
		
	}
	
	
	
	
	
	@GetMapping ("/pageAffitti")
	public String pageAffitti (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			List<Iscritti>users=  Database.getInstance().getIscrittiDao().findAll();
			req.setAttribute("users", users);
			
			return "affitti";
		}else {
			return "notAutorizhed";
		}
		
	}
	

	

	
	
	
	@GetMapping ("/pageIscriviti")
	public String pageIscriviti () {
		return "iscriviti";
	}
	

	@GetMapping("/pageChisiamo")
	public String pageChisiamo(HttpServletRequest req) {
		
			return "chisiamo";
	}
		
	
	
	@GetMapping("/pageContatti")
	public String pageContatti() {
		return "contatti";
	} 
	@GetMapping("/pagedoveSiamo")
	public String pagedoveSiamo() {
		return "dovesiamo";
	} 
	

	
	@PostMapping("/contattaidAffitti")
	public String contattaidAffitti(HttpServletRequest req) {
		String s =  req.getParameter("contattaci");
		int id = Integer.parseInt(s);
		AnnuncioInAffitto annuncio= Database.getInstance().getAffittiDao().findById(id);
		String username= annuncio.getVenditore();
		Iscritti venditore=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
		req.setAttribute("annuncio", annuncio);
		req.setAttribute("venditore", venditore);
		return "contattaVenditore";
	}
	
	
	
	@PostMapping("/viewsMap")
	public String viewsMap(HttpServletRequest req) {
		String s =  req.getParameter("visualizzaMappa");
	 	int id = Integer.parseInt(s);
	 	annunciInVendita annuncio= Database.getInstance().getVenditaDao().findById(id);
	 	req.setAttribute("annuncio", annuncio);
	 	return "viewMap";
	}
	
	@PostMapping("/viewsMapAffitto")
	public String viewsMapAffitto(HttpServletRequest req) {
		String s =  req.getParameter("visualizzaMappa");
	 	int id = Integer.parseInt(s);
	 	AnnuncioInAffitto annuncio= Database.getInstance().getAffittiDao().findById(id);
	 	req.setAttribute("annuncio", annuncio);
	 	return "viewMap";
	}
	
	

	@GetMapping("/pageProfiles")
	public String pageProfiles(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String us= (String) req.getSession().getAttribute("username");
			Iscritti logger= Database.getInstance().getIscrittiDao().findByUsernameiS(us);
			if(logger.getPermessi().equals("V")||logger.getPermessi().equals("Admin") ) {
				int oggV=Database.getInstance().getVenditaDao().oggettiInVendita(us);
				int oggA=Database.getInstance().getAffittiDao().oggettiInVendita(us);
				req.setAttribute("oggV", oggV);
				req.setAttribute("oggA", oggA);
				req.setAttribute("logger", logger);
				return "profilesVenditore";
			}
			if (logger.getPermessi().equals("A")){
				int numRec=Database.getInstance().getRecensioneDao().numeroRecensioni(us);
				req.setAttribute("numRec", numRec);
				req.setAttribute("logger", logger);
				return "profilesAcquirente";
			}
		}
		return "notAutorizhed";
	}
}
	
	

