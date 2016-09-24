<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Configurações</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<legend align="center">Lista configurações de email cadastrados</legend>
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
				<th>Mensagem do Email</th>
				<th>Assunto do Email</th>
				<th>Usado para</th>
				<th>Servidor SMTP</th>
				<th>Porta SMTP</th>
				<th>Requer autenticação</th>
				<th>Utiliza SSL</th>
				<th>Função</th>
			</tr>
			</thead>
			<c:forEach var="configuracao" items="${configuracoes}">
				<tr>
					<td>${configuracao.email}</td>
					<td>${configuracao.mensagem}</td>
					<td>${configuracao.assunto}</td>
					<td>${configuracao.funcaoDoEmail}</td>
					<td>${configuracao.smtp}</td>
					<td>${configuracao.portaSmtp}</td>
					<td>${configuracao.autenticacao}</td>
					<td>${configuracao.sslStatus}</td>
					<td><a href="editConfigEmail?id=${configuracao.id}">Editar</a> <!-- <a
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