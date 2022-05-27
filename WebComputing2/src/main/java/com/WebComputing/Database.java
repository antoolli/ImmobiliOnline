package com.WebComputing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


import com.WebComputing.Persistenza.Dao.AffittiDao;
import com.WebComputing.Persistenza.Dao.AsteDao;
import com.WebComputing.Persistenza.Dao.IscrittiDao;
import com.WebComputing.Persistenza.Dao.RecensioneDao;
import com.WebComputing.Persistenza.Dao.VenditaDao;
import com.WebComputing.Persistenza.Dao.jdbc.AffittiDaoJdbc;
import com.WebComputing.Persistenza.Dao.jdbc.AsteDaoJdbc;
import com.WebComputing.Persistenza.Dao.jdbc.IscrittiDaoJdbc;
import com.WebComputing.Persistenza.Dao.jdbc.RecensioneDaoJdbc;
import com.WebComputing.Persistenza.Dao.jdbc.VenditaDaoJdbc;


public class Database {

	Connection conn;
	
	private static Database instance =null;
	public static Database getInstance() {
		if (instance == null) {
			instance= new Database();
		}
		return  instance;
	}
	private Database() {
		try {
			conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "antonio2000");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	public IscrittiDao getIscrittiDao() {
		return new IscrittiDaoJdbc(conn);
	}
	
	public VenditaDao getVenditaDao() {
		return new VenditaDaoJdbc(conn);
	}
	public RecensioneDao getRecensioneDao() {
		return new RecensioneDaoJdbc(conn);
	}
	public AffittiDao getAffittiDao() {
		return new AffittiDaoJdbc(conn);
	}
	public AsteDao getAsteDao() {
		return new AsteDaoJdbc(conn);
	}
		
}

