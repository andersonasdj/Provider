<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Home Page</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<h3 align="center">Solicitações</h3>
		<div class="container">
			<legend align="center"><a class="btn btn-danger" href="abertos" role="button"> ${qtdAberto} Abertas <i class="fa fa-question-circle"></i></a>
			 - <a class="btn btn-info" href="andamento" role="button">${qtdAndamento} Em Andamento <i class="fa fa-share"></i></a>
			 - <a class="btn btn-warning" href="agendados" role="button">${qtdAgendado} Agendadas <i class="fa fa-clock-o"></i></a>
			 - <a class="bnt btn-link" href="#" role="button">Total de ${qtdTotal} solicitações</a></legend>
		</div>
		<br/><br/>
	<table class="table table-striped table-bordered">
		<tr>
			<th>Data da Solicitação</th>
			<th>Usuário Afetado</th>
			<th>Status da Solicitação</th>
		</tr>
		<c:forEach var="solicitacao" items="${solicitacoes}">
			<tr>
				<td><f:formatDate value="${solicitacao.dataAbertura.time}"
						pattern="dd/MM/yyyy" /></td>
				<td>${solicitacao.usuario}</td>
				<td>${solicitacao.status}</td>
			</tr>
		</c:forEach>
	</table>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
</html>