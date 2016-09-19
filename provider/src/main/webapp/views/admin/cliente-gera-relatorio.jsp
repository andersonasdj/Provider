<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<title>ProviderOne | Relatório por Cliente</title>	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="relatorioOpcoes" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Relatório por Cliente</legend>
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente">
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>				
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-primary" href="homePage" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
					<button  class="btn btn-success">Avançar <i class="fa fa-arrow-right fa-lg"></i></button>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>