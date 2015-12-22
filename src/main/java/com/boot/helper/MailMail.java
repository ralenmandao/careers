package com.boot.helper;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class MailMail
{
	private JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	
	MailMail(){
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("dhvtsucareers@gmail.com");
		mailSender.setPassword("ralen123");
		Properties pro = new Properties();
		pro.setProperty("mail.smtp.auth", "true");
		pro.setProperty("mail.smtp.starttls.enable", "true");
		pro.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
		mailSender.setJavaMailProperties(pro);
	}
	
	@Async
	public void sendMail(String from, String to, String subject, String msg) {

		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(msg);
		mailSender.send(message);	
	}
}