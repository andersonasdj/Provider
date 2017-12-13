<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Solicita��o de Suporte</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>	
	<br /><br /><br />
	<form action="salvarSolicitacao" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Solicita��o de Suporte</legend>
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<input id="cliente" name="cliente_id" type="text" value="${clienteLogado.nome}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input id="dataAbertura" name="dataAbertura" type="hidden" value="<%= Calendar.getInstance()%>" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input id="cliente.id" name="cliente.id" type="hidden" value="${clienteLogado.id}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario</label>
				<div class="controls">
					<input id="nome" name="usuario" type="text" placeholder="usuario" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Problema</label>
				<div class="controls">
					<input id="descricaoProblema" name="descricaoProblema" type="text" placeholder="problema" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-primary">Salvar</button>
				</div>
			</div>
		</fieldset>
	</form>
	<br/><br/><br/>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>