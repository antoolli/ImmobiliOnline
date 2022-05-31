package com.WebComputing.modal;

public class Preferiti extends Annuncio {
	private String username;

	public Preferiti() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Preferiti(int id, String titolo, String descrizione, int prezzo, int metri, String latitudine,
			String longitudine, String venditore, String tipologia, int prezzoVecchio, String username) {
		super(id, titolo, descrizione, prezzo, metri, latitudine, longitudine, venditore, tipologia, prezzoVecchio);
		this.username=username;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		Preferiti other = (Preferiti) obj;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}


	
}
