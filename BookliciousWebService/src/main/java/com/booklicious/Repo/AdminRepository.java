package com.booklicious.Repo;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import com.booklicious.mail.MailSend;
import com.booklicious.models.Admin;
import com.booklicious.models.Book;

import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
@Repository
public class AdminRepository {
@Autowired 
private EntityManager entitymanager;


@Autowired
MailSend ms;


  public String login(String id, String password) {
	  //often required when using Hibernate-specific features in JPA.
	  Session session = entitymanager.unwrap(Session.class);
	  //Retrieves the Admin entity with the given id from the database.If no Admin entity exists with the given id, a will be null.
	  Admin a = session.get(Admin.class, id);
	  if(a==null || !password.equals(a.getPassword())){
		  return null;
	  }  else {
		  //returns name field from database
		  return a.getName();
	  }
	}
  
  @Transactional
  public String updatePassword(String opass,String npass,String rpass,String id) {
	  if(npass.equals(rpass)) {
		  Session session = entitymanager.unwrap(Session.class);
		  Admin a = session.get(Admin.class, id);
		  if(opass.equals(a.getPassword())) {
			  a.setPassword(rpass);
			  session.persist(a);
				//mail sending
				String remail=id;
				String sub="Booklicious App: Password Updation.";
				String body="Password Updated Successfully"; 
				String result=ms.doMailSend(remail,sub,body);
				System.out.println(result);
				
				return "Password Updated Successfully!";
			}else {
				return "Wrong OLD Password Entered!";
			}
		       }else {
			  return "New Password Mismatched!";
		    }
		  }
	  
  
  
	@Transactional
	public String forgetPassword(String email) {
		Session session= entitymanager.unwrap(Session.class);
		Admin a=session.get(Admin.class,email);
		if(a==null) {
			return "Mail Id does not registered!";
		}else {
			//new password generated code Numeric
			//String p=String.valueOf((int)(Math.random()*900000)+100000);
			// //String p=(int)(Math.random()*1000000) +"";
			
			//new password generated code Alpha-Numeric
			
			String chars = " abcdefghijklmnopqrstuvwxyz@#%^&ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
			String p="";
	        for(int x=1;x<=6;x++) { 
	            int index = (int)(Math.random()*chars.length());
	            p += chars.charAt(index);
	        }
			a.setPassword(p);
			session.persist(a);
			//mail sending
			String remail=email;
			String sub="Booklicious App: New Password Generated.";
			String body="<div style='text-align: center; border: 1px dashed black;'>"
					+ "<img style='padding: 20px;' src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZogjnIkozuL7GPW8Ufdbvls-3oJjQ_a5PMg&s' />"
					+ "    <hr/>"
					+ "<h1><span style='color: red;'>Booklicious App:</span> New Password Generated.</h1>"
					+ "    <hr/>"
					+ "    <p>Your New Password is: <b><mark>"+p+"</mark></b></p>"
					+ "    <p style='padding: 10px; color: white; background-color: black;'>Rights reserved by Booklicious</p>" 
					+ "    </div>"; 
			String result=ms.doMailSendHTML(remail,sub,body);
			System.out.println(result);
			return "New Password Send!";
		}
		
	}
	
}
	


