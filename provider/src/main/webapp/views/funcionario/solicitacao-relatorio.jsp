<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Relatórios</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<h4>Exportar Solicitações</h4>
        <div id="toolbar">
            <select class="form-control">
               	<option value="">Exportação básica</option>
                <option value="all">Exportar todos</option>
                <option value="selected">Exportar Selecionados</option>
            </select>
        </div>
		<table class="id="table"
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
		<tr class="">
			<th data-field="state" data-checkbox="true"></th>
			<th data-field="id" data-sortable="true">ID</th>
			<th data-field="dataAbertura">Data / Hora Abertura</th>
			<th data-field="onsiteOffsite" data-sortable="true">Site</th>
			<th data-field="cliente" data-sortable="true">Cliente</th>
			<th data-field="usuario" data-sortable="true">Usuário</th>
			<th>Problema Relatado</th>
			<th data-field="dataEncerramento">Data / Hora Encerramento</th>
			<th data-field="status" data-sortable="true">Status</th>
			<th data-field="tecnico" data-sortable="true">Técnico</th>
			<th>Ações</th>
		</tr>
		</thead>
		<c:forEach var="solicitacao" items="${solicitacoes}">
			<c:if test="${solicitacao.status == 'Aberto'}">
				<tr class="error" align="center">
					<td data-field="state" data-checkbox="true"></td>
					<td>${solicitacao.id}</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
							<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/> <br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
					</td>
					<td>${solicitacao.onsiteOffsite}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.cliente.nome}
							<span>- Tel.: ${solicitacao.cliente.telefone1} <br/><br/>
								- Endereço: ${solicitacao.cliente.endereco}</span></a>
					</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.descricaoProblema}
							<span>Resolução: ${solicitacao.resolucao} <br/><br/>
								Observação: ${solicitacao.obs}</span></a>
					</td>
					<td>Aberto</td>
					<td>${solicitacao.status}</td>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td>Não Atribuido</td>
					</c:if>
					<td><a href="visualizaSolicitacao?id=${solicitacao.id}">Ver</a></td>
				</tr>
			</c:if>			
			<c:if test="${solicitacao.status == 'Finalizado'}">
				<tr class="success" align="center">
					<td data-field="state" data-checkbox="true"></td>
					<td>${solicitacao.id}</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
							<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/> <br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
					</td>
					<td>${solicitacao.onsiteOffsite}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.cliente.nome}
							<span>- Tel.: ${solicitacao.cliente.telefone1} <br/><br/>
								- Endereço: ${solicitacao.cliente.endereco}</span></a>
					</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.descricaoProblema}
							<span>Resolução: ${solicitacao.resolucao} <br/><br/>
								Observação: ${solicitacao.obs}</span></a>
					</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/>
							<span>Hora: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/></span></a>
					</td>
					<td>${solicitacao.status}</td>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td>Não Atribuido</td>
					</c:if>
					<td><a href="visualizaSolicitacao?id=${solicitacao.id}">Ver</a></td>
				</tr>
			</c:if>
			<c:if test="${solicitacao.status == 'Agendado'}">
				<tr class="warning" align="center">
					<td data-field="state" data-checkbox="true"></td>
					<td>${solicitacao.id}</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
							<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/> <br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
					</td>
					<td>${solicitacao.onsiteOffsite}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.cliente.nome}
							<span>- Tel.: ${solicitacao.cliente.telefone1} <br/><br/>
								- Endereço: ${solicitacao.cliente.endereco}</span></a>
					</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.descricaoProblema}
							<span>Resolução: ${solicitacao.resolucao} <br/><br/>
								Observação: ${solicitacao.obs}</span></a>
					</td>
					<td>Aberto</td>
					<td>
						<a class="dcontexto"> ${solicitacao.status}
							<span>Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/><br/>
									Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></span></a>
					</td>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td>Não Atribuido</td>
					</c:if>
					<td><a href="visualizaSolicitacao?id=${solicitacao.id}">Ver</a></td>
				</tr>
			</c:if>
			<c:if test="${solicitacao.status == 'Em andamento'}">
				<tr class="info" align="center">
					<td data-field="state" data-checkbox="true"></td>
					<td>${solicitacao.id}</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
							<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/> <br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
					</td>
					<td>${solicitacao.onsiteOffsite}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.cliente.nome}
							<span>- Tel.: ${solicitacao.cliente.telefone1} <br/><br/>
								- Endereço: ${solicitacao.cliente.endereco}</span></a>
					</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.descricaoProblema}
							<span>Resolução: ${solicitacao.resolucao} <br/><br/>
								Observação: ${solicitacao.obs}</span></a>
					</td>
					<td>Aberto</td>
					<td>${solicitacao.status}</td>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td>Não Atribuido</td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td><a href="visualizaSolicitacao?id=${solicitacao.id}">Ver</a></td>
				</tr>
			</c:if>
			<c:if test="${solicitacao.status == 'Aguardando usuario'}">
				<tr class="active" align="center">
					<td data-field="state" data-checkbox="true"></td>
					<td>${solicitacao.id}</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
							<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/> <br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
					</td>
					<td>${solicitacao.onsiteOffsite}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.cliente.nome}
							<span>- Tel.: ${solicitacao.cliente.telefone1} <br/><br/>
								- Endereço: ${solicitacao.cliente.endereco}</span></a>
					</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.descricaoProblema}
							<span>Resolução: ${solicitacao.resolucao} <br/><br/>
								Observação: ${solicitacao.obs}</span></a>
					</td>
					<td>Aberto</td>
					<td>${solicitacao.status}</td>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td>Não Atribuido</td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td><a href="visualizaSolicitacao?id=${solicitacao.id}">Ver</a></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<br /><br />
	<legend></legend>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
</html>