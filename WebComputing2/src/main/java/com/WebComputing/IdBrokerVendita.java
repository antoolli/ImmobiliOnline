package com.WebComputing;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IdBrokerVendita {
	public static int getId(Connection conn) {
		
		String query = "select nextval('vendita_seq') as id";
		
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			rs.next();
			return rs.getInt("id");
		} catch (SQLException e) {
			System.out.println("errore nell incremento id annunci");
			e.printStackTrace();
		}
		return 0;
	}
}
