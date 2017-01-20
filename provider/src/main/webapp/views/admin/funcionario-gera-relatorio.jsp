<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Relatório por Funcionários</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="relatorioPorFuncionario" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Relatório por Funcionário</legend>
			<div class="control-group">
				<label class="control-label">Funcionário</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoFuncionario"
						name="nomeDoFuncionario">
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>		
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Gerar <i class="fa fa-spinner fa-spin fa-lg"></i></button>
					<a class="btn btn-primary" href="homePage" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>