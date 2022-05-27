package com.WebComputing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.WebComputing.Database;
import com.WebComputing.modal.Iscritti;

@RestController
public class GestioneUtentiRest {
	
	@PostMapping("/addUser")
	public String addUser(@RequestBody Iscritti iscritto) throws Exception { //i miei dati sono nel corpo con requestbody li traduce da json ad oggetto
		if(Database.getInstance().getIscrittiDao().saveUpdate(iscritto)) {
			return "success";
		}
		throw new Exception("Errore nell'inserimento dei dati");
	}
	
	@PostMapping("/deleteUser")
	public String deleteUser(@RequestBody String username)throws Exception {
		username = username.substring(1, username.length()-1);
		Database.getInstance().getIscrittiDao().delete(username); 
		Database.getInstance().getAffittiDao().deleteByVenditore(username);
		Database.getInstance().getVenditaDao().deleteByVenditore(username);
		
		return "ok";
	}
	
	// to do delete profilo
	@PostMapping("/deleteProfiloVenditore")
	public String deleteProfilo(HttpServletRequest req)throws Exception {
		String username= (String) req.getSession().getAttribute("username");
		Database.getInstance().getIscrittiDao().delete(username); 
		Database.getInstance().getAffittiDao().deleteByVenditore(username);
		Database.getInstance().getVenditaDao().deleteByVenditore(username);
		
		
		return "OK";
	}
	
	@PostMapping("/deleteProfiloAcquirente")
	public String deleteProfiloAcquirente(HttpServletRequest req)throws Exception {
		String username= (String) req.getSession().getAttribute("username");
		Database.getInstance().getIscrittiDao().delete(username); 
		Database.getInstance().getRecensioneDao().deleteReviewer(username);
		HttpSession session = req.getSession();
		session.invalidate();
	
		
		return "OK";
	}
	
	
	
	@PostMapping("/nominaAdmin")
	public String nominaAdmin(@RequestBody String username){
		username = username.substring(1, username.length()-1);
		if(Database.getInstance().getIscrittiDao().nominaAdmin(username)) {
			return "ok";
		}
		return null;
	}
	
}
