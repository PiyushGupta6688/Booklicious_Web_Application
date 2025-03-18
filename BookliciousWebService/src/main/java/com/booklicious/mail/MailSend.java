package com.booklicious.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.internet.MimeMessage;


@Component
public class MailSend {
	@Autowired
	JavaMailSender mailSender;
	
	public String doMailSend(String remail,String sub,String body) {
		try {
			SimpleMailMessage mailMessage=new SimpleMailMessage();
			mailMessage.setTo(remail);
			mailMessage.setSubject(sub);
			mailMessage.setText(body);
			
			//JavaMailSender mailSender=new MailServerConfig().getMailConfig();
			
			mailSender.send(mailMessage);
			return "Mail Send Successfully!";
		}catch (Exception e) {
			e.printStackTrace();
			return "Mail Send Failed!";
		}
	}
	public String doMailSendHTML(String remail,String sub,String body) {
		try {
			MimeMessage mailMessage=mailSender.createMimeMessage();
			boolean multiPart=true;
			MimeMessageHelper helper=new MimeMessageHelper(mailMessage,multiPart);
			helper.setTo(remail);
			helper.setSubject(sub);
			helper.setText("text/html",body);
			mailSender.send(mailMessage);
			return "Mail Send Successfully!";
		}catch (Exception e) {
			e.printStackTrace();
			return "Mail Send Failed!";
		}
	}
}
