<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Perif�ricos</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<legend>Lista de Perif�ricos</legend>
		<table class="table table-condensed">
			<tr>
				<th>Modelo de Processador</th>
				<th>Fam�lia Processador</th>
				<th>Tipo de Processador</th>
				<th>Marca de Computador</th>
				<th>Tamanhos de Mem�ria</th>
				<th>Tamanhos de HD</th>
				<th>Sistema Operacional</th>
				<th>Microsoft Office</th>
				<th>Anti V�rus</th>
				<th>Fun��o</th>
			</tr>
			<c:forEach var="periferico" items="${perifericos}">
				<tr>
					<td>${periferico.modeloProcessador}</td>
					<td>${periferico.familia}</td>
					<td>${periferico.tipoProcessador}</td>
					<td>${periferico.marcaComputador}</td>
					<td>${periferico.qtdMemoria}</td>
					<td>${periferico.qtdHd}</td>
					<td>${periferico.sistemaOperacionalInstalado}</td>
					<td>${periferico.officeInstalado}</td>
					<td>${periferico.antiVirus}</td>
					<td><a href="perifericoEdit?id=${periferico.id}">Editar</a></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/><br/><br/>
	<legend></legend>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>