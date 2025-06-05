package com.rpnet.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ManagerConnection {

	public static Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/app03";
		String user = "pedro";
		String password = "12345";

		try {
			// conexão com BD
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
