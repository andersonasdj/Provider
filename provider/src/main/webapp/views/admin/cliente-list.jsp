<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
	<script src="assets/js/ga.js"></script>
	<title>ProviderOne | Lista de Clientes</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<div class="container">
		<legend>Lista de Clientes</legend>
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
					<th>Id</th>
					<th>Nome</th>
					<th>Usuario</th>
					<th>E-mail</th>
					<th>Endereco</th>
					<th>Data de Atualização</th>
					<th>Ações</th>
				</tr>
			</thead>
			<c:forEach var="cliente" items="${clientes}">
				<tr>
					<td>${cliente.id}</td>
					<td><a href="relatorioPorCliente?nomeDoCliente=${cliente.nome}">${cliente.nome}</a></td>
					<td>${cliente.usuario}</td>
					<c:if test="${not empty cliente.email}">
						<td>${cliente.email}</td>
					</c:if>
					<c:if test="${empty cliente.email}">
						<td>Não cadastrado</td>
					</c:if>
					<td>
						<a class="dcontexto"> ${cliente.endereco}
							<span>Tel.: ${cliente.telefone1} <br>
								Tel.: ${cliente.telefone2}
							</span></a>
					</td>
					<td><f:formatDate value="${cliente.dataAtualizacao.time}"
							pattern="dd/MM/yyyy" /></td>
					<td><a href="clienteEdit?id=${cliente.id}">Editar</a> <!--  <a
						href="removeCliente?id=${cliente.id}">Excluir</a>--></td>
				</tr>
			</c:forEach>
		</table>
		<br /><br /><br /><br /><br /><br /><br /><br />
		<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>