<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Relatório</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="relatorioPorData" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Relatório</legend>
				<div align="center">
					<div id="">
						<br/><br/>
						<p><a class="btn btn-info" href="relatorioHoje" role="button"> Aberto Hoje ${solicitacoes}</a>
						<a class="btn btn-info" href="finalizadoHoje" role="button"> Finalizados Hoje ${finalizados}</a>
						<a class="btn btn-info" href="atualizadoHoje" role="button"> Atualizados Hoje </a>
						<a class="btn btn-info" href="relatorioPeriodoAbertura" role="button"> Por Período Abertura</a>
						<a class="btn btn-info" href="relatorioPeriodoFechamento" role="button"> Por Período Fechamento</a>
						<a class="btn btn-info" href="relatorioId" role="button"> Por ID</a></P><br/><br/>
						<P><a class="btn btn-info" href="relatorioSelect" role="button">Por Cliente </a>
						<a class="btn btn-info" href="relatorioSelectTec" role="button">Por Tecnico </a>
						<a class="btn btn-info" href="relatorioPalavra" role="button">Por Palavra chave </a>
						<a class="btn btn-info" href="relatorioGeral" role="button"> Não finalizadas</a>
						<a class="btn btn-info" href="relatorioAgendamento" role="button"> Gerar Agendamento</a></p>
					</div>
					<br/>
				</div>
			<legend></legend>
				<table id="table" class="table table-striped"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-search="true"
	               data-key-events="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
				<thead>
				<tr class="" align="center">
					<th data-field="nome" data-sortable="true">Nome</th>
					<th data-field="qtdAberto" data-sortable="true">Quantidade Aberto</th>
					<th data-field="qtdAndamento" data-sortable="true">Quantidade Andamento</th>
					<th data-field="qtdAgendado" data-sortable="true">Quantidade Agendado</th>
					<th data-field="qtdAguardando" data-sortable="true">Quantidade Aguardando</th>
					<th data-field="qtdTotal" data-sortable="true">Total</th>
				</tr>
				</thead>
					<c:forEach var="relatorio" items="${relatorios}">
						<tr class="" align="center">
							<td>${relatorio.nome}</td>
							<td><strong>${relatorio.qtdAberto}</strong></td>	
							<td><strong>${relatorio.qtdAndamento}</strong></td>	
							<td><strong>${relatorio.qtdAgendado}</strong></td>	
							<td><strong>${relatorio.qtdAguardando}</strong></td>	
							<td><strong>${relatorio.qtdTotal}</strong></td>							
						</tr>
					</c:forEach>
			</table>			
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
</html>