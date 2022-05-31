package com.WebComputing.Persistenza.Dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.WebComputing.IdBrokerRecensione;
import com.WebComputing.Persistenza.Dao.RecensioneDao;
import com.WebComputing.modal.Recensione;


public class RecensioneDaoJdbc implements RecensioneDao {
		
	Connection con;
	
	public RecensioneDaoJdbc(Connection con) {
		this.con=con;
	}
	
	@Override
	public List<Recensione> findAll() {
		List<Recensione> recensioni= new ArrayList<Recensione>();
		String query= "select * from recensioni";
		Statement st;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Recensione rec= new Recensione();
				rec.setIdAnnuncio(rs.getInt("idannuncio"));
				rec.setVenditore(rs.getString("venditore"));
				rec.setRecensione(rs.getString("recensione"));
				rec.setValutazione(rs.getInt("valutazione"));
				rec.setCodiceId(rs.getInt("codiceid"));
				rec.setReviewer(rs.getString("reviewer"));
				
				recensioni.add(rec);
		
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return recensioni;
	}

	@Override
	public List<Recensione> findbyIdAnnuncio(int idAnnuncio) {
		List<Recensione> tutte= this.findAll();
		List<Recensione> soloId= new ArrayList<Recensione>();
		for(Recensione r: tutte) {
			if (r.getIdAnnuncio()==idAnnuncio) {
				soloId.add(r);
			}
		}
		return soloId;
	}

	@Override
	public boolean save(Recensione r) {
	
		System.out.println(r.getCodiceId());
		if(r.getCodiceId()==0) {
			
			try {
				r.setCodiceId(IdBrokerRecensione.getId(con));
				String query= "INSERT INTO recensioni(idannuncio,venditore,recensione,valutazione,codiceid,reviewer) VALUES(?,?,?,?,?,?)";
				PreparedStatement st= con.prepareStatement(query);
				st.setInt(1, r.getIdAnnuncio());
				st.setString(2, r.getVenditore());
				st.setString(3, r.getRecensione());
				st.setInt(4, r.getValutazione());
				st.setInt(5, r.getCodiceId());
				st.setString(6, r.getReviewer());
				st.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}else {//todo modifica recensione non funziona
			int a= r.getCodiceId();
			System.out.println(a);
			String query= "UPDATE recensioni SET  recensione=?, valutazione=? WHERE codiceid='"+a+"'";
			try{
				PreparedStatement st= con.prepareStatement(query);
				st.setString(1, r.getRecensione());
				st.setInt(2, r.getValutazione());
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return true;
			}	
			
		}
		return true;
	}

	@Override
	public boolean delete(int id) {
		String query= "DELETE FROM recensioni WHERE  codiceid=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public boolean deleteReviewer(String reviewer) {
		String query= "DELETE FROM recensioni WHERE  reviewer=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, reviewer);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public int numeroRecensioni(String reviewer) {
		int cont=0;
		String query= "select * from recensioni where reviewer = '"+reviewer+"' " ;
		Statement st;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				cont++;
			}
		}catch (SQLException e) {e.printStackTrace();}
		return cont;
		
	}

	@Override
	public List<Recensione> findByReviewer(String reviewer) {
		List<Recensione> recensioni= new  ArrayList<Recensione>();
		String query= "select * from recensioni where reviewer = '"+reviewer+"' ";
		Statement st;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Recensione rec= new Recensione();
				rec.setIdAnnuncio(rs.getInt("idannuncio"));
				rec.setVenditore(rs.getString("venditore"));
				rec.setRecensione(rs.getString("recensione"));
				rec.setValutazione(rs.getInt("valutazione"));
				rec.setCodiceId(rs.getInt("codiceid"));
				rec.setReviewer(rs.getString("reviewer"));
				
				recensioni.add(rec);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return recensioni;
		
	}

	@Override
	public boolean deleteidAnnuncio(int idAnnuncio) {
		String query= "DELETE FROM recensioni WHERE  idannuncio=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, idAnnuncio);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public boolean deletebyVenditore(String venditore) {
		String query= "DELETE FROM recensioni WHERE  venditore=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, venditore);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	
	}

}
