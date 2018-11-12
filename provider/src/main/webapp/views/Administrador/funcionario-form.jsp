<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Formulario de Usuário</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<form action="gravaFuncionario" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Criação de Funcionário</legend>
			<p class="pull-right">
				<a href="funcionariosList"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text" placeholder="Nome do Funcionário"
						class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuário</label>
				<div class="controls">
					<input id="nome" name="usuario" type="text" placeholder="Usuario de acesso ao Sistema"
						class="input-xlarge" required> <i class="fa fa-user fa-lg"> </i>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input id="nome" name="senha" type="text" placeholder="Senha de acesso ao Sistema"
						class="input-xlarge" required> <i class="fa fa-lock fa-lg"> </i>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Função </label>
				<div class="controls">
					<select class="selectpicker" id="nome" name="funcao">
						<option>Tecnico</option>
						<option>Administrador</option>
						<option>Supervisor</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="nome" name="email" type="text" placeholder="E-mail do Funcionário"
						class="input-xlarge" required> <i class="fa fa-at fa-lg"> </i>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Celular</label>
				<div class="controls">
					<input id="celular" name="celular" type="text" placeholder="Celular do Funcionário"
						class="input-xlarge" required> <i class="fa fa-mobile fa-lg" aria-hidden="true"></i>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="homePage" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>