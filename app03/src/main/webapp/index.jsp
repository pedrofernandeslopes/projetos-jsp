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
	<div class="container">
		<div class="card col-sm-12 col-md-8 mt-5">
			<div class="card-body">
				<h5 class="card-title">Cadastro de Usuário</h5>
				<div>
					<form onsubmit="return validateForm1();" action="parametros.jsp" method="post" accept-charset="utf-8">
					
						<div class="form-group">
							<label for="nome">Nome: </label> <input id="nome" name="nome"
								type="text" maxlength="10" class="form-control" />
						</div>
						<div class="form-group">
							<label for="login">Login: </label> <input id="login" name="login"
								type="text" class="form-control" />
							<div class="valid-feedback">Looks good!</div>

						</div>
						<div class="form-group">
							<label for="funcao">Função: </label> <select id="funcao"
								name="funcao" class="form-control">
								<option value="" disabled selected>Selecione uma função</option>
								<option value="admin">Administrador</option>
								<option value="manager">Gerente</option>
								<option value="user">Operador</option>
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
		<div class="card col-sm-12 col-md-8 mt-5">
			<div class="card-body">
				<h5 class="card-title">Lista de Usuários</h5>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Nome</th>
						<th scope="col">Login</th>
						<th scope="col">Função</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Larry</td>
						<td>the Bird</td>
						<td>@twitter</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<script>
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
		
		
		function validateForm1() {
			let valid = true;
			
			clearForm();
			
			if ($('#nome').val() == '') {
				$('#nome').after(
			     '<div class="invalid-feedback"> O campo "Nome" não pode ser vazio! </div>');
				$('#nome').addClass('is-invalid');
				valid = false;
			}
			
			if ($('#login').val() == '') {
				$('#login').after(
			     '<div class="invalid-feedback"> O campo "Login" não pode ser vazio! </div>');
				$('#login').addClass('is-invalid');
				valid = false;
			}
			
			if ($('#funcao').val() == null) {
				$('#funcao').after(
			     '<div class="invalid-feedback"> O campo "Função" não pode ser vazio! </div>');
				$('#funcao').addClass('is-invalid');
				valid = false;
			}
			return valid;
		}
		
		function clearForm() {
			$('.invalid-feedback').remove();
			$('#nome').removeClass('is-invalid');
			$('#login').removeClass('is-invalid');
			$('#funcao').removeClass('is-invalid');
		}
	</script>
</body>
</html>