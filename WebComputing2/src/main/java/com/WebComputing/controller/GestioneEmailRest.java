package com.WebComputing.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import com.WebComputing.modal.Email;

@RestController
public class GestioneEmailRest {
	
	private void sendmail(Email email) throws AddressException, MessagingException, IOException{
	   Properties props = new Properties();
	   props.put("mail.smtp.auth", "true");
	   props.put("mail.smtp.starttls.enable", "true");
	   props.put("mail.smtp.host", "smtp.gmail.com");
	   props.put("mail.smtp.port", "587");
	   
	   Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	      protected PasswordAuthentication getPasswordAuthentication() {
	         return new PasswordAuthentication("progettoweb14@gmail.com", "dkkoiwktbowgycyn");
	      }
	   });
	   Message msg = new MimeMessage(session);
	   msg.setFrom(new InternetAddress("progettoweb14@gmail.com", false));

	   msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getToEmail()));
	   msg.setSubject(email.getSubject());
	   msg.setContent(email.getBody(), "text/html");
	   msg.setSentDate(new Date());

	   MimeBodyPart messageBodyPart = new MimeBodyPart();
	   messageBodyPart.setContent(email.getBody(), "text/html");

	   Multipart multipart = new MimeMultipart();
	   multipart.addBodyPart(messageBodyPart);
	   msg.setContent(multipart);
	   Transport.send(msg);   
	}
	
	
	@PostMapping("/inviaEmail")
	public String inviaMail(@RequestBody Email email) {
		try {
			sendmail(email);
		} catch (AddressException e) {
			System.out.println("errore invio email");
			e.printStackTrace();
		} catch (MessagingException e) {
			System.out.println("errore invio email");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("errore invio email");
			e.printStackTrace();
		}
		
		return"ok";
	}
	
	
	
	
}
