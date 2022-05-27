package com.WebComputing.modal;

import java.util.Objects;

public class Iscritti {
	private String username;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private int eta;
	private String sesso;
	private String permessi;
	
	
	
	public Iscritti() {}
	
	public Iscritti(String username, String email, String password, String nome, String cognome, int eta,
			String sesso, String permessi) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.eta = eta;
		this.sesso = sesso;
		this.permessi = permessi;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public int getEta() {
		return eta;
	}
	public void setEta(int eta) {
		this.eta = eta;
	}
	public String getSesso() {
		return sesso;
	}
	public void setSesso(String sesso) {
		this.sesso = sesso;
	}
	public String getPermessi() {
		return permessi;
	}
	public void setPermessi(String permessi) {
		this.permessi = permessi;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cognome, eta, email, nome, password, permessi, sesso, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Iscritti other = (Iscritti) obj;
		return Objects.equals(cognome, other.cognome) && Objects.equals(eta, other.eta)
				&& Objects.equals(email, other.email) && Objects.equals(nome, other.nome)
				&& Objects.equals(password, other.password) && Objects.equals(permessi, other.permessi)
				&& Objects.equals(sesso, other.sesso) && Objects.equals(username, other.username);
	}
	
	
	
}
