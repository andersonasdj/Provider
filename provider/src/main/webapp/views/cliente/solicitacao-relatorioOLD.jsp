<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="assets/img/ico.png">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<title>ProviderOne | Relatório</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br />
	<br />
	<br />
	<legend align="center">Relatório de Solicitações</legend>

	<table class="table table-striped table-bordered">
		<tr>
			<th>Data da Solicitação</th>
			<th>Usuário Afetado</th>
			<th>Problema Ralatado</th>
			<th>Status da Solicitação</th>
			<th>Ações</th>
		</tr>

		<c:forEach var="solicitacao" items="${solicitacoes}">
			<tr>
				<td><f:formatDate value="${solicitacao.dataAbertura.time}"
						pattern="dd/MM/yyyy" /></td>
				<td>${solicitacao.usuario}</td>
				<td>${solicitacao.descricaoProblema}</td>
				<td>${solicitacao.status}</td>
				<td><a href="solicitacaoEditCliente?id=${solicitacao.id}">Ver</a>
			</tr>
		</c:forEach>
	</table>

	<br />
	<br />
	<c:import url="rodape.jsp"></c:import>
</body>
</html>