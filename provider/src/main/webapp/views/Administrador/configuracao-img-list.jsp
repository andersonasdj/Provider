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
	<div class="container">
		<legend align="center">Configuração de caminho raiz de imagens</legend>
		<p class="pull-left">
			<a href="config"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
		</p>
		<table id="table" data-toggle="table">
	        <thead>
			<tr>
				<th>Id</th>
				<th>Caminho raiz de imagem no servidor</th>
				<th>Opções</th>
			</tr>
			</thead>
			<c:forEach var="sistema" items="${sistemas}">
				<tr>
					<td>${sistema.id}</td>
					<td>${sistema.caminho}</td>
					<td>
						<a href="editConfigImg?id=${sistema.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a>
						<a href="javascript:func()" onclick="confirmacao('${sistema.id}')"><i class="fa fa-trash-o"></i></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/><br/><br/>
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
		     var resposta = confirm("Deseja remover essa configuração de id: " + id + " ?");
		     if (resposta == true) {
		          window.location.href = "removeConfigImg?id="+id;
		     }
		}
	</script>
</html>