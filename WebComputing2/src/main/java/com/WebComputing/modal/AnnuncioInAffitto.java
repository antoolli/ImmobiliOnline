package com.WebComputing.modal;

import java.util.Objects;

public class AnnuncioInAffitto extends Annuncio {
	private int contratto;

	public AnnuncioInAffitto() {super();}

	
	public AnnuncioInAffitto(int id, String titolo, String descrizione, int prezzo, int metri, String latitudine,
			String longitudine, String venditore, String tipologia, int prezzoVecchio, int contratto) {
		super(id, titolo, descrizione, prezzo, metri, latitudine, longitudine, venditore, tipologia, prezzoVecchio);
		this.contratto=contratto;
	}


	public int getContratto() {
		return contratto;
	}

	public void setContratto(int contratto) {
		this.contratto = contratto;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(contratto);
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		AnnuncioInAffitto other = (AnnuncioInAffitto) obj;
		return contratto == other.contratto;
	}


	
	
	
}
