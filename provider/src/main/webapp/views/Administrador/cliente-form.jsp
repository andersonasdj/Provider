<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Formulario de Cliente</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<form action="gravarCliente" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Cadastro de Cliente</legend>
			<p class="pull-right">
				<a href="clientesList"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></a></i>
			</p>
			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text" placeholder="Nome do Cliente"
						class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario de Acesso ao Sistema</label>
				<div class="controls">
					<input id="nome" name="usuario" type="text" placeholder="Usuario de Acesso"
						class="input-xlarge" required> <i class="fa fa-user fa-lg"> </i>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Senha de Acesso ao Sistema</label>
				<div class="controls">
					<input id="nome" name="senha" type="text" placeholder="Senha de Acesso"
						class="input-xlarge" required> <i class="fa fa-lock fa-lg"> </i>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Red Flag</label>
				<div class="controls">
			      <input id="redFlag" name="redFlag" type="checkbox" class="form-check-input">
				</div>	
			</div>
				<div class="control-group">
				<label class="control-label">Vip</label>
				<div class="controls">
			      <input id="vip" name="vip" type="checkbox" class="form-check-input">
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
				<label class="control-label">Responsável Técnico</label>
				<div class="controls">
					<input id="responsavelTecnico" name="responsavelTecnico" type="text" placeholder="Responsavel Técnico"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">E-mail do Responsável Técnico</label>
				<div class="controls">
					<input id="nome" name="email" type="text" placeholder="email"
						class="input-xlarge"> <i class="fa fa-at fa-lg"> </i>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telefone</label>
				<div class="controls">
					<input id="telefone1" name="telefone1" type="text" placeholder="Telefone"
						class="input-xlarge"> <i class="fa fa-fax fa-lg"> </i>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Endereço</label>
				<div class="controls">
					<input id="nome" name="endereco" type="text" placeholder="Endereço do Cliente"
						class="input-xlarge">
				</div>
			</div>
			
			</div>
				<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status" name="status">
						<option>Ativo</option>
						<option>Inativo</option>		
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="clientesList" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
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