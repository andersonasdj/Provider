<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<title>ProviderOne | Dados</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br /><br />
	
	<form action="atualizarCadastroCliente" method="post"
		class="form-horizontal container">
		<fieldset>

			<!-- TITULO -->
			<legend>Atualização de cadastro</legend>

			<!-- ID-->
			<div>
				<div>
					<input id="id" name="id" type="hidden"
						value="${clienteLogado.id}">
				</div>
			</div>

			<!-- NOME-->
			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text"
						value="${clienteLogado.nome}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>

			<!-- USUARIO -->
			<div class="control-group">
				<label class="control-label">Usuario</label>
				<div class="controls">
					<input id="nome" name="usuario" type="text"
						value="${clienteLogado.usuario}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>

			<!-- SENHA -->
			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input id="nome" name="senha" type="password"
						value="${clienteLogado.senha}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>

			<!-- E-MAIL -->
			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="nome" name="email" type="text"
						value="${clienteLogado.email}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>

			<!-- BOTÃO SALVAR -->
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-primary">Salvar</button>
				</div>
			</div>
		</fieldset>
	</form>
	
	<c:import url="rodape.jsp"></c:import>
</body>
</html>