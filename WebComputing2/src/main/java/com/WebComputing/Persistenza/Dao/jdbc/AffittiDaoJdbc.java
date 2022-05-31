package com.WebComputing.Persistenza.Dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.WebComputing.IdBrokerVendita;
import com.WebComputing.Persistenza.Dao.AffittiDao;
import com.WebComputing.modal.AnnuncioInAffitto;



public class AffittiDaoJdbc implements AffittiDao{
	
	Connection conn;
	public AffittiDaoJdbc (Connection conn) {
		this.conn=conn;
	}
	
	@Override
	public List<AnnuncioInAffitto> findAll() {
		List<AnnuncioInAffitto> annunci_affitti= new ArrayList<AnnuncioInAffitto>();
		String query= "select * from annunci_affitti";
		try {
			Statement st= conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				AnnuncioInAffitto ann= new AnnuncioInAffitto();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setContratto(rs.getInt("contratto"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setLatitudine(rs.getString("latitudine"));
				ann.setLongitudine(rs.getString("longitudine"));
				ann.setVenditore(rs.getString("venditore"));
				ann.setTipologia(rs.getString("tipologia"));
				ann.setPrezzoVecchio(rs.getInt("prezzovecchio"));
				
				annunci_affitti.add(ann);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return annunci_affitti;
	}

	@Override
	public boolean saveUpdate(AnnuncioInAffitto annuncio) {
			
			if (annuncio.getId()==0) {
				try {
					annuncio.setId(IdBrokerVendita.getId(conn));
					String query= "INSERT INTO annunci_affitti(id,titolo,descrizione,contratto,prezzo,grandezza,latitudine,longitudine,venditore,tipologia) VALUES(?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement st= conn.prepareStatement(query);
					st.setInt(1, annuncio.getId());
					st.setString(2, annuncio.getTitolo());
					st.setString(3, annuncio.getDescrizione());
					st.setInt(4,annuncio.getContratto());
					st.setInt(5, annuncio.getPrezzo());
					st.setInt(6, annuncio.getMetri());
					st.setString(7, annuncio.getLatitudine());
					st.setString(8, annuncio.getLongitudine());
					st.setString(9, annuncio.getVenditore());
					st.setString(10, annuncio.getTipologia());
					st.executeUpdate();
					} catch (SQLException e) {
					e.printStackTrace();
					return false;
					}
			}else {
			
				int a=annuncio.getId();
				System.out.println(a);
				String query= "UPDATE annunci_affitti SET titolo=?, descrizione=?, contratto=?, prezzo=?, grandezza=?, latitudine=?, longitudine=?, tipologia=? WHERE id='"+a+"'";
				try {
					PreparedStatement st = conn.prepareStatement(query);
					st.setString(1, annuncio.getTitolo());
					st.setString(2,annuncio.getDescrizione());
					st.setInt(3, annuncio.getContratto());
					st.setInt(4, annuncio.getPrezzo());
					st.setInt(5, annuncio.getMetri());
					st.setString(6, annuncio.getLatitudine());
					st.setString(7, annuncio.getLongitudine());
					st.setString(8, annuncio.getTipologia());
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
		String query= "DELETE FROM annunci_affitti WHERE id =?";
		System.out.println(id);
		System.out.print("sono nella delete");
		
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
	public AnnuncioInAffitto findById(int id) {
		List<AnnuncioInAffitto> annunci= this.findAll();
		for (AnnuncioInAffitto i : annunci) {
			if (i.getId()==id) {
				return i;
			}
		}
			return null;
	}

	@Override
	public List<AnnuncioInAffitto> findByVenditore(String venditore) {
		List<AnnuncioInAffitto>annunci= new ArrayList<AnnuncioInAffitto>();
		String query= "select * from annunci_affitti where venditore = '"+venditore+"' " ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				AnnuncioInAffitto ann= new AnnuncioInAffitto();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setContratto(rs.getInt("contratto"));
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
	public void applicaSconto(int idAnnuncio, int sconto) {
		AnnuncioInAffitto annuncio=this.findById(idAnnuncio); 
		int perc= (annuncio.getPrezzo()*sconto)/100;
		 int prezzoVecchio = annuncio.getPrezzo();
		 int prezzoNuovo= prezzoVecchio - perc;
		 String query="UPDATE annunci_affitti SET prezzo=?, prezzovecchio=? where id='"+idAnnuncio+"'";
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
		String query= "select * from annunci_affitti where venditore = '"+venditore+"' " ;
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
		String query= "DELETE FROM annunci_affitti WHERE venditore =?";
		System.out.print("sono nella delete");
		
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
	public List<AnnuncioInAffitto> filtraTipologia(String tipologia) {
		List<AnnuncioInAffitto>annunci= new ArrayList<AnnuncioInAffitto>();
		String query= "select * from annunci_affitti where tipologia = '"+tipologia+"' " ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				AnnuncioInAffitto ann= new AnnuncioInAffitto();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setContratto(rs.getInt("contratto"));
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
	public List<AnnuncioInAffitto> ordinaPerPrezzoCrescente() {
		List<AnnuncioInAffitto>annunci= new ArrayList<AnnuncioInAffitto>();
		String query= "SELECT * FROM annunci_affitti ORDER BY prezzo ASC" ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				AnnuncioInAffitto ann= new AnnuncioInAffitto();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setContratto(rs.getInt("contratto"));
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
	public List<AnnuncioInAffitto> ordinaPerPrezzoDecrescente() {
		List<AnnuncioInAffitto>annunci= new ArrayList<AnnuncioInAffitto>();
		String query= "SELECT * FROM annunci_affitti ORDER BY prezzo DESC" ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				AnnuncioInAffitto ann= new AnnuncioInAffitto();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setContratto(rs.getInt("contratto"));
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
	public List<AnnuncioInAffitto> ordinaPerGrandezzaCrescente() {
		List<AnnuncioInAffitto>annunci= new ArrayList<AnnuncioInAffitto>();
		String query= "SELECT * FROM annunci_affitti ORDER BY grandezza ASC" ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				AnnuncioInAffitto ann= new AnnuncioInAffitto();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setContratto(rs.getInt("contratto"));
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
	public List<AnnuncioInAffitto> ordinaPerGrandezzaDecrescente() {
		List<AnnuncioInAffitto>annunci= new ArrayList<AnnuncioInAffitto>();
		String query= "SELECT * FROM annunci_affitti ORDER BY grandezza DESC" ;
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				AnnuncioInAffitto ann= new AnnuncioInAffitto();
				ann.setId(rs.getInt("id"));
				ann.setTitolo(rs.getString("titolo"));
				ann.setDescrizione(rs.getString("descrizione"));
				ann.setPrezzo(rs.getInt("prezzo"));
				ann.setMetri(rs.getInt("grandezza"));
				ann.setContratto(rs.getInt("contratto"));
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
