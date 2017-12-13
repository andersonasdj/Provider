<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Fornecedores</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<div class="container">
		<legend>Lista de Fornecedores</legend>
		<table class="table table-condensed">
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>CNPJ</th>
				<th>Razão Social</th>
				<th>Endereco</th>
				<th>Responsável Técnico</th>
				<th>E-mail do Responsável Técnico</th>
				<th>Ações</th>
			</tr>
			<c:forEach var="fornecedores" items="${fornecedores}">
				<tr>
					<td>${fornecedores.id}</td>
					<td>${fornecedores.nome}</td>
					<td>${fornecedores.cnpj}</td>
					<td>${fornecedores.razaoSocial}</td>
					<td>
						<a class="dcontexto"> ${fornecedores.endereco}
							<span>Tel.: ${fornecedores.telefone1} <br>
								Tel.: ${fornecedores.telefone2}
							</span></a>		
					</td>
					<td>${fornecedores.responsavelTecnico}</td>
					<c:if test="${not empty fornecedor.email}">
						<td>${fornecedores.email}</td>
					</c:if>
					<c:if test="${empty fornecedor.email}">
						<td>Não cadastrado</td>
					</c:if>
					<td><a href="fornecedorEdit?id=${fornecedores.id}">Editar</a> <!--  <a
						href="removeCliente?id=${fornecedor.id}">Excluir</a>--></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/><br/><br/><br/><br/><br/><br/>
		<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>