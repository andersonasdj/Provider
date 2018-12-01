<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Tarefas</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<br /><br /><br />
		<legend>
			<c:if test="${not empty tarefas}">
				<p class="pull-right">
					${tarefas.get(idTarefa).checklist.tituloChecklist}
				</p>
				<p class="pull-left">
					Tarefas da CheckList
				</p>
				<p>
					<h3 align="center">${tarefas.get(idTarefa).checklist.nomeCliente}</h3>
				</p>
			</c:if>
		</legend><br/>
		<table class="table" data-toggle="table">
             <thead> 
				<tr>
					<th>Número</th>
					<th>Descrição da Tarefa</th>
					<th>Observações</th>
					<th>Responsável da Tarefa</th>
				</tr>
			</thead>
			<c:forEach var="tarefa" items="${tarefas}">
				<tr>
					<td>${tarefa.numero}</td>
					<td>${tarefa.descricaoTarefa}</td>
					<td>${tarefa.obs}
						<p>
							<b><br/>* ${tarefa.obsComplementares}</b>
						</p>
					</td>
					<td>${tarefa.responsavelTarefa}</td>
				</tr>
			</c:forEach>
		</table>
		<br /><br /><br /><br /><br /><br /><br /><br />
       	<footer class="footer navbar-fixed">
			<h2 align="center"><img src="assets/img/logo_provider.png" ></h2>
		</footer>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
</html>