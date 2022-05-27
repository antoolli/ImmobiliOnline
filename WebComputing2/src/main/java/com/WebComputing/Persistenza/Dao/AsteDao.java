package com.WebComputing.Persistenza.Dao;

import java.util.List;

import com.WebComputing.modal.Asta;

public interface AsteDao {
	
	public List<Asta> findAll();
	public boolean saveUpdate(Asta a);
	public boolean delete (int id);
	public boolean deletebyIdAnnuncio(int idAnnuncio);
	public Asta findById(int id);
	public boolean addOfferta(String acquirente, int idAsta, int proposta);
	public List<Asta> findByAcquirente(String acquirente);
}
