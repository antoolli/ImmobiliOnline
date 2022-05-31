package com.WebComputing.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.WebComputing.Database;
import com.WebComputing.modal.AnnuncioInAffitto;
import com.WebComputing.modal.Iscritti;




@Controller
public class GestioneAffittiController {

	
	@GetMapping ("/pageAffitta")
	public String pageAffitta (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
				if(i.getPermessi().equals("Admin")|| i.getPermessi().equals("V")) {
					return "affitta";
				}
		}
			return "notAutorizhed";
		
	}
	
	@GetMapping("/pageElencoAffitti")
	public String pageElencoAffitti(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
			if(i.getPermessi().equals("Admin")) {
				List<AnnuncioInAffitto> annunci_affitti = Database.getInstance().getAffittiDao().findAll();
				req.setAttribute("annunci_affitti", annunci_affitti);
				return "elencoAffitti";
			}
		}
		return "notAutorizhed";
		
	}
	
	@GetMapping ("/pageImmInAffitto")
	public String pageImmInAffitto (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			List<AnnuncioInAffitto> annunci_affitti = Database.getInstance().getAffittiDao().findAll();
			if(req.getAttribute("annunci_affitti")== null) {
			req.setAttribute("annunci_affitti", annunci_affitti);
			}
			return "immobiliInAffitto";
		}else {
			return "notAutorizhed";
		}
		
	}
	
	@PostMapping("/pageFiltraAffitti")
	public String pageFiltraAffitti(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String tipologia = req.getParameter("filtra");
			if(!tipologia.equals("tutti")) {
				List<AnnuncioInAffitto> annunci_affitti =Database.getInstance().getAffittiDao().filtraTipologia(tipologia);
				req.setAttribute("annunci_affitti", annunci_affitti);
			}else {
				List<AnnuncioInAffitto> annunci_affitti =Database.getInstance().getAffittiDao().findAll();
				req.setAttribute("annunci_affitti", annunci_affitti);
			}
			
			return this.pageImmInAffitto(req);
		}else {
			return "notAutorizhed";
		}
		
		
	}
		
		
	

	
	@GetMapping("/infoAffitti")
	public String infoAffitti(HttpServletRequest req) {
	
		if (req.getSession().getAttribute("username")!= null) {
		String idAffitto =  req.getParameter("visualizza");
		int id = Integer.parseInt(idAffitto);
	 
		AnnuncioInAffitto annuncio= Database.getInstance().getAffittiDao().findById(id);
		String log= (String) req.getSession().getAttribute("username");
		Iscritti logger= Database.getInstance().getIscrittiDao().findByUsernameiS(log);
		req.getSession().setAttribute("idAffitto", idAffitto);
		req.setAttribute("logger", logger);
		req.setAttribute("annuncio", annuncio);
		return "annuncioAffitto";
		}else return "notAutorizhed";
	}
	
	@GetMapping ("/pageTabelleAffitti")
	public String pageTabelleAffitti (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
				if(i.getPermessi().equals("Admin")|| i.getPermessi().equals("V")) {
					List<AnnuncioInAffitto>annunci= Database.getInstance().getAffittiDao().findByVenditore(username);
					req.setAttribute("annunci", annunci);
					return "tabellexAffitti";
				}
			}
			return "notAutorizhed";
		
		
	}
	
	//todo gestire permessi
	@PostMapping("/ModificaAnnuncioAffitto")
	public String pageModificaAnnuncioAffitto(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			 String s =  req.getParameter("modificaAnnuncio");
			 int id = Integer.parseInt(s);
			 AnnuncioInAffitto annuncio=Database.getInstance().getAffittiDao().findById(id);
		
			 req.setAttribute("annuncio", annuncio);
			 return "modificaAffitto";
		}	
		return "notAutorizhed";
	}
	
	
	
	@PostMapping("/pageOrdinaA")
	public String ordinaAffitti(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String ordina= req.getParameter("ordina");
			List<AnnuncioInAffitto>annunci_affitti = new ArrayList<AnnuncioInAffitto>();
			if (ordina.equals("prezzoC")) {
				annunci_affitti= Database.getInstance().getAffittiDao().ordinaPerPrezzoCrescente();
				req.setAttribute("annunci_affitti", annunci_affitti);
			}
			if(ordina.equals("prezzoD")) {
				annunci_affitti= Database.getInstance().getAffittiDao().ordinaPerPrezzoDecrescente();
				req.setAttribute("annunci_affitti", annunci_affitti);
			}
			if(ordina.equals("grandezzaC")) {
				annunci_affitti= Database.getInstance().getAffittiDao().ordinaPerGrandezzaCrescente();
				req.setAttribute("annunci_affitti", annunci_affitti);
			}
			if(ordina.equals("grandezzaD")) {
				annunci_affitti= Database.getInstance().getAffittiDao().ordinaPerGrandezzaDecrescente();
				req.setAttribute("annunci_affitti", annunci_affitti);
			}
			
			return this.pageImmInAffitto(req);
		}
		return "notAutorizhed";
	}
	
}
