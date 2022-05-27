package com.WebComputing.Persistenza.Dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.WebComputing.Database;
import com.WebComputing.IdBrokerVendita;
import com.WebComputing.Persistenza.Dao.VenditaDao;
import com.WebComputing.modal.annunciInVendita;

public class VenditaDaoJdbc implements VenditaDao {

	Connection conn;
	
	 public VenditaDaoJdbc(Connection conn) {
		 this.conn=conn;
	}
	
	@Override
	public List<annunciInVendita> findAll() {
		List<annunciInVendita> annunci_vendita= new ArrayList<annunciInVendita>();
		String query= "select * from annunci_vendita";
		try {
			Statement st= conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				annunciInVendita ann= new annunciInVendita();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				ann.setPrezzoVecchio(rs.getInt("prezzovecchio"));
				
				annunci_vendita.add(ann);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return annunci_vendita;
	}

	@Override
	public boolean saveUpdate(annunciInVendita annuncio) {
		
		
		if (annuncio.getId() == 0) {
			try {
			
				annuncio.setId(IdBrokerVendita.getId(conn));
				String query= "INSERT INTO annunci_vendita(id,titolo,descrizione,prezzo,grandezza,latitudine,longitudine,venditore,tipologia) VALUES(?,?,?,?,?,?,?,?,?)";
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
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}else {
			int a=annuncio.getId();
			String query= "UPDATE annunci_vendita SET titolo=?, descrizione=?, prezzo=?, grandezza=?, latitudine=?, longitudine=?, tipologia=? WHERE id='"+a+"'";
			PreparedStatement st;
			try {
				st = conn.prepareStatement(query);
				st.setString(1, annuncio.getTitolo());
				st.setString(2, annuncio.getDescrizione());
				st.setInt(3, annuncio.getPrezzo());
				st.setInt(4, annuncio.getMetri());
				st.setString(5, annuncio.getLatitudine());
				st.setString(6, annuncio.getLongitudine());
				st.setString(7, annuncio.getTipologia());
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		
		}
	
		return true;
	}

	@Override
	public boolean delete(int id) {
		String query= "DELETE FROM annunci_vendita WHERE id =?";
		
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		Database.getInstance().getAsteDao().deletebyIdAnnuncio(id);
		Database.getInstance().getRecensioneDao().deleteidAnnuncio(id);
		return true;
	}

	@Override
	public annunciInVendita findById(int id) {
		List<annunciInVendita> annunci= this.findAll();
		for (annunciInVendita i : annunci) {
			if (i.getId()==id) {
				return i;
			}
		}
			return null;
	}

	@Override
	public List<annunciInVendita> findByVenditore(String venditore) {
		List<annunciInVendita> annunci_vendita= new ArrayList<annunciInVendita>();
		String query= "select * from annunci_vendita where venditore = '"+venditore+"' " ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				annunciInVendita ann= new annunciInVendita();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				
				annunci_vendita.add(ann);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return annunci_vendita;
	}

	@Override
	public void applicaSconto(int idAnnuncio, int sconto) {
		annunciInVendita annuncio = this.findById(idAnnuncio);
		 int perc= (annuncio.getPrezzo()*sconto)/100;
		 int prezzoVecchio = annuncio.getPrezzo();
		 int prezzoNuovo= prezzoVecchio - perc;
		 
		 String query="UPDATE annunci_vendita SET prezzo=?, prezzovecchio=? where id='"+idAnnuncio+"'";
			PreparedStatement st;
			try {
				st = conn.prepareStatement(query);
				st.setInt(1, prezzoNuovo);
				st.setInt(2, prezzoVecchio);
				st.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return;
	}

	@Override
	public int oggettiInVendita(String venditore) {
		int cont=0;
		String query= "select * from annunci_vendita where venditore = '"+venditore+"' " ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				cont++;
			}
		}catch (SQLException e) {e.printStackTrace();}
		return cont;
	}

	@Override
	public boolean deleteByVenditore(String venditore) {
	String query= "DELETE FROM annunci_vendita WHERE venditore =?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, venditore);
			ps.executeUpdate();			
			} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public List<annunciInVendita> filtraPerTipologia(String tipologia) {
		List<annunciInVendita>annunci= new ArrayList<annunciInVendita>();
		String query="select * from annunci_vendita where tipologia = '"+tipologia+"' ";
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				annunciInVendita ann= new annunciInVendita();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				
				annunci.add(ann);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return annunci;
	}

	@Override
	public List<annunciInVendita> ordinaPerPrezzoCrescente() {
		List<annunciInVendita>annunci= new ArrayList<annunciInVendita>();
		String query="SELECT * FROM annunci_vendita ORDER BY prezzo ASC";
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				annunciInVendita ann= new annunciInVendita();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				
				annunci.add(ann);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return annunci;
	
	}

	@Override
	public List<annunciInVendita> ordinaPerPrezzoDecrescente() {
		List<annunciInVendita>annunci= new ArrayList<annunciInVendita>();
		String query="SELECT * FROM annunci_vendita ORDER BY prezzo DESC";
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				annunciInVendita ann= new annunciInVendita();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				
				annunci.add(ann);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return annunci;

	}

	@Override
	public List<annunciInVendita> ordinaPerGrandezzaCrescente() {
		List<annunciInVendita>annunci= new ArrayList<annunciInVendita>();
		String query="SELECT * FROM annunci_vendita ORDER BY grandezza ASC";
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				annunciInVendita ann= new annunciInVendita();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				
				annunci.add(ann);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return annunci;
	}

	@Override
	public List<annunciInVendita> ordinaPerGrandezzaDecrescente() {
		List<annunciInVendita>annunci= new ArrayList<annunciInVendita>();
		String query="SELECT * FROM annunci_vendita ORDER BY grandezza DESC";
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				annunciInVendita ann= new annunciInVendita();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				
				annunci.add(ann);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return annunci;
	}


	
	
	
}
