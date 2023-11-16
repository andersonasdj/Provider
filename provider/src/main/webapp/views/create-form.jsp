<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Criação Administrador</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<br/><br/><br/>
	<form action="gravaAdmin" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Criação Administrador</legend>
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
			<input id="funcao" name="funcao" type="hidden" value="Administrador">
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>