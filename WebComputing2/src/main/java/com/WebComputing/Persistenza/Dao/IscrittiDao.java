package com.WebComputing.Persistenza.Dao;

import java.util.List;

import com.WebComputing.modal.Iscritti;

public interface IscrittiDao {

	public List <Iscritti> findAll();
	public Iscritti findByPrimaryKey(String username);
	public boolean findByUsername(String username);
	public Iscritti findByUsernameiS(String username);
	public boolean saveUpdate(Iscritti iscritto);
	public boolean delete(String username);
	public boolean nominaAdmin(String username);

	
}
