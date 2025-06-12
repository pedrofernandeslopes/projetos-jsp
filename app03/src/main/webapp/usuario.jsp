<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<body>

	<jsp:useBean id="dao" class="com.rpnet.dao.UsuarioDAO" />

	<div class="container">
		<div class="card col-sm-12 col-md-8 mt-5">
			<div class="card-body">
				<h5 class="card-title">Cadastro de Usuário</h5>

				<div>
					<form onsubmit="return validateForm1();"
						action="${pageContext.request.contextPath}/logica.usuario"
						method="post" accept-charset="utf-8">

						<c:set var="opt" value="save" />

						<c:if test="${not empty usuario.id}">

							<c:set var="opt" value="update" />

						</c:if>

						<input id="id" name="id" type="hidden" value="${usuario.id}" /> <input
							id="opt" name="opt" type="hidden" value="${opt}" />

						<div class="form-group">
							<label for="nome">Nome: </label> <input id="nome" name="nome"
								type="text" maxlength="10" class="form-control"
								value="${usuario.nome}" />
						</div>
						<div class="form-group">
							<label for="login">Login: </label> <input id="login" name="login"
								type="text" class="form-control" value="${usuario.login}" />
							<div class="valid-feedback">Looks good!</div>

						</div>
						<div class="form-group">

							<c:set var="funcao" value="${usuario.funcao}" />

							<label for="funcao">Função: </label> <select id="funcao"
								name="funcao" class="form-control">

								<option value="" disabled
									<c:out value="${not empty funcao ? '' : 'selected'}" />>
									Selecione uma função</option>
								<option value="admin" <c:out value="${funcao == 'admin' ? 'selected' : ''}" />>Administrador</option>
								<option value="manager" <c:out value="${funcao == 'manager' ? 'selected' : ''}" />>Gerente</option>
								<option value="user" <c:out value="${funcao == 'user' ? 'selected' : ''}" />>Operador</option>
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


		<c:set var="list" value="${dao.listAll()}" />

		<c:if test="${not empty	list}">

			<div class="card col-sm-12 col-md-8 mt-5 mb-5">
				<div class="card-body">
					<h5 class="card-title">Lista de Usuários:</h5>
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

						<c:forEach var="item" items="${list}">

							<tr>
								<th scope="row">${item.id}</th>
								<td>${item.nome}</td>
								<td>${item.login}</td>
								<td>${item.funcao}</td>
								<td>
									<button class="btn btn-primary" alt="Editar" title="Editar"
										onclick="editar(${item.id})">Editar</button>
									<button class="btn btn-danger" onclick="remover(${item.id})">Deletar</button>
									<button class="btn btn-info">Info</button>
								</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>

			</div>

		</c:if>

	</div>


	<!-- importação do jquery: para fazer querys -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<!-- importação do estilo via bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<!-- script: onde vai o código -->
	<script>
		function remover(id) {

			if (confirm("Tem certeza que deseja deletar esse registro?")) {
				document.location = "?opt=delete&id=" + id;
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