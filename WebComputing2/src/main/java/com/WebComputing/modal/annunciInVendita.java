package com.WebComputing.modal;



public class annunciInVendita extends Annuncio {

	public annunciInVendita() {
		super();
		// TODO Auto-generated constructor stub
	}

	public annunciInVendita(int id, String titolo, String descrizione, int prezzo, int metri, String latitudine,
			String longitudine, String venditore, String tipologia, int prezzoVecchio) {
		super(id, titolo, descrizione, prezzo, metri, latitudine, longitudine, venditore, tipologia, prezzoVecchio);
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		return true;
	}

	
	
	

	
	
	
	
}
