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
		<legend>
			<c:if test="${not empty tarefas}">
				<p class="pull-right">
					${tarefas.get(idTarefa).checklist.tituloChecklist}
				</p>
				<p class="pull-left">
					Tarefas da CheckList
				</p>
				<p align="center">
				${tarefas.get(idTarefa).checklist.nomeCliente}
				</p>
			</c:if>
		</legend>
		<a href="addTarefa?id=${idChecklist}"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i></a>
		<p class="pull-right">
			<a href="listarCheckLists"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
		</p>
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
					<th>Descrição da Tarefa</th>
					<th>Observações</th>
					<th>Anexos</th>
					<th>Responsável da Tarefa</th>
					<th>Ações</th>
				</tr>
			</thead>
			<c:forEach var="tarefa" items="${tarefas}">
				<tr>
					<td>${tarefa.numero}</td>
					<td>${tarefa.descricaoTarefa}</td>
					<td>${tarefa.obs}</td>
					<c:if test="${tarefa.caminhoAnexo != null}">
						<td><a href="download?idTarefa=${tarefa.idTarefa}&idChecklist=${idChecklist}"><i class="fa fa-paperclip fa-lg" aria-hidden="true"></i></a></td>
					</c:if>
					
					<c:if test="${tarefa.caminhoAnexo == null}">
						<td><a href="uploadAnexo?idTarefa=${tarefa.idTarefa}&idChecklist=${idChecklist}"><i class="fa fa-cloud-upload" aria-hidden="true"></i></a></td>
					</c:if>
					<td>${tarefa.responsavelTarefa}</td>
					
					<td>
						<a href="tarefaEdit?id=${tarefa.idTarefa}"><i class="fa fa-pencil-square-o fa-lg"></i></a> | 
						<a href="javascript:func()" onclick="confirmacao('${tarefa.idTarefa}')"><i class="fa fa-trash-o"></i></a>
					</td>
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
	<script>
		function confirmacao(id) {
		     var resposta = confirm("Deseja remover essa Tarefa ?");
		     if (resposta == true) {
		          window.location.href = "excluirTarefa?id="+id;
		     }
		}
	</script>
</html>