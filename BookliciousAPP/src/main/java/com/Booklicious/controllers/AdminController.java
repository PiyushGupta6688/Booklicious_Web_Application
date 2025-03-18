package com.Booklicious.controllers;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.client.RestTemplate;

import com.Booklicious.models.Admin;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

RestTemplate restTemplate= new RestTemplate();
 String URL="http://localhost:9990/";


	@GetMapping("/login")
	public String login() {
		return "AdminLogin";
	}

	@PostMapping("/adminLogin")
	public String adminLogin(@RequestParam String id,@RequestParam String password,ModelMap m , HttpSession session) {
		String API = "admin/login";
		Admin admin = new com.Booklicious.models.Admin();
		admin.setId(id);
		admin.setPassword(password);
            HttpEntity<Admin> requestEntity = new HttpEntity(admin);		
		  String name= restTemplate.postForObject(URL+API, requestEntity, String.class);
		if(name==null) {
			m.addAttribute("msg","Invalid Id or Password");
			return "AdminLogin";
		}else { 
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			return "AdminHome";
		     }
		}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "AdminLogin";
	}
	
	@PostMapping("/updatePassword")
	public String updatePassword(String opass,String npass, String rpass,ModelMap m , HttpSession session) {
		String id = (String)session.getAttribute("id");
		String API= "updatePassword/"+opass+"/"+npass+"/"+rpass+"/"+id;
		ResponseEntity<String> result = restTemplate.exchange(URL+API,HttpMethod.POST,null,String.class);
		String msg = result.getBody();

		m.addAttribute("msg", msg);
		return "AdminHome";
	}
    
	@RequestMapping("/forgotPassword")
	public String forgotPassword(String email, ModelMap m) {
		String API = "forgotPassword/"+email;
		ResponseEntity<String> result = restTemplate.exchange(URL+API, HttpMethod.POST,null,String.class);
		String msg = result.getBody();		
		m.addAttribute("msg",msg);
		return "AdminLogin";
	}

}
	
	
	
	
	
	


