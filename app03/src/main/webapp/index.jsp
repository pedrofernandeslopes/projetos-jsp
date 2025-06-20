<%@page import="com.rpnet.util.TextUtil"%>
<%@page import="com.rpnet.model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="com.rpnet.dao.UsuarioDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Meu Formulário</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<body>

	<%
	UsuarioDAO uDAO = new UsuarioDAO();

	List<Usuario> list = uDAO.listAll();

	Long id = null;

	try {
		id = Long.parseLong(request.getParameter("id"));
	} catch (Exception e) {

	}

	Usuario usuario = new Usuario();

	if (id != null) {
		uDAO = new UsuarioDAO();
		usuario = uDAO.load(id);
		usuario = usuario == null ? new Usuario() : usuario;
	}
	%>

	<div class="container">
		<div class="card col-sm-12 col-md-8 mt-5">
			<div class="card-body">
				<h5 class="card-title">Cadastro de Usuário</h5>
				<div>
					<form onsubmit="return validateForm1();" action="usuario"
						method="post" accept-charset="utf-8">
						<input id="id" name="id" type="hidden"
							value="<%=TextUtil.cast(usuario.getId())%>" /> <input id="opt"
							name="opt" type="hidden"
							value="<%=id == null ? "save" : "update"%>" />

						<div class="form-group">
							<label for="nome">Nome: </label> <input id="nome" name="nome"
								type="text" maxlength="10" class="form-control"
								value="<%=TextUtil.cast(usuario.getNome())%>" />
						</div>
						<div class="form-group">
							<label for="login">Login: </label> <input id="login" name="login"
								type="text" class="form-control"
								value="<%=TextUtil.cast(usuario.getLogin())%>" />
							<div class="valid-feedback">Looks good!</div>

						</div>
						<div class="form-group">
							<%
							String funcao = TextUtil.cast(usuario.getFuncao());
							%>
							<label for="funcao">Função: </label> <select id="funcao"
								name="funcao" class="form-control">
								<option value="" disabled
									<%=funcao.equals("") ? "selected" : ""%>>Selecione uma
									função</option>
								<option value="admin"
									<%=funcao.equals("admin") ? "selected" : ""%>>Administrador</option>
								<option value="manager"
									<%=funcao.equals("manager") ? "selected" : ""%>>Gerente</option>
								<option value="user"
									<%=funcao.equals("user") ? "selected" : ""%>>Operador</option>
							</select>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Salvar" /> <input
								type="reset" class="btn btn-secondary" value="Limpar" />
						</div>
					</form>
				</div>
			</div>
		</div>




		<%
		if (list.size() > 0) {
		%>
		<div class="card col-sm-12 col-md-8 mt-5 mb-5">
			<div class="card-body">
				<h5 class="card-title">
					Lista de Usuários:
					<%=list.size()%></h5>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Nome</th>
						<th scope="col">Login</th>
						<th scope="col">Função</th>
						<th scope="col">Ações</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Usuario u : list) {
					%>
					<tr>
						<th scope="row"><%=u.getId()%></th>
						<td><%=u.getNome()%></td>
						<td><%=u.getLogin()%></td>
						<td><%=u.getFuncao()%></td>
						<td>
							<button class="btn btn-primary" alt="Editar" title="Editar" onclick="editar(<%=u.getId()%>)">Editar</button>
							<button class="btn btn-danger" onclick="remover(<%=u.getId()%>)">Deletar</button>
							<button class="btn btn-info">Info</button>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<%
		}
		%>

	</div>


	<!-- importação do jquery: para fazer querys -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<!-- importação do estilo via bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<!-- script: onde vai o código -->
	<script>
		
		function remover(id) {
			
			if(confirm("Tem certeza que deseja deletar esse registro?")){
				document.location = "usuario?opt=delete&id=" + id;	
			}
			
		}
		
		
		function editar(id) {
			document.location = "?id=" + id;	
		}
		
		//função de validação do formulário, usando alert: 1 alerta por vez a cada erro
		function validateForm() {
			if ($('#nome').val() == '') {
				alert("O campo nome não pode ser vazio!");
				$('#nome').focus();
				return false;
			}
			if ($('#login').val() == '') {
				alert("O campo login não pode ser vazio!");
				$('#login').focus();
				return false;
			}
			console.log("Teste " + $('#funcao').val());
			if ($('#funcao').val() == null || $('#funcao').val() == '') {
				alert("O campo função não pode ser vazio!");
				$('#funcao').focus();
				return false;
			}

		}

		//funçaõ de validação de formulário usando after, mostrando todos os campos inválidos de uma vez
		function validateForm1() {
			let valid = true;

			//limpeza de alertas anteriores de campo inválido
			//para garantir que os alertar de um mesmo campo não se acumulem
			clearForm();

			if ($('#nome').val() == '') {
				$('#nome')
						.after(
								'<div class="invalid-feedback"> O campo "Nome" não pode ser vazio! </div>');
				$('#nome').addClass('is-invalid');
				valid = false;
			}

			if ($('#login').val() == '') {
				$('#login')
						.after(
								'<div class="invalid-feedback"> O campo "Login" não pode ser vazio! </div>');
				$('#login').addClass('is-invalid');
				valid = false;
			}

			if ($('#funcao').val() == null) {
				$('#funcao')
						.after(
								'<div class="invalid-feedback"> O campo "Função" não pode ser vazio! </div>');
				$('#funcao').addClass('is-invalid');
				valid = false;
			}
			return valid;
		}

		//funçção que limpa o alerta de campo inválido
		function clearForm() {
			$('.invalid-feedback').remove();
			$('#nome').removeClass('is-invalid');
			$('#login').removeClass('is-invalid');
			$('#funcao').removeClass('is-invalid');
		}
	</script>
</body>
</html>