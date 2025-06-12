package com.rpnet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rpnet.dao.UsuarioDAO;
import com.rpnet.model.Usuario;

/**
 * Servlet implementation class UsuarioController
 */
@WebServlet("/logica.usuario")
public class UsuarioController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioController1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String opt = request.getParameter("opt");
		opt = opt == null ? "" : opt;

		Long id = null;

		try {
			id = Long.parseLong(request.getParameter("id"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		System.out.println("chegamos aqui");

		String nome = request.getParameter("nome");
		String login = request.getParameter("login");
		String funcao = request.getParameter("funcao");

		// Criando usuário
		Usuario u = new Usuario();
		u.setId(id);
		u.setNome(nome);
		u.setLogin(login);
		u.setFuncao(funcao);

		// Salvando usuário no banco
		UsuarioDAO uDAO = new UsuarioDAO();
		//uDAO.save(u);

		switch (opt) {
		case "load":
			u = uDAO.load(id);
			request.setAttribute("usuario", u);
			break;
		case "save":
			uDAO.save(u);
			break;
		case "update":
			uDAO.update(u);
			break;
		case "delete":
			uDAO.delete(u);
			break;
			
		default:
			break;
		}

		// aqui redireciona para a pagina de cadastros para novos cadastros
		//response.sendRedirect("usuario.jsp");
		request.getRequestDispatcher("usuario.jsp").forward(request, response);

	}

}
