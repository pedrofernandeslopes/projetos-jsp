package com.rpnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rpnet.db.ManagerConnection;
import com.rpnet.model.Usuario;

public class UsuarioDAO {
	private Connection connection;

	public UsuarioDAO() {
		connection = ManagerConnection.getConnection();
	}
	
	public Usuario load(Long id) {

		Usuario u = null;

		try {
			String sql = "SELECT * FROM usuario WHERE id = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				
				u = new Usuario();
				u.setId(rs.getLong("id"));
				u.setNome(rs.getString("nome"));
				u.setLogin(rs.getString("login"));
				u.setFuncao(rs.getString("funcao"));
				
			}
						
			
			stmt.close();
			connection.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return u;
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
	
	public void update(Usuario usuario) {
		try {
			String sql = "UPDATE usuario SET nome = ?, login = ?, funcao = ?  WHERE id = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getLogin());
			stmt.setString(3, usuario.getFuncao());
			stmt.setLong(4, usuario.getId());
			stmt.executeUpdate();
			stmt.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	
	public void delete(Usuario usuario) {
		try {
			String sql = "DELETE FROM usuario WHERE id = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setLong(1, usuario.getId());
			stmt.executeUpdate();
			stmt.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	
	public List<Usuario> listAll() {

		List<Usuario> result = new ArrayList<>();

		try {
			String sql = "SELECT * FROM usuario ORDER BY id";
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				
				Usuario u = new Usuario();
				u.setId(rs.getLong("id"));
				u.setNome(rs.getString("nome"));
				u.setLogin(rs.getString("login"));
				u.setFuncao(rs.getString("funcao"));
				
				result.add(u);
			}
						
			
			stmt.close();
			connection.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return result;
	}

}
