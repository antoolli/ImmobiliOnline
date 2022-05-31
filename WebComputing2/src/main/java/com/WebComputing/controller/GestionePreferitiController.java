package com.WebComputing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.WebComputing.Database;
import com.WebComputing.modal.Iscritti;
import com.WebComputing.modal.Preferiti;

@Controller
public class GestionePreferitiController {
	@GetMapping ("/pagePreferiti")
	public String pagePreferiti(HttpServletRequest req) {
		String username= (String) req.getSession().getAttribute("username");
		if (username != null) {
			Iscritti us= Database.getInstance().getIscrittiDao().findByUsernameiS(username);
			if (us.getPermessi().equals("A") || us.getPermessi().equals("Admin")) {
				List<Preferiti> preferiti=Database.getInstance().getPreferitiDao().findByIdUsername(username);
				req.setAttribute("preferiti", preferiti);
				return "preferiti";
			}
		}
		return  "notAutorizhed";
	}
}
