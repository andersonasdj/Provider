<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
	<title>ProviderOne | Solicitações Abertas</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<h3 align="center">Solicitações</h3>
		<div class="container">
			<legend align="center"><a class="btn btn-danger" href="abertos" role="button"> ${qtdAberto} Abertas <i class="fa fa-question-circle"></i></a>
			 - <a class="btn btn-info" href="andamento" role="button">${qtdAndamento} Em Andamento <i class="fa fa-share"></i></a>
			 - <a class="btn btn-warning" href="agendados" role="button">${qtdAgendado} Agendadas <i class="fa fa-clock-o"></i></a>
			 - <a class="bnt btn-link" href="#" role="button">Total de ${qtdTotal} solicitações</a></legend>
		</div>
		<h4>Exportar Solicitações</h4>
        <div id="toolbar">
            <select class="form-control">
                <option value="">Export Basic</option>
                <option value="all">Export All</option>
                <option value="selected">Export Selected</option>
            </select>
        </div>
	
			<table id="table"
	               data-toggle="table"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-pagination="true"
	               data-show-pagination-switch="true"
	               data-search="true"
	               data-key-events="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
			<thead>
			<tr>
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="id" data-sortable="true">ID</th>
				<th data-field="dataAbertura" data-sortable="true">Data / Hora Abertura</th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th>Usuário</th>
				<th>Problema Relatado</th>
				<th>Status</th>
				<th data-field="tecnico" data-sortable="true">Técnico Responsável</th>
				<th>Ações</th>
			</tr>
			</thead>
			<c:forEach var="solicitacao" items="${solicitacoes}">
				<tr>
					<td></td>
					<td>${solicitacao.id}</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
							<span>Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></span></a>
					</td>
					<td>${solicitacao.cliente.nome}</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.descricaoProblema}
							<span>Resolução: ${solicitacao.resolucao} <br/><br/>
								Observação: ${solicitacao.obs} <br/><br/>
									Categoria: ${solicitacao.classificacao}</span></a>
					</td>													
					
					<td>
						<a class="dcontexto"> ${solicitacao.status}
							<span>Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/><br/>
								Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></span></a>
					</td>
			
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td><a href="#">Não classificado</a></td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td><a href="solicitacaoEditCliente?id=${solicitacao.id}">Ver</a></td>
					</tr>
			</c:forEach>
		</table>

	<br /><br />
	<c:import url="rodape.jsp"></c:import>
</body>
</html>