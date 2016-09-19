<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<title>ProviderOne | Formulario de Fornecedor</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<form action="gravarFornecedor" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Cadastro de Fornecedor</legend>
			<div class="control-group">
				<label class="control-label">Nome do Fornecedor</label>
				<div class="controls">
					<input id="nome" name="nome" type="text" placeholder="Nome do Fornecedor"
						class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">CNPJ</label>
				<div class="controls">
					<input id="cnpj" name="cnpj" type="text" placeholder="Cnpj"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Razão Social</label>
				<div class="controls">
					<input id="razaoSocial" name="razaoSocial" type="text" placeholder="Razão Social"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Produto</label>
				<div class="controls">
					<input id="produto" name="produto" type="text" placeholder="Produto"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Responsável Técnico</label>
				<div class="controls">
					<input id="responsavelTecnico" name="responsavelTecnico" type="text" placeholder="Responsavel Técnico"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">E-mail do Responsável Técnico</label>
				<div class="controls">
					<input id="nome" name="email" type="text" placeholder="E-mail"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telefone 1</label>
				<div class="controls">
					<input id="telefone1" name="telefone1" type="text" placeholder="Telefone 1"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telefone 2</label>
				<div class="controls">
					<input id="telefone2" name="telefone2" type="text" placeholder="Telefone 2"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Endereço</label>
				<div class="controls">
					<input id="nome" name="endereco" type="text" placeholder="Endereço do Cliente"
						class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
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
</html>