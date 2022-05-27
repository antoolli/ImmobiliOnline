package com.WebComputing.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.WebComputing.Database;
import com.WebComputing.modal.Iscritti;
import com.WebComputing.modal.annunciInVendita;

@Controller
public class GestioneVenditeController {
	@GetMapping("/pageElencoAnnunci")
	public String pageElencoAnnunci(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
			if(i.getPermessi().equals("Admin")) {
				List<annunciInVendita>annunci_vendita=  Database.getInstance().getVenditaDao().findAll();
				req.setAttribute("annunci_vendita", annunci_vendita);
				return "elencoAnnunci";
			}
		}
		return "notAutorizhed";

	}

	@GetMapping ("/pageVendi")
	public String pageVendi (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
				if(i.getPermessi().equals("Admin")|| i.getPermessi().equals("V")) {
					return "vendi";
				}
			}
			return "notAutorizhed";


	}

	@GetMapping ("/pageImmInVendita")
	public String pageImmInVendita (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			List<annunciInVendita>annunci_vendita=  Database.getInstance().getVenditaDao().findAll();
			if (req.getAttribute("annunci_vendita")== null) {
				req.setAttribute("annunci_vendita", annunci_vendita);
			}

			return "imm";
		}else {
			return "notAutorizhed";
		}

	}
	@PostMapping ("/pageFiltrato")
	public String pageImmInFiltrati (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String tipologia = req.getParameter("filtra");

			if(!tipologia.equals("tutti")) {
				List<annunciInVendita>annunci_vendita=  Database.getInstance().getVenditaDao().filtraPerTipologia(tipologia);
				req.setAttribute("annunci_vendita", annunci_vendita);
			}else {
				List<annunciInVendita>annunci_vendita=  Database.getInstance().getVenditaDao().findAll();
				req.setAttribute("annunci_vendita", annunci_vendita);
			}

			return this.pageImmInVendita(req);

		}else {
			return "notAutorizhed";
		}

	}

	






	@GetMapping("/infoVendita")
	public String infoVendita(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String s =  req.getParameter("visualizza");
			int id = Integer.parseInt(s);
			annunciInVendita annuncio= Database.getInstance().getVenditaDao().findById(id);
			String log= (String) req.getSession().getAttribute("username");
			Iscritti logger= Database.getInstance().getIscrittiDao().findByUsernameiS(log);

			req.getSession().setAttribute("s", s);
			req.setAttribute("logger", logger);
			req.setAttribute("annuncio", annuncio);
			return "annunciVendita";
		}else {
			return "notAutorizhed";
		}


}
	@GetMapping ("/pageTabelleVendite")
	public String pageTabelleVendite (HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
				if(i.getPermessi().equals("Admin")|| i.getPermessi().equals("V")) {
					List<annunciInVendita>annunci= Database.getInstance().getVenditaDao().findByVenditore(username);
					req.setAttribute("annunci", annunci);
					return "tabellexVendite";
				}
			}
			return "notAutorizhed";


	}

	//todo gestire i permessi
	@PostMapping("/ModificaAnnuncioVendita")
	public String pageModificaAnnuncioVendita(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			 String s =  req.getParameter("modificaAnnuncio");
			 int id = Integer.parseInt(s);
			 annunciInVendita ann=Database.getInstance().getVenditaDao().findById(id);
			 req.setAttribute("ann", ann);
			 return "modificaVendita";
		}
			return "notAutorizhed";
	}

	@PostMapping ("/pageOrdinaV")
	public String pageOrdinvaVendite(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			List<annunciInVendita>annunci_vendita= new ArrayList<annunciInVendita>();
			String ordina= req.getParameter("ordina");
			if (ordina.equals("prezzoC")) {
				annunci_vendita=Database.getInstance().getVenditaDao().ordinaPerPrezzoCrescente();
				req.setAttribute("annunci_vendita", annunci_vendita);
			}
			if(ordina.equals("prezzoD")) {
				annunci_vendita=Database.getInstance().getVenditaDao().ordinaPerPrezzoDecrescente();
				req.setAttribute("annunci_vendita", annunci_vendita);
			}
			if(ordina.equals("grandezzaC")) {
				annunci_vendita=Database.getInstance().getVenditaDao().ordinaPerGrandezzaCrescente();
				req.setAttribute("annunci_vendita", annunci_vendita);
			}
			if(ordina.equals("grandezzaD")) {
				annunci_vendita=Database.getInstance().getVenditaDao().ordinaPerGrandezzaDecrescente();
				req.setAttribute("annunci_vendita", annunci_vendita);
			}
			
		
			return this.pageImmInVendita(req);
		}
		return "notAutorizhed";
	}

	@PostMapping("/contattaid")
	public String contattaIdVendita(HttpServletRequest req) {
		if(req.getSession().getAttribute("username")!=null) {
			String l=(String) req.getSession().getAttribute("username");
			Iscritti logger= Database.getInstance().getIscrittiDao().findByUsernameiS(l);
			if(logger.getPermessi().equals("A") || logger.getPermessi().equals("Admin")) {
				String s =  req.getParameter("contattaci");
				int id = Integer.parseInt(s);
				annunciInVendita annuncio= Database.getInstance().getVenditaDao().findById(id);
				String username= annuncio.getVenditore();
				Iscritti venditore=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
				req.setAttribute("annuncio", annuncio);
				req.setAttribute("venditore", venditore);
			 return "contattaVenditore";
			}
		}
	return "notAutorizhed";
	}


}
