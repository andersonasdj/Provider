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
				<tr class="clientesTr">
					<td>${cliente.id}</td>
					<td><a href="relatorioPorCliente?nomeDoCliente=${cliente.nome}"><span id="nome-cliente">${cliente.nome}</span></a></td>
					
					<td>${cliente.usuario}</td>
					<c:if test="${not empty cliente.email}">
						<td>${cliente.email}</td>
					</c:if>
					<c:if test="${empty cliente.email}">
						<td>Não cadastrado</td>
					</c:if>
					<td>
						<a class="dcontexto"> ${cliente.endereco}
							<span class="dados"><p>Tel.: ${cliente.telefone1}</p>
								<p>Tel.: ${cliente.telefone2} </p>
								<p id="idLatitude" class="ocultar">${cliente.latitude}</p>
								<p id="idLongitude" class="ocultar">${cliente.longitude}</p>
							</span>
						</a>
					</td>
					
					<td><f:formatDate value="${cliente.dataAtualizacao.time}"
							pattern="dd/MM/yyyy" /></td>
					<td><a href="clienteEdit?id=${cliente.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> <!--  <a
						href="removeCliente?id=${cliente.id}">Excluir</a>--></td>
				</tr>
			</c:forEach>
		</table>
		<br /><br />
		<div id="div_mapa"></div>
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
</html>