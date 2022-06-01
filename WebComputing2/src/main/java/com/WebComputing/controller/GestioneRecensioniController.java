package com.WebComputing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.WebComputing.Database;
import com.WebComputing.modal.AnnuncioInAffitto;
import com.WebComputing.modal.Iscritti;
import com.WebComputing.modal.Recensione;
import com.WebComputing.modal.annunciInVendita;

@Controller
public class GestioneRecensioniController {

	@GetMapping("/pageElencoRecensioni")
	public String pageElencoRecensioni(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String us= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(us);
			if(i.getPermessi().equals("Admin")) {
				List<Recensione>recensioni=  Database.getInstance().getRecensioneDao().findAll();
				req.setAttribute("recensioni", recensioni);
			
			return "elencoRecensioni";
			}
		}
			
	return "notAutorizhed";
		
	}
	
	@GetMapping("/VisualizzaRecensioniAcquirente")
	public String pageVisualizzaRecensioni(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String us= (String) req.getSession().getAttribute("username");
				List<Recensione>recensioni=  Database.getInstance().getRecensioneDao().findByReviewer(us);
				req.setAttribute("recensioni", recensioni);
			
				return "TabellaRecensioni";
			}
		
			
		return "notAutorizhed";
		
	}
	
	
	
	
	@PostMapping("/Reviews")
	public String Reviews(HttpServletRequest req) {
		
		if (req.getSession().getAttribute("username")!= null) {
			String us= (String) req.getSession().getAttribute("username");
			Iscritti logger= new Iscritti();
			logger=Database.getInstance().getIscrittiDao().findByUsernameiS(us);
			
				if(logger.getPermessi().equals("Admin") || logger.getPermessi().equals("A")) {
						String s =  req.getParameter("visualizzaRecensione");
						int id = Integer.parseInt(s);
						annunciInVendita annuncio= Database.getInstance().getVenditaDao().findById(id);
						List<Recensione>recensioni= Database.getInstance().getRecensioneDao().findbyIdAnnuncio(id);
						req.setAttribute("recensioni", recensioni);
						req.setAttribute("annuncio", annuncio);
						return "reviews";
				}else { 
					String s =  req.getParameter("visualizzaRecensione");
					int id = Integer.parseInt(s);
					annunciInVendita annuncio= Database.getInstance().getVenditaDao().findById(id);
					List<Recensione>recensioni= Database.getInstance().getRecensioneDao().findbyIdAnnuncio(id);
					req.setAttribute("recensioni", recensioni);
					req.setAttribute("annuncio", annuncio);
					
					return "soloTabRew";}
		}
		return "notAutorizhed";
	}
	
	@PostMapping("/ReviewsAffitto")
	public String ReviewsAffitto(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String us= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(us);
				if(i.getPermessi().equals("Admin") || i.getPermessi().equals("A")) {
					String s =  req.getParameter("visualizzaRecensione");
					int id = Integer.parseInt(s);
					AnnuncioInAffitto annuncio= Database.getInstance().getAffittiDao().findById(id);
					List<Recensione>recensioni= Database.getInstance().getRecensioneDao().findbyIdAnnuncio(id);
					req.setAttribute("recensioni", recensioni);
					req.setAttribute("annuncio", annuncio);
					return "reviews";
				}else { 
					
					String s =  req.getParameter("visualizzaRecensione");
					int id = Integer.parseInt(s);
					AnnuncioInAffitto annuncio= Database.getInstance().getAffittiDao().findById(id);
					List<Recensione>recensioni= Database.getInstance().getRecensioneDao().findbyIdAnnuncio(id);
					req.setAttribute("recensioni", recensioni);
					req.setAttribute("annuncio", annuncio);
					return "soloTabRew";
					}
				}
		
		
		return "notAutorizhed";
	}
	
}
