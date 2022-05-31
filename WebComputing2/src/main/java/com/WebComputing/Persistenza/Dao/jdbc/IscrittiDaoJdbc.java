package com.WebComputing.Persistenza.Dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.WebComputing.Persistenza.Dao.IscrittiDao;
import com.WebComputing.modal.Iscritti;

public class IscrittiDaoJdbc implements IscrittiDao {
	
	Connection conn;
	
	public IscrittiDaoJdbc(Connection conn) {
		this.conn=conn;
	}
	
	@Override
	public List<Iscritti> findAll() {
		List<Iscritti> users = new ArrayList<Iscritti>() ;
		String query= "select * from users";
		try {
			Statement st= conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Iscritti iscr= new Iscritti();
				iscr.setUsername(rs.getString("username"));
				iscr.setEmail(rs.getString("email"));
				iscr.setPassword(rs.getString("password"));
				iscr.setNome(rs.getString("nome"));
				iscr.setCognome(rs.getString("cognome"));
				iscr.setEta(rs.getInt("eta"));
				iscr.setSesso(rs.getString("sesso"));
				iscr.setPermessi(rs.getString("permessi"));
				
				users.add(iscr);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}



	@Override
	public boolean saveUpdate(Iscritti iscritto) {
		
		//Update
			if (this.findByUsername(iscritto.getUsername())) {
				String us= iscritto.getUsername();
				String query= "UPDATE users SET email=? , password=? , nome=?, cognome=?, eta=?, sesso=? ,permessi=?  WHERE username='"+us+"'";
				try {
					PreparedStatement st= conn.prepareStatement(query);
					st.setString(1, iscritto.getEmail());
					st.setString(2, iscritto.getPassword());
					st.setString(3, iscritto.getNome());
					st.setString(4, iscritto.getCognome());
					st.setInt(5, iscritto.getEta());
					st.setString(6, iscritto.getSesso());
					st.setString(7, iscritto.getPermessi());
					st.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				}
				
			}else {
		
				String query="INSERT INTO users(username,email,password,nome,cognome,eta,sesso,permessi) VALUES(?,?,?,?,?,?,?,?)";
				try {
				PreparedStatement st= conn.prepareStatement(query);
				st.setString(1, iscritto.getUsername());
				st.setString(2, iscritto.getEmail());
				st.setString(3, iscritto.getPassword());
				st.setString(4, iscritto.getNome());
				st.setString(5, iscritto.getCognome());
				st.setInt(6, iscritto.getEta());
				st.setString(7, iscritto.getSesso());
				st.setString(8, iscritto.getPermessi());
				st.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				}
			}
		
		return true;
		
	}

	

	@Override
	public boolean findByUsername(String username) {
		
		List<Iscritti> users= this.findAll();
		
		for (Iscritti i : users) {
			if (i.getUsername().equals(username)) {
				return true;
			}
		}
		return false;
	}

	
	@Override
	public Iscritti findByUsernameiS(String username) {
		
		List<Iscritti> users= this.findAll();
		Iscritti is= new Iscritti();
		for (Iscritti i : users) {
			if (i.getUsername().equals(username)) {
				is.setUsername(i.getUsername());
				is.setEmail(i.getEmail());
				is.setPassword(i.getPassword());
				is.setNome(i.getNome());
				is.setCognome(i.getCognome());
				is.setEta(i.getEta());
				is.setSesso(i.getSesso());
				is.setPermessi(i.getPermessi());
				return is;
			}
		}
		return null;
	}

	@Override
	public boolean delete(String username) {
		
		String query= "DELETE FROM users WHERE username =?";
		System.out.println(username);
		
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
	public boolean nominaAdmin(String us) {
		System.out.println(us);
		String a="Admin";
		String query= "UPDATE users SET permessi=?  WHERE username='"+us+"'";
		try {
			PreparedStatement st= conn.prepareStatement(query);
			st.setString(1, a);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}


}

