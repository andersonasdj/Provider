<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Formulario de CheList</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<form action="salvarChecklist" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Criação de CheckList</legend>
			<div class="control-group">
				<label class="control-label">CheckList para o Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeCliente"
						name="nomeCliente">
						<option></option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Número do CheckList</label>
				<div class="controls">
					<input id="numeroChecklist" name="numeroChecklist" type="text" placeholder="Numero do CheckList"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Título do CheckList</label>
				<div class="controls">
					<input id="tituloChecklist" name="tituloChecklist" type="text" placeholder="Nome do CheckList"
						class="input-xlarge" required>
						<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Responsável do CheckList</label>
				<div class="controls">
					<select class="selectpicker" id="nomeResponsavel"
						name="nomeResponsavel">
						<option></option>
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar</button>
					<a class="btn btn-primary" href="listarCheckLists" role="button">Voltar</a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>