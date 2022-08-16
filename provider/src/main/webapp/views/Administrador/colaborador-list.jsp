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

		<div id="toolbar">
	            <select class="form-control">
	               	<option value="">Exportação básica</option>
	                <option value="all">Exportar todos</option>
	                <option value="selected">Exportar Selecionados</option>
	            </select>
	    </div>
		<table id="table"
				data-toggle="table"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-pagination="true"
	               data-show-pagination-switch="true"
	               data-search="true"
	               data-key-events="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
            <thead>   
				<tr>
					<th data-field="state" data-checkbox="true"></th>
					<th>Nome</th>
					<th>Celular</th>
					<th>Cargo</th>
					<th>E-mail</th>
					<th>Ações</th>
				</tr>
			</thead>
			<c:forEach var="funcionarioCliente" items="${funcionariosCliente}">
				<tr class="clientesTr">
					<td></td>
					<td>${funcionarioCliente.nome}</td>
					<td>${funcionarioCliente.celular}</td>
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
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
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