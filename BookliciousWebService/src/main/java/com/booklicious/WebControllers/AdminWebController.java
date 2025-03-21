package com.booklicious.WebControllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booklicious.BookServices.BookliciousAppService;
import com.booklicious.models.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	public ResponseEntity<String> updatePassword(@PathVariable String opass,@PathVariable String npass,@PathVariable String rpass,@PathVariable String id) {
		String m=bookservice.updatePassword(opass, npass, rpass, id);
		ResponseEntity<String> responseEntity=new ResponseEntity<String>(m, HttpStatus.OK);
		return responseEntity;
	}
	
	@PostMapping("forgetPassword/{email}")
	public String forgetPassword(@PathVariable String email) {
		return  bookservice.forgetPassword(email); 
	}
	
	
}
