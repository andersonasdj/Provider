<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Solicitações Abertas</title>
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
		<div class="container">
			<div align="center"><a class="btn btn-danger" href="solicitacoesAbertas" role="button"> ${qtdAberto} Abertas <i class="fa fa-question-circle"></i></a>
			 - <a class="btn btn-info" href="solicitacoesAndamento" role="button">${qtdAndamento} Andamento <i class="fa fa-share"></i></a>
			 - <a class="btn btn-warning" href="solicitacoesAgendadas" role="button">${qtdAgendado} Agendadas <i class="fa fa-clock-o"></i></a>
			 - <a class="btn btn-success" href="solicitacoesAguardando" role="button"> ${qtdAguardando} Aguardando <i class="fa fa-thumbs-o-up"></i></a>
			 - <a class="btn btn-inverse" href="relatorioGeral" role="button">Total de ${qtdTotal} solicitações</a></div>
		</div>
		<br/>
		<legend></legend>
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
				<th data-field="dataAbertura">Data / Hora Abertura</th>
				<th>Site</th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th>Usuário</th>
				<th>Problema Relatado</th>
				<th>Email de Abertura</th>
				<th>Status</th>
				<th data-field="tecnico" data-sortable="true">Técnico Responsável</th>
				<th>Ações</th>
			</tr>
			</thead>
			<c:forEach var="solicitacao" items="${solicitacoes}">
				<tr>
					<td></td>
					<td>
						<a href="logDeSolicitacao?id=${solicitacao.id}">${solicitacao.id}</a>
					</td>
					<td>
						<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
							<c:if test="${solicitacao.prioridade == 'Alta'}">
								<img class="ico_status" src="assets/img/alta.png">
							</c:if>
							<c:if test="${solicitacao.prioridade == 'Media'}">
								<img class="ico_status" src="assets/img/media.png">
							</c:if>
							<c:if test="${solicitacao.prioridade == 'Baixa'}">
								<img class="ico_status" src="assets/img/baixa.png">
							</c:if>
							<c:if test="${solicitacao.prioridade == 'Planejada'}">
								<img class="ico_status" src="assets/img/planejada.png">
							</c:if>	
							<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/> <br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
					</td>
					<td>
						<a class="dcontexto"> ${solicitacao.onsiteOffsite}
							<span>- Nível.: ${solicitacao.prioridade} </span></a>
					</td>
					<td>
							<a class="dcontexto"> ${solicitacao.cliente.nome}
								<span>- Tel.: ${solicitacao.cliente.telefone1} <br/><br/>
									- Endereço: ${solicitacao.cliente.endereco}</span></a>
						</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto"> ${solicitacao.descricaoProblema}
							<span>- Resolução: ${solicitacao.resolucao} <br/><br/>
								- Observação: ${solicitacao.obs} <br/><br/>
									- Categoria: ${solicitacao.classificacao}</span></a>
					</td>													
					<c:if test="${empty solicitacao.statusEmail}">
						<c:if test="${empty solicitacao.cliente.email }">
							<c:if test="${solicitacao.status == 'Agendado'}">
								<c:if test="${not empty solicitacao.statusEmail}">
									<td>Email enviado</td>
								</c:if>
								<c:if test="${empty solicitacao.statusEmail}">
									<td>Não enviado na abertura</td>
								</c:if>
							</c:if>
							<c:if test="${solicitacao.status == 'Em andamento'}">
								<td>Não enviado na abertura</td>
							</c:if>
							<c:if test="${solicitacao.status == 'Aberto'}">
								<td><a href="clienteEdit?id=${solicitacao.cliente.id}">E-mail não cadastrado</a></td>
							</c:if>
						</c:if>
						<c:if test="${not empty solicitacao.cliente.email }">
							<c:if test="${solicitacao.status == 'Agendado'}">
								<td>Não enviado na abertura</td>
							</c:if>
							<c:if test="${solicitacao.status == 'Em andamento'}">
								<td>Não enviado na abertura</td>
							</c:if>
							<c:if test="${solicitacao.status == 'Aberto'}">
								<td>
									<a href="javascript:func()" onclick="confirmacaoEmail('${solicitacao.id}','${solicitacao.cliente.email}')" class="dcontexto">Enviar E-mail ao cliente
										<span>${solicitacao.cliente.email}</span></a>
								</td>
							</c:if>
							<c:if test="${solicitacao.status == 'Aguardando usuario'}">
								<td>
									<a href="javascript:func()" onclick="confirmacaoEmail('${solicitacao.id}','${solicitacao.cliente.email}')" class="dcontexto">Enviar E-mail ao cliente
										<span>${solicitacao.cliente.email}</span></a>
								</td>
							</c:if>						
						</c:if>	
					</c:if>
					<c:if test="${not empty solicitacao.statusEmail}">
						<td>E-mail enviado</td>
					</c:if>
					<td>
						<a class="dcontexto"> ${solicitacao.status}
							<span>- Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/><br/>
								- Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></span></a>
					</td>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não classificado</a></td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> |  
						<a href="javascript:func()" onclick="confirmacao('${solicitacao.id}')"><i class="fa fa-trash-o"></i></a></td>
					</tr>
			</c:forEach>
		</table>
	<br/><br/>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
	<script language="Javascript">
		function confirmacao(id) {
		     var resposta = confirm("Deseja remover esse Chamado de id: " + id + " ?");
		 
		     if (resposta == true) {
		          window.location.href = "removeSolicitacao?id="+id;
		     }
		}
	</script>
	<script language="Javascript">
		function confirmacaoEmail(id, cliente) {
		     var resposta = confirm("Deseja enviar um email para: " + cliente);
		 
		     if (resposta == true) {
		          window.location.href = "enviaEmail?id="+id;
		     }
		}
	</script>
	<script>
	    var $table = $('#table');
	    $(function () {
	        $('#toolbar').find('select').change(function () {
	            $table.bootstrapTable('refreshOptions', {
	                exportDataType: $(this).val()
	            });
	        });
	    })
	</script>
</html>