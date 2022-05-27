package com.WebComputing.modal;

import java.util.Objects;

public class Recensione {

	private int idAnnuncio;
	private String venditore;
	private String recensione;
	private int valutazione;
	private int codiceId;
	private String reviewer;


	public Recensione() {
		super();
	}

	public Recensione(int idAnnuncio, String venditore, String recensione, int valutazione,int codiceId, String reviewer) {
		super();
		this.idAnnuncio = idAnnuncio;
		this.venditore = venditore;
		this.recensione = recensione;
		this.reviewer= reviewer;
		this.valutazione = valutazione;
		this.codiceId=codiceId;
	}

	public int getIdAnnuncio() {
		return idAnnuncio;
	}

	public void setIdAnnuncio(int idAnnuncio) {
		this.idAnnuncio = idAnnuncio;
	}

	public String getVenditore() {
		return venditore;
	}

	public void setVenditore(String venditore) {
		this.venditore = venditore;
	}

	public String getRecensione() {
		return recensione;
	}

	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}



	public int getValutazione() {
		return valutazione;
	}

	public void setValutazione(int valutazione) {
		this.valutazione = valutazione;
	}


	public int getCodiceId() {
		return codiceId;
	}

	public void setCodiceId(int codiceId) {
		this.codiceId = codiceId;
	}

	public String getReviewer() {
		return reviewer;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	@Override
	public int hashCode() {
		return Objects.hash(codiceId, idAnnuncio, recensione, reviewer, valutazione, venditore);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Recensione other = (Recensione) obj;
		return codiceId == other.codiceId && idAnnuncio == other.idAnnuncio && Objects.equals(recensione, other.recensione)
				&& Objects.equals(reviewer, other.reviewer) && valutazione == other.valutazione
				&& Objects.equals(venditore, other.venditore);
	}

	

}
