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
		<legend align="center">Lista configurações de email cadastrados</legend>
		<p class="pull-left">
			<a href="config"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
		</p>
		<table id="table"
	               data-toggle="table"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-key-events="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
	        <thead>
			<tr>
				<th>E-Mail</th>
				<th>Mensagem</th>
				<th>Assunto</th>
				<th>Cópia Para</th>
				<th>Usado para</th>
				<th>Servidor SMTP</th>
				<th>Porta SMTP</th>
				<th>Requer autenticação</th>
				<th>SSL</th>
				<th>Função</th>
			</tr>
			</thead>
			<c:forEach var="configuracao" items="${configuracoes}">
				<tr>
					<td>${configuracao.email}</td>
					<td>${configuracao.mensagem}</td>
					<td>${configuracao.assunto}</td>
					<td>${configuracao.cc}</td>
					<td>${configuracao.funcaoDoEmail}</td>
					<td>${configuracao.smtp}</td>
					<td>${configuracao.portaSmtp}</td>
					<td>${configuracao.autenticacao}</td>
					<td>${configuracao.sslStatus}</td>
					<td>
						<a href="editConfigEmail?id=${configuracao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> | 
						<a href="javascript:func()" onclick="confirmacao('${configuracao.id}')"><i class="fa fa-trash-o"></i></a>
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
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script>
		function confirmacao(id) {
		     var resposta = confirm("Deseja remover essa configuração de id: " + id + " ?");
		     if (resposta == true) {
		          window.location.href = "removeConfigEmail?id="+id;
		     }
		}
	</script>
</html>