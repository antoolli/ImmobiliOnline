package com.WebComputing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.WebComputing.Database;
import com.WebComputing.modal.Iscritti;
import com.WebComputing.modal.annunciInVendita;


@Controller
public class gestioneUtentiController {

	
	@GetMapping("/pageElencoIscritti")
	public String pageElencoIscritti(HttpServletRequest req) {
		if (req.getSession().getAttribute("username")!= null) {
			String username= (String) req.getSession().getAttribute("username");
			Iscritti i= new Iscritti();
			i=Database.getInstance().getIscrittiDao().findByUsernameiS(username);
			if(i.getPermessi().equals("Admin")) {
			List<Iscritti>users=  Database.getInstance().getIscrittiDao().findAll();
			req.setAttribute("users", users);
			return "elencoIscritti";
			}
		}
		return "notAutorizhed";
		
	}
		
		
		
	
	
}
