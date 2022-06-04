package com.WebComputing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.WebComputing.Database;

import com.WebComputing.modal.Preferiti;

@Controller
public class GestionePreferitiController {
	@GetMapping ("/pagePreferiti")
	public String pagePreferiti(HttpServletRequest req) {
		String username= (String) req.getSession().getAttribute("username");
		if (username != null) {
				List<Preferiti> preferiti=Database.getInstance().getPreferitiDao().findByIdUsername(username);
				req.setAttribute("preferiti", preferiti);
				return "preferiti";
		}
		return  "notAutorizhed";
	}
}
