<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<br />
	<br />
	<br />
	<form action="gerarRelatorioId" method="post"
		class="form-horizontal container">
		<fieldset></fieldset>
			<legend>Relatório por ID</legend>
				
					<div class="control-group">
						<label class="control-label">ID da Solicitação</label>
						<div class="controls">
							<input id="id" name="id" type="text"
								placeholder="ID" class="input-xlarge" required>
							<p class="help-block">* Campo Obrigatório</p>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label"></label>
						<div class="controls">
							<button id="buscar" class="btn btn-success">
								Buscar <i class="fa fa-search"></i>
							</button>
						</div>
					</div>

				</form>
				<br />
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/js/jquery.ui.timepiker.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/calendario.js"></script>
</html>