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
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<div class="container">
		<legend>Lista de Tarefas</legend>
		<a href="addTarefa?id=${idProjeto}"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></a></i>
		
		<table id="table"
				data-toggle="table"
               data-show-columns="true"
               data-show-toggle="true"
               data-show-pagination-switch="true"
               data-search="true"
               data-pagination="true"
               data-key-events="true">
            <thead>   
				<tr>
					<th>Id</th>
					<th>Descrição da Tarefa</th>
					<th>Observações</th>
					<th>Responsável da Tarefa</th>
					<th>Status da Tarefa</th>
					<th>Ações</th>
				</tr>
			</thead>
			<c:forEach var="tarefa" items="${tarefas}">
				<tr>
					<td>${tarefa.idTarefa}</td>
					<td>${tarefa.descricaoTarefa}</td>
					<td>${tarefa.obs}</td>
					<td>${tarefa.responsavelTarefa}</td>
					
					<c:if test="${tarefa.statusTarefa == 'Não iniciada'}">
						<td><img class="ico_status" src="assets/img/ico_red.png"> ${tarefa.statusTarefa}</td>
					</c:if>
					
					<c:if test="${tarefa.statusTarefa == 'Iniciada'}">
						<td><img class="ico_status" src="assets/img/ico_yellow.png"> ${tarefa.statusTarefa}</td>
					</c:if>
					
					<c:if test="${tarefa.statusTarefa == 'Finalizada'}">
						<td><img class="ico_status" src="assets/img/ico_green.png"> ${tarefa.statusTarefa}</td>
					</c:if>
					
					<td><a href="tarefaEdit?id=${tarefa.idTarefa}"><i class="fa fa-pencil-square-o fa-lg"></i></a> | <a
						href="excluirTarefa?id=${tarefa.idTarefa}"><i class="fa fa-trash-o"></i></a></td>
				</tr>
			</c:forEach>
		</table>
		<br /><br /><br /><br /><br /><br /><br /><br />
		<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
</html>