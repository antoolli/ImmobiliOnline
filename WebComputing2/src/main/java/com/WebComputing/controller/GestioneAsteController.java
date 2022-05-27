package com.WebComputing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.WebComputing.Database;
import com.WebComputing.modal.Asta;
import com.WebComputing.modal.Iscritti;
import com.WebComputing.modal.annunciInVendita;

@Controller
public class GestioneAsteController {

	@GetMapping ("/pageAste")
	public String pageAste (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			List<Asta>aste= Database.getInstance().getAsteDao().findAll();
			req.setAttribute("aste", aste);
			return "AsteOnline";
		}
		return "notAutorizhed";
	}
	@GetMapping ("/pageCreaAste")
	public String pageCreaAste (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String venditore= (String) req.getSession().getAttribute("username");
			List<annunciInVendita>annunci=Database.getInstance().getVenditaDao().findByVenditore(venditore);
			req.setAttribute("annunci", annunci);
			return "creaAsta";
		}
		return "notAutorizhed";
	}
	
	@GetMapping("/infoAsta")
	public String infoAsta(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String idAnn =  req.getParameter("idAnnuncio");
			String idAst = req.getParameter("idAsta");
			String us= (String) req.getSession().getAttribute("username");
			int idAnnuncio = Integer.parseInt(idAnn);
			int idAsta = Integer.parseInt(idAst);
			
			annunciInVendita annuncio=Database.getInstance().getVenditaDao().findById(idAnnuncio);
			Iscritti user= Database.getInstance().getIscrittiDao().findByUsernameiS(us);
			Asta asta= Database.getInstance().getAsteDao().findById(idAsta);
			req.getSession().setAttribute("idAsta", idAst);
			req.setAttribute("annuncio", annuncio);
			req.setAttribute("asta", asta);
			req.setAttribute("user", user);
		}
			return "infoAsta";
		
	}
	@GetMapping("/pageElencoAste")
	public String pageElencoAste(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
			if(i.getPermessi().equals("Admin")) {
				List<Asta>aste= Database.getInstance().getAsteDao().findAll();
				req.setAttribute("aste", aste);
				return "elencoAste";
			}
		}
		return "notAutorizhed";
	}
	
	@PostMapping("/ModificaAsta")
	public String pageModificaAsta(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null){
			 String s =  req.getParameter("modificaAsta");
			 int id = Integer.parseInt(s);
			 Asta ann= Database.getInstance().getAsteDao().findById(id);
			 req.setAttribute("ann", ann);
			 return "modificaAsta";
		}
		return "notAutorizhed";
	}

	@GetMapping("/AsteAcquirente")
	public String pageAsteAcquirente(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String acquirente=(String) req.getSession().getAttribute("username");
			List<Asta>aste= Database.getInstance().getAsteDao().findByAcquirente(acquirente);
			req.setAttribute("aste", aste);			
			return "TabAsteAcquirente";
		}
		return "notAutorizhed";
	}
	

}
