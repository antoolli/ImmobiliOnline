package com.WebComputing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.WebComputing.Database;
import com.WebComputing.modal.Annuncio;
import com.WebComputing.modal.AnnuncioInAffitto;

@RestController
public class GestioneAffittiRest {

	
	@PostMapping("/addAffitta")
	public String addAffitta( @RequestBody AnnuncioInAffitto annuncio, HttpServletRequest req) throws Exception{
		String username= (String) req.getSession().getAttribute("username");
		annuncio.setVenditore(username);
		if(Database.getInstance().getAffittiDao().saveUpdate(annuncio)) return "ok";
		return "errore";
	}
	@PostMapping("/deleteAffitto")
	public String deleteAffitto(@RequestBody int id)throws Exception  {
		if (Database.getInstance().getAffittiDao().delete(id)) {
			Database.getInstance().getPreferitiDao().deleteId(id);
			return "ok";
		}
		
		return "errore";
	}
	
	@PostMapping("/applicaScontoAffitto")
	public String applicaScontoAffitto(@RequestBody int sconto,HttpServletRequest req) {
		String idAnnuncio =(String) req.getSession().getAttribute("idAffitto");
		int id = Integer.parseInt(idAnnuncio);
		Database.getInstance().getAffittiDao().applicaSconto(id, sconto);
		return "OK";
	}

}
