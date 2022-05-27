package com.WebComputing.Persistenza.Dao;

import java.util.List;

import com.WebComputing.modal.AnnuncioInAffitto;

public interface AffittiDao {
	public List<AnnuncioInAffitto> findAll();
	public boolean saveUpdate(AnnuncioInAffitto annuncio);
	public boolean delete(int id);
	public boolean deleteByVenditore(String venditore);
	public AnnuncioInAffitto findById(int id);
	public List<AnnuncioInAffitto> findByVenditore(String venditore);
	public void applicaSconto(int idAnnuncio,int sconto);
	public int oggettiInVendita(String venditore);
	public List<AnnuncioInAffitto> filtraTipologia(String tipologia);
	public List<AnnuncioInAffitto> ordinaPerPrezzoCrescente();
	public List<AnnuncioInAffitto> ordinaPerPrezzoDecrescente();
	public List<AnnuncioInAffitto> ordinaPerGrandezzaCrescente();
	public List<AnnuncioInAffitto> ordinaPerGrandezzaDecrescente();
	
}
