<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Configurações</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<legend align="center">Configuração de caminho raiz de imagens</legend>
		<table id="table"
	               data-toggle="table">
	        <thead>
			<tr>
				<th>Id</th>
				<th>Caminho</th>
				<th>Opções</th>
			</tr>
			</thead>
			<c:forEach var="sistema" items="${sistemas}">
				<tr>
					<td>${sistema.id}</td>
					<td>${sistema.caminho}</td>
					
					<td><a href="editConfigImg?id=${sistema.id}">Editar</a> <!-- <a
						href="removeFuncionario?id=${funcionario.id}">Excluir</a> --></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/><br/><br/>
	<legend></legend>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
</html>