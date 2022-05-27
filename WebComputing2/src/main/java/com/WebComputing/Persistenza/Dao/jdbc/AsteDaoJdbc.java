package com.WebComputing.Persistenza.Dao.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.WebComputing.IdBrokerAsta;
import com.WebComputing.Persistenza.Dao.AsteDao;

import com.WebComputing.modal.Asta;

public class AsteDaoJdbc implements AsteDao {
	Connection conn;
	public AsteDaoJdbc(Connection conn) {
		this.conn=conn;
	}
	
	@Override
	public List<Asta> findAll() {
		List<Asta> aste= new ArrayList<Asta>();
		String query= "select * from aste";
		try {
			Statement st= conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Asta asta= new Asta();
				asta.setId(rs.getInt("id"));
				asta.setIdAnnuncio(rs.getInt("idannuncio"));
				asta.setTitolo(rs.getString("titolo"));
				asta.setScadenza(rs.getDate("scadenza"));
				asta.setPrezzoBase(rs.getInt("prezzobase"));
				asta.setUltimoPrezzo(rs.getInt("ultimoprezzo"));
				asta.setAcquirente(rs.getString("acquirente"));
				
				aste.add(asta);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
		return aste;
	}

	@Override
	public boolean saveUpdate(Asta asta) {
		if (asta.getId()==0) {
			try {
				asta.setId(IdBrokerAsta.getId(conn));
				String query= "INSERT INTO aste(id, idannuncio,titolo,scadenza,prezzobase)  VALUES(?,?,?,?,?)";
				PreparedStatement st= conn.prepareStatement(query);
				st.setInt(1, asta.getId());
				st.setInt(2, asta.getIdAnnuncio());
				st.setString(3,asta.getTitolo());
				st.setDate(4, asta.getScadenza());
				st.setInt(5, asta.getPrezzoBase());
				st.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}else { // TODO   update
			int a=asta.getId();
			String query= "UPDATE aste SET  titolo=?, prezzobase=?, scadenza=?  WHERE id='"+a+"'";
			PreparedStatement st;
			try {
				st = conn.prepareStatement(query);
				st.setString(1, asta.getTitolo());
				st.setInt(2, asta.getPrezzoBase());
				st.setDate(3, asta.getScadenza());
				st.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean delete(int id) {
		String query= "DELETE FROM aste WHERE id =?";

		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Asta findById(int id) {
		List<Asta> aste= this.findAll();
		for (Asta a: aste) {
			if(a.getId()== id) {
				return a;
			}
		}
		return null;
	}

	@Override
	public boolean addOfferta(String acquirente, int idAsta, int proposta) {
	
		String query= "UPDATE aste SET ultimoprezzo=?, acquirente=? where id='"+idAsta+"'";
		PreparedStatement st;
		try {
			st = conn.prepareStatement(query);
			st.setInt(1, proposta);
			st.setString(2, acquirente);
			st.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deletebyIdAnnuncio(int idAnnuncio) {
		String query= "DELETE FROM aste WHERE idannuncio =?";

		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, idAnnuncio);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<Asta> findByAcquirente(String acquirente) {
		List<Asta> aste= new ArrayList<Asta>();
		String query= "select * from aste Where acquirente='"+acquirente+"'";
		try {
			Statement st= conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Asta asta= new Asta();
				asta.setId(rs.getInt("id"));
				asta.setIdAnnuncio(rs.getInt("idannuncio"));
				asta.setTitolo(rs.getString("titolo"));
				asta.setScadenza(rs.getDate("scadenza"));
				asta.setPrezzoBase(rs.getInt("prezzobase"));
				asta.setUltimoPrezzo(rs.getInt("ultimoprezzo"));
				asta.setAcquirente(rs.getString("acquirente"));
				
				aste.add(asta);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
		return aste;
	}

}
