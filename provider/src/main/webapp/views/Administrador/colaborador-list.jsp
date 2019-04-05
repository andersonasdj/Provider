<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Lista de Clientes</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<div class="container">
		<legend>Lista de Colaboradores</legend>
		
		<a href="colaboradorForm?id=${clienteId}"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i></a>
				<p class="pull-right">
					<a href="#" onClick="history.go(-1)"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
				</p>

		<table id="table"
				data-toggle="table"
               data-show-columns="true"
               data-show-toggle="true"
               data-show-pagination-switch="true"
               data-show-refresh="true"
               data-search="true"
               data-pagination="true"
               data-key-events="true">
            <thead>   
				<tr>
					<th>Nome</th>
					<th>Cargo</th>
					<th>E-mail</th>
					<th>Ações</th>
				</tr>
			</thead>
			<c:forEach var="funcionarioCliente" items="${funcionariosCliente}">
				<tr class="clientesTr">
					<td>${funcionarioCliente.nome}</td>
					<td>${funcionarioCliente.cargo}</td>
					<td>${funcionarioCliente.email}</td>
					<td><a href="editarColaboradorId?id=${funcionarioCliente.idFuncionario}"><i class="fa fa-pencil-square-o fa-lg"></i></a> 
						| 
						<a href="javascript:func()" onclick="confirmacao('${funcionarioCliente.idFuncionario}')"><i class="fa fa-trash-o"></i></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br /><br />
		<br /><br /><br /><br /><br /><br />
		<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIk8yXYLFzQySXoZoPYVhyNtRwfaJ5a8o"></script>
	<script type="text/javascript" src="assets/js/loader.js"></script>
	<script src="assets/js/mapas.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
		<script>
		function confirmacao(id) {
		     var resposta = confirm("Deseja remover esse Colaborador: " + id + " ?");
		     if (resposta == true) {
		          window.location.href = "removeFuncionarioCliente?id="+id;
		     }
		}
	</script>
</html>