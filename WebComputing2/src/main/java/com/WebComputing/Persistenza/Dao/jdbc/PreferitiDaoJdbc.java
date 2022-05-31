package com.WebComputing.Persistenza.Dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.WebComputing.Persistenza.Dao.PreferitiDao;
import com.WebComputing.modal.Annuncio;
import com.WebComputing.modal.Preferiti;

public class PreferitiDaoJdbc implements PreferitiDao {
	Connection conn;
	public PreferitiDaoJdbc(Connection conn) {
		this.conn=conn;
	}
	@Override
	public List<Preferiti> findAll() {
		List<Preferiti> preferiti= new ArrayList<Preferiti>();
		String query= "select * from preferiti";
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Preferiti pr= new Preferiti();
				pr.setUsername(rs.getString("username"));
				pr.setId(rs.getInt("id_annuncio"));
				pr.setTitolo(rs.getString("titolo"));
				pr.setDescrizione(rs.getString("descrizione"));
				pr.setPrezzo(rs.getInt("prezzo"));
				pr.setMetri(rs.getInt("grandezza"));
				pr.setLatitudine(rs.getString("latitudine"));
				pr.setLongitudine(rs.getString("longitudine"));
				pr.setVenditore(rs.getString("venditore"));
				pr.setTipologia(rs.getString("tipologia"));
				pr.setPrezzoVecchio(rs.getInt("prezzovecchio"));
				preferiti.add(pr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return preferiti;
	}





	@Override
	public boolean delete(String username, int id) {
		String query= "DELETE FROM preferiti WHERE username =? and id_annuncio=?";
		
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setInt(2,id);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<Preferiti> findByIdUsername(String username) {
		List<Preferiti> preferiti= new ArrayList<Preferiti>();
		String query= "select * from preferiti where username='"+username+"'";
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Preferiti pr= new Preferiti();
				pr.setUsername(rs.getString("username"));
				pr.setId(rs.getInt("id_annuncio"));
				pr.setTitolo(rs.getString("titolo"));
				pr.setDescrizione(rs.getString("descrizione"));
				pr.setPrezzo(rs.getInt("prezzo"));
				pr.setMetri(rs.getInt("grandezza"));
				pr.setLatitudine(rs.getString("latitudine"));
				pr.setLongitudine(rs.getString("longitudine"));
				pr.setVenditore(rs.getString("venditore"));
				pr.setTipologia(rs.getString("tipologia"));
				pr.setPrezzoVecchio(rs.getInt("prezzovecchio"));
				preferiti.add(pr);
			}
		} catch (SQLException e) {
			System.out.println("duplicato non può essere aggiunto");
		}
		return preferiti;
	}
	
	@Override
	public boolean saveUpdate(String username, Annuncio annuncio) {
		String query= "INSERT INTO preferiti(id_annuncio,titolo,descrizione,prezzo,grandezza,latitudine,longitudine,venditore,tipologia,username) VALUES(?,?,?,?,?,?,?,?,?,?)";
		try {
		PreparedStatement st= conn.prepareStatement(query);
		st.setInt(1, annuncio.getId());
		st.setString(2, annuncio.getTitolo());
		st.setString(3, annuncio.getDescrizione());
		st.setInt(4, annuncio.getPrezzo());
		st.setInt(5, annuncio.getMetri());
		st.setString(6, annuncio.getLatitudine());
		st.setString(7, annuncio.getLongitudine());
		st.setString(8, annuncio.getVenditore());
		st.setString(9, annuncio.getTipologia());
		st.setString(10,username);
		st.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
		return false;
		}
	return true;
	}
	@Override
	public boolean deleteUsername(String username) {
		String query= "DELETE FROM preferiti WHERE username =?";	
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	@Override
	public boolean deleteId(int id) {
		String query= "DELETE FROM preferiti WHERE username =? and id_annuncio=?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1,id);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	
	}
}