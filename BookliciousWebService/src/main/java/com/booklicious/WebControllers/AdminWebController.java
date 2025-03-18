package com.booklicious.WebControllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booklicious.BookServices.BookliciousAppService;
import com.booklicious.models.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@EnableAutoConfiguration
@RequestMapping("/admin")
//this helps to differentiate the controller and add a /admin in url path so that we can know we are calling a API
//of this particular controller
public class AdminWebController {

	@Autowired BookliciousAppService bookservice ;
	

	@PostMapping("/login")
	public String login(@RequestBody Admin admin) {
		return bookservice.login(admin.getId(), admin.getPassword());
	}
	
	
	@PutMapping("/updatePassword/{opass}/{npass}/{rpass}/{id}")
	public String updatePassword(@PathVariable String opass, @PathVariable String npass, @PathVariable String rpass,@PathVariable String id) {	
		return bookservice.updatePassword(opass,opass,rpass,id);
	}
	
	@PostMapping("forgetPassword/{id}")
	public String forgetPassword(@PathVariable String id) {
		return  bookservice.forgetPassword(id); 
	}
	
	
}
