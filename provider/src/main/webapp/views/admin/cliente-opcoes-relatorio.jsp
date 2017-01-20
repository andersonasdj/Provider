<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Relatório por Cliente</title>	
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="relatorioPorCliente" method="post" class="form-horizontal container">
		<fieldset>
			<legend align="right">${nomeDoCliente}</legend>			
			<div>
				<h4 align="center">Relatório de solicitações</h4>
				<h4>Total de solicitações: ${qtdSolicitacoes}</h4>		
			</div>
			<br/>
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-success" href="relatorioPorCliente?nomeDoCliente=${nomeDoCliente}" role="button">Gerar <i class="fa fa-spinner fa-spin fa-lg"></i></a>
				</div>
			</div>
			
			<legend></legend>
			
			<div>
				<h4 align="center">Parque de máquinas</h4>
				<h4>Total de estações: ${qtdComputador}</h4>		
			</div>
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-success" href="computadorListCliente?nomeDoCliente=${nomeDoCliente}" role="button">Gerar <i class="fa fa-spinner fa-spin fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
			
			<div>
				<h4 align="center">Lista de Projetos</h4>
				<h4>Total de projetos: </h4>		
			</div>
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-success" href="computadorListCliente?nomeDoCliente=${nomeDoCliente}" role="button">Gerar <i class="fa fa-spinner fa-spin fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
			
			<a class="btn btn-primary" href="relatorioSelect" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>