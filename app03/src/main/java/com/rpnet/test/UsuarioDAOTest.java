package com.rpnet.test;

import com.rpnet.dao.UsuarioDAO;
import com.rpnet.model.Usuario;

public class UsuarioDAOTest {

	public UsuarioDAOTest() {
		
	}
	
	public void testSave() {
		// Criando usuário
		Usuario u = new Usuario();
		u.setNome("Pedro");
		u.setLogin("Lopes");
		u.setFuncao("Administrador");
		
		// Salvando usuário no banco
		UsuarioDAO uDAO = new UsuarioDAO();
		uDAO.save(u);
		System.out.println("Usuário criado com sucesso!");
		
	}
	
	public static void main(String[] args) {
		UsuarioDAOTest app = new UsuarioDAOTest();
		
		app.testSave();

	}

}
