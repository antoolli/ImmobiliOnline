package com.WebComputing.modal;

import java.util.Objects;

public class Annuncio {
	
	private int id;
	private String titolo;
	private String descrizione;
	private int prezzo;
	private int metri;
	private String latitudine;
	private String longitudine;
	private String venditore;
	private String tipologia;
	private int prezzoVecchio;
	
	
	public Annuncio() {super();}


	public Annuncio(int id, String titolo, String descrizione, int prezzo, int metri, String latitudine,
			String longitudine, String venditore, String tipologia, int prezzoVecchio) {
		super();
		this.id = id;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.metri = metri;
		this.latitudine = latitudine;
		this.longitudine = longitudine;
		this.venditore = venditore;
		this.tipologia = tipologia;
		this.prezzoVecchio= prezzoVecchio;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitolo() {
		return titolo;
	}


	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}


	public String getDescrizione() {
		return descrizione;
	}


	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}


	public int getPrezzo() {
		return prezzo;
	}


	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}


	public int getMetri() {
		return metri;
	}


	public void setMetri(int metri) {
		this.metri = metri;
	}


	public String getLatitudine() {
		return latitudine;
	}


	public void setLatitudine(String latitudine) {
		this.latitudine = latitudine;
	}


	public String getLongitudine() {
		return longitudine;
	}


	public void setLongitudine(String longitudine) {
		this.longitudine = longitudine;
	}


	public String getVenditore() {
		return venditore;
	}


	public void setVenditore(String venditore) {
		this.venditore = venditore;
	}


	public String getTipologia() {
		return tipologia;
	}


	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}
	
	


	public int getPrezzoVecchio() {
		return prezzoVecchio;
	}


	public void setPrezzoVecchio(int prezzoVecchio) {
		this.prezzoVecchio = prezzoVecchio;
	}


	@Override
	public int hashCode() {
		return Objects.hash(descrizione, id, latitudine, longitudine, metri, prezzo, prezzoVecchio, tipologia, titolo,
				venditore);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Annuncio other = (Annuncio) obj;
		return Objects.equals(descrizione, other.descrizione) && id == other.id
				&& Objects.equals(latitudine, other.latitudine) && Objects.equals(longitudine, other.longitudine)
				&& metri == other.metri && prezzo == other.prezzo && prezzoVecchio == other.prezzoVecchio
				&& Objects.equals(tipologia, other.tipologia) && Objects.equals(titolo, other.titolo)
				&& Objects.equals(venditore, other.venditore);
	}



	

	
}
