package com.WebComputing.Persistenza.Dao;

import java.util.List;


import com.WebComputing.modal.annunciInVendita;

public interface VenditaDao {

	
	public List<annunciInVendita> findAll();
	public boolean saveUpdate(annunciInVendita annuncio);
	public boolean delete(int id);
	public boolean deleteByVenditore(String venditore);
	public annunciInVendita findById(int id);
	public List<annunciInVendita> findByVenditore(String venditore);
	public int oggettiInVendita(String venditore);
	public void applicaSconto(int idAnnuncio, int sconto);
	public List<annunciInVendita> filtraPerTipologia(String tipologia);
	public List<annunciInVendita> ordinaPerPrezzoCrescente();
	public List<annunciInVendita> ordinaPerPrezzoDecrescente();
	public List<annunciInVendita> ordinaPerGrandezzaCrescente();
	public List<annunciInVendita> ordinaPerGrandezzaDecrescente();
	
		
}
