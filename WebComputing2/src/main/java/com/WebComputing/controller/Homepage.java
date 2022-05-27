package com.WebComputing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Homepage {
	@GetMapping("/")
	public String homePage() {
		return "index";
	}
}
