package com.WebComputing.Persistenza.Dao;

import java.util.List;

import com.WebComputing.modal.Annuncio;
import com.WebComputing.modal.Preferiti;

public interface PreferitiDao {
	public List <Preferiti> findAll();
	public boolean saveUpdate(String username, Annuncio annuncio);
	public boolean delete(String username,int id);
	public boolean deleteUsername(String username);
	public boolean deleteId(int id);
	public List<Preferiti> findByIdUsername(String username);
	
}
