<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Relatório</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="relatorioPorData" method="get" class="form-horizontal container">
		<fieldset>
			<legend>Relatório</legend>
				<div align="center">
					<div id="botoesRelatorio">
						<br/><br/>
						<p><a class="btn btn-info" href="relatorioHoje" role="button"> Aberto Hoje ${solicitacoes}</a>
						<a class="btn btn-info" href="finalizadoHoje" role="button"> Finalizados Hoje ${finalizados}</a>
						<a class="btn btn-info" href="relatorioPeriodoAbertura" role="button"> Por Período Abertura</a>
						<a class="btn btn-info" href="relatorioPeriodoFechamento" role="button"> Por Período Fechamento</a></P><br/><br/>
						<P><a class="btn btn-info" href="relatorioSelect" role="button">Por Cliente </a>
						<a class="btn btn-info" href="relatorioSelectTec" role="button">Por Tecnico </a>
						<a class="btn btn-info" href="relatorioPalavra" role="button">Por Palavra chave </a>
						<a class="btn btn-info" href="relatorioGeral" role="button"> Não finalizadas</a></p>
					</div>
					<br/>
				</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/calendario.js"></script>
</html>