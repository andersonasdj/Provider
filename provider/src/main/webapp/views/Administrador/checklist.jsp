<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="../assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="../assets/css/bootstrap-table.css">
	<title>ProviderOne | Checklist</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<div class="container">
		<legend>Checklists</legend>
		<p class="pull-right">
			<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
		</p>
		<form action="listarCheckListsCliente" method="post" class="form-horizontal container">
			<fieldset>
				<div class="control-group">
					<label class="control-label">Cliente</label>
					<div class="controls">
						<select class="selectpicker" id="nomeDoCliente"
							name="nomeDoCliente">
							<c:forEach var="cliente" items="${clientes}">
								<option>${cliente.nome}</option>
							</c:forEach>
							<option>Padrão</option>
						</select>
						<button  class="btn btn-success">Avançar <i class="fa fa-arrow-right fa-lg"></i></button>
					</div>
				</div>
			</fieldset>
		</form>		
		<br /><br /><br /><br /><br /><br /><br /><br />
		<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
</body>
</html>