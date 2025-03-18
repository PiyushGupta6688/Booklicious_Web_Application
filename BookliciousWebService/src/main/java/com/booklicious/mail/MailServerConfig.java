package com.booklicious.mail;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

@Component
public class MailServerConfig {
	@Bean
	public JavaMailSender getMailConfig() {
		JavaMailSenderImpl mailSender=new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		
		
		mailSender.setUsername(MailConstants.EMAIL);
		mailSender.setPassword(MailConstants.PASSWORD);
		Properties prop=mailSender.getJavaMailProperties();
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		//prop.put("mail.debug", "true");//optional
		return mailSender;
	}
}
