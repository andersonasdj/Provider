<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Edi��o de Cliente</title>
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
			<legend>Atualiza��o de Cliente</legend>
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
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario de Acesso ao Sistema</label>
				<div class="controls">
					<input id="nome" name="usuario" type="text" placeholder="Usuario de Acesso"
						value="${cliente.usuario}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Senha de Acesso ao Sistema</label>
				<div class="controls">
					<input id="nome" name="senha" type="password" placeholder="Senha de Acesso"
						value="${cliente.senha}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Red Flag</label>
				<div class="controls">
					<c:if test="${cliente.redFlag != false}">
						<input id="redFlag" name="redFlag" type="checkbox" class="form-check-input"
							value="true" class="input-xlarge" checked="checked">
					</c:if>
					<c:if test="${cliente.redFlag != true}">
						<input id="redFlag" name="redFlag" type="checkbox" class="form-check-input"
							value="true" class="input-xlarge">
					</c:if>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Vip</label>
				<div class="controls">
					<c:if test="${cliente.vip != false}">
						<input id="vip" name="vip" type="checkbox" class="form-check-input"
							value="true" class="input-xlarge" checked="checked">
					</c:if>
					<c:if test="${cliente.vip != true}">
						<input id="vip" name="vip" type="checkbox" class="form-check-input"
							value="true" class="input-xlarge">
					</c:if>
				</div>
			</div>
				<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status" name="status">
						<option>${cliente.status}</option>
						
						<c:if test="${cliente.status == 'Ativo'}">
							<option>Inativo</option>
						</c:if>
						<c:if test="${cliente.status == 'Inativo'}">
							<option>Ativo</option>
						</c:if>
						<c:if test="${cliente.status == null}">
							<option>Ativo</option>
							<option>Inativo</option>
						</c:if>			
					</select>
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
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-primary" href="listarColaboradores?id=${cliente.id}" role="button">Lista de Colaboradores</a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Raz�o Social</label>
				<div class="controls">
					<input id="razaoSocial" name="razaoSocial" type="text" placeholder="Raz�o Social"
						value="${cliente.razaoSocial}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Respons�vel T�cnico</label>
				<div class="controls">
					<input id="responsavelTecnico" name="responsavelTecnico" type="text" placeholder="Responsavel T�cnico"
						value="${cliente.responsavelTecnico}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">E-mail do Respons�vel T�cnico</label>
				<div class="controls">
					<input id="nome" name="email" type="text" placeholder="email"
						value="${cliente.email}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telefone</label>
				<div class="controls">
					<input id="telefone1" name="telefone1" type="text" placeholder="Telefone"
						value="${cliente.telefone1}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Endere�o</label>
				<div class="controls">
					<input id="nome" name="endereco" type="text"
						value="${cliente.endereco}" class="input-xlarge">
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