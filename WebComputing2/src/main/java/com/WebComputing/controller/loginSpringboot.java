package com.WebComputing.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class loginSpringboot {
	

	//restituisci vista login
	@GetMapping("/pageLogin")
	public String pageLogin() {
		return "login";
	}
	
	
	
	@GetMapping("/doLogout")
	public void doLogout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("/");
	}
	
	@PostMapping("/loginServices")
	public String doLogin(HttpServletRequest req, HttpServletResponse resp ,String username, String password) throws IOException {
		
		 String sql= "select username, password from users where username = '"+ username +"' and password='"+ password +"'";
		//Controllo se esiste la sessione e la creo
		HttpSession session = req.getSession(true);
		
	
	try {
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", 
														"postgres", "antonio2000");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if (rs.next()) {
			session.setAttribute("username",rs.getString("username"));
			resp.sendRedirect("/");
		}else {
			return "login";
		}
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
	}
	
	
		
}
