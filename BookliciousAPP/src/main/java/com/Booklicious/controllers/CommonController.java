package com.Booklicious.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class CommonController {
	

	@ModelAttribute
	public void commonValues(ModelMap m) {
		m.addAttribute("appName","Booklicious App");
	}
	
	@GetMapping("/") 
	public String home() {
		return "index";
	}
	
}
	

