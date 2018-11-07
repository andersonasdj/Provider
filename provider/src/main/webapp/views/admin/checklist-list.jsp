<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
	<title>ProviderOne | Checklist</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<div class="container">
		<legend>Checklists</legend>
		<a href="checklistForm"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></a></i>
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
					<th>Numero</th>
					<th>Nome do Cliente</th>
					<th>Título Checklist</th>
					<th>Data de Criação</th>
					<th>Responsável do CheckList</th>
					<th>Ações</th>
				</tr>
			</thead>
			<c:forEach var="checklist" items="${checklists}">
				<tr>
					<td>${checklist.numeroChecklist}</td>
					<td>${checklist.nomeCliente}</td>
					<td>${checklist.tituloChecklist}</td>
					<td><f:formatDate value="${checklist.dataCriacao.time}"
							pattern="dd/MM/yyyy" /></td>
					<td>${checklist.nomeResponsavel}</td>
					
					
					<td><a href="checklistEdit?id=${checklist.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> | <a
						href="excluirChecklist?id=${checklist.id}"><i class="fa fa-trash-o"></i></a> |
						<a href="listarTarefas?id=${checklist.id}"><i class="fa fa-tasks" aria-hidden="true"></i></a>
					</td>
				</tr>
			</c:forEach>
		</table>
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