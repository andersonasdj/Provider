<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Formulario de Usu�rio</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<form action="gravaColaborador" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Cria��o de Colaborador  - ${clienteId}</legend>
			<p class="pull-right">
				<a href="funcionariosList"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text" placeholder="Nome do Colaborador"
						class="input-xlarge" required>
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<input type="hidden" name="clienteId" id="clienteId" value="${clienteId}"> 
			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="nome" name="email" type="text" placeholder="E-mail do Colaborador"
						class="input-xlarge" required> <i class="fa fa-at fa-lg"> </i>
					<p class="help-block">* Campo Obrigat�rio</p>
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