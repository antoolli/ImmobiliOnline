package com.WebComputing;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IdBrokerAsta {
public static int getId(Connection conn) {
		
		String query = "select nextval('aste_id') as id";
		
		Statement st;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			rs.next();
			return rs.getInt("id");
		} catch (SQLException e) {
			System.out.println("errore nell incremento id asta");
			e.printStackTrace();
		}
		return 0;
	}
}
