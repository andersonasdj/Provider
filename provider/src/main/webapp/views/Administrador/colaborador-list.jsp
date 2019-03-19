<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ProviderOne | Relatório</title>
<link rel="shortcut icon" href="assets/img/ico.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<form action="gerarRelatorioPalavra" method="get"
		class="form-horizontal container">
		<fieldset></fieldset>
			<legend>Lista de Colaboradores - ${clienteId}</legend>
			
			<a href="colaboradorForm?id=${clienteId}"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i></a>
			<p class="pull-right">
				<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			
			<div class="control-group">
				<label class="control-label">Colaboradores</label>
				<div class="controls">
					<select class="selectpicker" id="funcionarioCliente"
						name="funcionarioCliente">
						<option>${cliente.funcionarioCliente.nome}</option>
						<c:forEach var="funcionarioCliente" items="${funcionariosCliente}">
							<option>${funcionarioCliente.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-primary" href="homePage" role="button">Editar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</form>
		<br />
	<c:import url="rodape.jsp"></c:import>
</body>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/js/jquery.ui.timepiker.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/calendario.js"></script>
</html>