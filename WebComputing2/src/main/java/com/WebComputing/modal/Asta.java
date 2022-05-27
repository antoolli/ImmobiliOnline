package com.WebComputing.modal;


import java.sql.Date;
import java.util.Objects;

public class Asta {
	private int id;
	private int idAnnuncio;
	private String titolo;
	private Date scadenza;
	private int prezzoBase;
	private int ultimoPrezzo;
	private String acquirente;
	
	
	
	public Asta() {
		super();
	}


	public Asta(int id, int idAnnuncio,String titolo, Date scadenza, int prezzoBase, int ultimoPrezzo, String acquirente) {
		super();
		this.id = id;
		this.idAnnuncio = idAnnuncio;
		this.titolo=titolo;
		this.scadenza = scadenza;
		this.prezzoBase = prezzoBase;
		this.ultimoPrezzo = ultimoPrezzo;
		this.acquirente = acquirente;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getIdAnnuncio() {
		return idAnnuncio;
	}


	public void setIdAnnuncio(int idAnnuncio) {
		this.idAnnuncio = idAnnuncio;
	}


	


	public int getPrezzoBase() {
		return prezzoBase;
	}


	public void setPrezzoBase(int prezzoBase) {
		this.prezzoBase = prezzoBase;
	}


	public int getUltimoPrezzo() {
		return ultimoPrezzo;
	}


	public void setUltimoPrezzo(int ultimoPrezzo) {
		this.ultimoPrezzo = ultimoPrezzo;
	}


	public String getAcquirente() {
		return acquirente;
	}


	public void setAcquirente(String acquirente) {
		this.acquirente = acquirente;
	}


	public String getTitolo() {
		return titolo;
	}


	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}


	public Date getScadenza() {
		return scadenza;
	}


	public void setScadenza(Date scadenza) {
		this.scadenza = scadenza;
	}


	@Override
	public int hashCode() {
		return Objects.hash(id, idAnnuncio, prezzoBase, scadenza, titolo, ultimoPrezzo, acquirente);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Asta other = (Asta) obj;
		return id == other.id && idAnnuncio == other.idAnnuncio && prezzoBase == other.prezzoBase
				&& Objects.equals(scadenza, other.scadenza) && Objects.equals(titolo, other.titolo)
				&& ultimoPrezzo == other.ultimoPrezzo && Objects.equals(acquirente, other.acquirente);
	}
	

	




	


	
	
}
