<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Relatórios</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<div id="loader"></div>
	<br /><br /><br />
		<h3>Exportar Relatório</h3>
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
			<tr class="" align="center">
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="id" data-sortable="true">ID</th>
				<th data-field="dataAbertura" data-sortable="true">Data / Hora Abertura</th>
				<th data-field="onsiteOffsite" data-sortable="true">Site</th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th data-field="usuario" data-sortable="true">Usuário</th>
				<th>Problema Relatado</th>
				<th data-field="dataEncerramento" data-sortable="true">Data Andamento / Encerramento</th>
				<th data-field="status" data-sortable="true">Status</th>
				<th data-field="tecnico" data-sortable="true">Técnico</th>
				<th>Ações</th>
			</tr>
			</thead>
			<c:forEach var="solicitacao" items="${solicitacoes}">
				<c:if test="${solicitacao.status == 'Aberto'}">
					<tr class="error" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}">${solicitacao.id} </a>
						</td>	
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>	
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- Nível.: ${solicitacao.prioridade}</p></span></a>
						</td>				
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<p>- Resolução: ${solicitacao.resolucao}</p>
									<p>- Observação: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>Aberto</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEditFuncionarioFull?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Finalizado'}">
					<tr class="success" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}">${solicitacao.id} </a>
						</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- Nível.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<p>- Resolução: ${solicitacao.resolucao}</p>
									<p>- Observação: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAndamento.time}" pattern="dd/MM/yyyy"/>
							 - <f:formatDate value="${solicitacao.dataAndamento.time}" pattern="HH:mm"/>
								<span>
									<p>- Data de encerramento: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/></p>
									<p>- Hora de encerramento: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/></p>
									<p>- Tempo de atendimento: ${solicitacao.tempoDeAndamento}</p>
								 </span>
							</a>		
						</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEditFuncionarioFull?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Agendado'}">
					<tr class="warning" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}">${solicitacao.id} </a>
						</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- Nível.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<p>- Resolução: ${solicitacao.resolucao}</p>
									<p>- Observação: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>Aberto</td>
						<td>
							<a class="dcontexto"> ${solicitacao.status}
								<span>Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/><br/>
									Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></span></a>
						</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>		
						<td><a href="solicitacaoEditFuncionarioFull?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Em andamento'}">
					<tr class="info" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}">${solicitacao.id} </a>
						</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- Nível.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<p>- Resolução: ${solicitacao.resolucao}</p>
									<p>- Observação: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>Aberto</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEditFuncionarioFull?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Aguardando usuario'}">
					<tr class="info" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}">${solicitacao.id} </a>
						</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- Nível.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<p>- Resolução: ${solicitacao.resolucao}</p>
									<p>- Observação: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>Aberto</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEditFuncionarioFull?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	<br /><br />
	<legend></legend>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
	<script type="text/javascript">
        // Este evendo é acionado após o carregamento da página
        jQuery(window).load(function() {
            //Após a leitura da pagina o evento fadeOut do loader é acionado, esta com delay para ser perceptivo em ambiente fora do servidor.
            jQuery("#loader").delay(10).fadeOut("slow");
        });
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