package com.WebComputing.modal;

import java.util.Objects;

public class Email {

	private String toEmail;
	private String subject;
	private String body;
	
	
	public Email() {
		super();
	}


	public Email(String toEmail, String subject, String body) {
		super();
		this.toEmail = toEmail;
		this.subject = subject;
		this.body = body;
	}


	public String getToEmail() {
		return toEmail;
	}


	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getBody() {
		return body;
	}


	public void setBody(String body) {
		this.body = body;
	}


	@Override
	public int hashCode() {
		return Objects.hash(body, subject, toEmail);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Email other = (Email) obj;
		return Objects.equals(body, other.body) && Objects.equals(subject, other.subject)
				&& Objects.equals(toEmail, other.toEmail);
	}


	@Override
	public String toString() {
		return "Email [toEmail=" + toEmail + ", subject=" + subject + ", body=" + body + "]";
	}
	
	
	
	
}
