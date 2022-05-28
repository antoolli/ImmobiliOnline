package com.WebComputing.Persistenza.Dao;

import java.util.List;

import com.WebComputing.modal.Recensione;

public interface RecensioneDao {
	public List<Recensione> findAll();
	public List<Recensione>findbyIdAnnuncio(int id);
	public List<Recensione> findByReviewer(String reviewer);
	public boolean save(Recensione r);
	public boolean delete(int id);
	public boolean deleteReviewer(String reviewer);
	public boolean deleteidAnnuncio(int idAnnuncio);
	public boolean deletebyVenditore(String venditore);
	public int numeroRecensioni(String reviewer);
}
