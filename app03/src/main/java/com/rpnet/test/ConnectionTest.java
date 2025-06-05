package com.rpnet.test;

import java.sql.Connection;

import com.rpnet.db.ManagerConnection;

public class ConnectionTest {

	public static void main(String[] args) {
		Connection conn = ManagerConnection.getConnection();
		
		if (conn == null) 
			System.err.println("Não foi possível conectar!");
		else 
			System.out.println("Conectado com sucesso!");
	}
}
