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
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<title>ProviderOne | Periféricos</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<legend>Lista de Periféricos</legend>
		<table class="table table-condensed">
			<tr>
				<th>Modelo de Processador</th>
				<th>Família Processador</th>
				<th>Tipo de Processador</th>
				<th>Marca de Computador</th>
				<th>Tamanhos de Memória</th>
				<th>Tamanhos de HD</th>
				<th>Sistema Operacional</th>
				<th>Microsoft Office</th>
				<th>Anti Vírus</th>
				<th>Função</th>
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
					<td><a href="perifericoEdit?id=${periferico.id}">Editar</a> <!-- <a
						href="removeFuncionario?id=${funcionario.id}">Excluir</a> --></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/><br/><br/>
	<legend></legend>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>