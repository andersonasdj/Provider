<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Relat�rios</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<div id="loader"></div>
	<br /><br /><br />
	
		<div class="container">
			<legend align="center">Resumo de solicita��es</legend>
			<div class="row">
				<div class="col-md-7"><div id="grafico"></div></div>
				<div class="col-md-5">
					<div id="botoesRelatorio">
						<br/><br/>
						<p><a class="btn btn-danger" href="solicitacoesAbertas" role="button"> ${qtdAberto} Abertas <i class="fa fa-question-circle"></i></a></p>
						<p><a class="btn btn-info" href="solicitacoesAndamento" role="button">${qtdAndamento} Andamento <i class="fa fa-share"></i></a></p>
						<p><a class="btn btn-warning" href="solicitacoesAgendadas" role="button">${qtdAgendado} Agendadas <i class="fa fa-clock-o"></i></a></p>
						<p><a class="btn btn-success" href="solicitacoesAguardando" role="button"> ${qtdAguardando} Aguardando <i class="fa fa-thumbs-o-up"></i></a></p>
						<p><a class="btn btn-inverse" href="relatorioGeral" role="button">Total de ${qtdTotal} solicita��es</a></p>
					</div>
				</div>
			</div>
			<legend id="grafico"></legend>
		</div>
		
		<h4>Exportar Relat�rio</h4>
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
				<th data-field="dataAbertura">Data / Hora Abertura</th>
				<th data-field="onsiteOffsite" data-sortable="true">Site</th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th data-field="usuario" data-sortable="true">Usu�rio</th>
				<th data-field="descricaoProblema">Problema Relatado</th>
				<th data-field="dataEncerramento">Data / Hora Encerramento</th>
				<th data-field="status" data-sortable="true">Status</th>
				<th data-field="tecnico" data-sortable="true">T�cnico</th>
				<th>A��es</th>
			</tr>
			</thead>
			<c:forEach var="solicitacao" items="${solicitacoes}">
				<c:if test="${solicitacao.status == 'Aberto'}">
					<tr class="error" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}"><i class="fa fa-tags" aria-hidden="true"></i> ${solicitacao.id}</a>
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
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>	
						</td>
						
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- N�vel.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.cliente.nome}
								<span><p>- Tel.: ${solicitacao.cliente.telefone1}</p>
									<p>- Endere�o: ${solicitacao.cliente.endereco}</p></span></a>
						</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span><p>- Resolu��o: ${solicitacao.resolucao} </p>
									<p>- Observa��o: ${solicitacao.obs} </p>
									<p>- Categoria: ${solicitacao.classificacao}</p></span></a>
						</td>
						<td>Aberto</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Finalizado'}">
					<tr class="success" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}"><i class="fa fa-tags" aria-hidden="true"></i> ${solicitacao.id}</a>
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
								<span><p>Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></p>
								<p>- Aberto por: ${solicitacao.abriuChamado}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- N�vel.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.cliente.nome}
								<span><p>- Tel.: ${solicitacao.cliente.telefone1}</p>
									<p>- Endere�o: ${solicitacao.cliente.endereco}</p></span></a>
						</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span><p>- Resolu��o: ${solicitacao.resolucao}</p>
									<p>- Observa��o: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/>
								<span><p>- Hora: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/></p></span></a>	
						</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Agendado'}">
					<tr class="warning" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}"><i class="fa fa-tags" aria-hidden="true"></i> ${solicitacao.id}</a>
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
								<span><p>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></p>
								<p>- Aberto por: ${solicitacao.abriuChamado}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- N�vel.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.cliente.nome}
								<span><p>- Tel.: ${solicitacao.cliente.telefone1}</p>
									<p>- Endere�o: ${solicitacao.cliente.endereco}</p></span></a>
						</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span><p>- Resolu��o: ${solicitacao.resolucao}</p>
									<p>- Observa��o: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p></span></a>
						</td>
						<td>Aberto</td>
						<td>
							<a class="dcontexto"> ${solicitacao.status}
								<span><p>- Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/></p>
									<p>- Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></p></span></a>
						</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>		
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Em andamento'}">
					<tr class="info" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}"><i class="fa fa-tags" aria-hidden="true"></i> ${solicitacao.id}</a>
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
								
								<span><p>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></p>
								<p>- Aberto por: ${solicitacao.abriuChamado}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- N�vel.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.cliente.nome}
								<span><p>- Tel.: ${solicitacao.cliente.telefone1}</p>
									<p>- Endere�o: ${solicitacao.cliente.endereco}</p></span></a>
						</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span><p>- Resolu��o: ${solicitacao.resolucao}</p>
									<p>- Observa��o: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span></a>
						</td>
						<td>Aberto</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				
				<c:if test="${solicitacao.status == 'Aguardando usuario'}">
					<tr class="active" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>
							<a href="logDeSolicitacao?id=${solicitacao.id}"><i class="fa fa-tags" aria-hidden="true"></i> ${solicitacao.id}</a>
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
								<span><p>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></p>
								<p>- Aberto por: ${solicitacao.abriuChamado}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.onsiteOffsite}
								<span><p>- N�vel.: ${solicitacao.prioridade}</p></span></a>
						</td>
						<td>
							<a class="dcontexto"> ${solicitacao.cliente.nome}
								<span><p>- Tel.: ${solicitacao.cliente.telefone1}</p>
									<p>- Endere�o: ${solicitacao.cliente.endereco}</p></span></a>
						</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span><p>- Resolu��o: ${solicitacao.resolucao}</p>
									<p>- Observa��o: ${solicitacao.obs}</p>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span></a>
						</td>
						<td>Aberto</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		
		<input type="hidden" name="abertas" id="aberto" value="${qtdAberto}">
		<input type="hidden" name="agendadas" id="agendado" value="${qtdAgendado}"> 
		<input type="hidden" name="abertas" id="andamento" value="${qtdAndamento}"> 
		<input type="hidden" name="aguardando" id="aguardando" value="${qtdAguardando}"> 
		
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
	<script type="text/javascript" src="https://google.com/jsapi"></script>
	<script src="assets/js/grafico.js"></script>
	
	<script type="text/javascript">
        // Este evendo � acionado ap�s o carregamento da p�gina
        jQuery(window).load(function() {
            //Ap�s a leitura da pagina o evento fadeOut do loader � acionado, esta com delay para ser perceptivo em ambiente fora do servidor.
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