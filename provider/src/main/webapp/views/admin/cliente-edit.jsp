<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Edição de Cliente</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br /><br />
	<form action="atualizarCliente" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Atualização de Cliente</legend>
			<div>
				<div>
					<input id="id" name="id" type="hidden"
						value="${cliente.id}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text"
						value="${cliente.nome}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario de Acesso ao Sistema</label>
				<div class="controls">
					<input id="nome" name="usuario" type="text" placeholder="Usuario de Acesso"
						value="${cliente.usuario}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Senha de Acesso ao Sistema</label>
				<div class="controls">
					<input id="nome" name="senha" type="password" placeholder="Senha de Acesso"
						value="${cliente.senha}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">CNPJ</label>
				<div class="controls">
					<input id="cnpj" name="cnpj" type="text" placeholder="Cnpj"
						value="${cliente.cnpj}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Razão Social</label>
				<div class="controls">
					<input id="razaoSocial" name="razaoSocial" type="text" placeholder="Razão Social"
						value="${cliente.razaoSocial}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Responsável Técnico</label>
				<div class="controls">
					<input id="responsavelTecnico" name="responsavelTecnico" type="text" placeholder="Responsavel Técnico"
						value="${cliente.responsavelTecnico}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">E-mail do Responsável Técnico</label>
				<div class="controls">
					<input id="nome" name="email" type="text" placeholder="email"
						value="${cliente.email}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telefone 1</label>
				<div class="controls">
					<input id="telefone1" name="telefone1" type="text" placeholder="Telefone 1"
						value="${cliente.telefone1}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telefone 2</label>
				<div class="controls">
					<input id="telefone2" name="telefone2" type="text" placeholder="Telefone 2"
						value="${cliente.telefone2}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Endereço</label>
				<div class="controls">
					<input id="nome" name="endereco" type="text"
						value="${cliente.endereco}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Latitude</label>
				<div class="controls">
					<input id="latitude" name="latitude" type="text"
						value="${cliente.latitude}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Longitude</label>
				<div class="controls">
					<input id="longitude" name="longitude" type="text"
						value="${cliente.longitude}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar</button>
					<a class="btn btn-danger" href="#" role="button">Excluir</a>
					<a class="btn btn-primary" href="clientesList" role="button">Voltar</a>
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