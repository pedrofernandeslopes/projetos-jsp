package com.rpnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rpnet.db.ManagerConnection;
import com.rpnet.model.Usuario;

public class UsuarioDAO {
	private Connection connection;

	public UsuarioDAO() {
		connection = ManagerConnection.getConnection();
	}

	public void save(Usuario usuario) {
		try {
			String sql = "INSERT INTO usuario (nome, login, funcao) VALUES (?, ?, ?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getLogin());
			stmt.setString(3, usuario.getFuncao());
			stmt.executeUpdate();
			stmt.close();
			connection.close();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
}
