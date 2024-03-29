<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/><br/>
	<form action="atualizar" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Atualização de Funcionario</legend>
			<div>
				<div>
					<input id="id" name="id" type="hidden"
						value="${funcionario.id}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text"
						value="${funcionario.nome}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario</label>
				<div class="controls">
					<input id="usuario" name="usuario" type="text"
						value="${funcionario.usuario}" class="input-xlarge" required>
						<i class="fa fa-user fa-lg"> </i>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<a class="btn" href="atualizarSenhaFuncionario?id=${funcionario.id}" role="button">Alterar</a>
					<input type="hidden" id="senha" name="senha" value="${funcionario.senha}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Função </label>
				<div class="controls">
					<select class="selectpicker" id="funcao" name="funcao">
						<option>${funcionario.funcao}</option>
						<c:if test="${funcionario.funcao == 'Tecnico'}">
							<option>Administrador</option>
						</c:if>
						<c:if test="${funcionario.funcao == 'Administrador'}">
							<option>Tecnico</option>
						</c:if>		
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="email" name="email" type="text"
						value="${funcionario.email}" class="input-xlarge" required>
						<i class="fa fa-at fa-lg"> </i>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
				<div class="control-group">
				<label class="control-label">Celular</label>
				<div class="controls">
					<input id="celular" name="celular" type="text"
						value="${funcionario.celular}" class="input-xlarge">
						<i class="fa fa-mobile fa-lg" aria-hidden="true"></i>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status" name="status">
						<option>${funcionario.status}</option>
						
						<c:if test="${funcionario.status == 'Ativo'}">
							<option>Inativo</option>
						</c:if>
						<c:if test="${funcionario.status == 'Inativo'}">
							<option>Ativo</option>
						</c:if>		
						
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Status MFA</label>
				<div class="controls">
					<select class="selectpicker" id="statusMfa" name="statusMfa">
						<option>${funcionario.statusMfa}</option>
						
						<c:if test="${funcionario.statusMfa == true}">
							<option>false</option>
						</c:if>
						<c:if test="${funcionario.statusMfa == false}">
							<option>true</option>
						</c:if>		
						
					</select>
				</div>
			</div>
			<input id="caminhoFoto" name="caminhoFoto" type="hidden" value="${funcionario.caminhoFoto}">
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar</button>
					<a class="btn btn-primary" href="funcionariosList" role="button">Voltar</a>
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