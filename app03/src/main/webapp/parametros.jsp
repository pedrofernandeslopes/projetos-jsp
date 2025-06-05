<%@page import="com.rpnet.dao.UsuarioDAO"%>
<%@page import="com.rpnet.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parametros</title>
</head>
<body>
	<%
	String nome = request.getParameter("nome");
	String login = request.getParameter("login");
	String funcao = request.getParameter("funcao");
	
	//Criando usuário
	Usuario u = new Usuario();
	u.setNome(nome);
	u.setLogin(login);
	u.setFuncao(funcao);

	// Salvando usuário no banco
	UsuarioDAO uDAO = new UsuarioDAO();
	uDAO.save(u);
	System.out.println("Usuário criado com sucesso!");
	System.out.println("Nome: " + nome);
	%>

	<p>Parametros</p>
	<ul>
		<li><b>Nome: </b> <%=nome%></li>
		<li><b>Login: </b> <%=login%></li>
		<li><b>Funcao: </b> <%=funcao%></li>
	</ul>
	<%
response.sendRedirect("index.jsp");
%>
</body>
</html>