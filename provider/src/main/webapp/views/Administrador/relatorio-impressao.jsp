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
	<div id="loader"></div>
	<br />
	<h2 align="center"><img src="assets/img/logo_provider.png" ></h2><br />
	<legend></legend>
	<div id="corpo" class="conteudo">
		<table class="table">
			<thead>
			<tr >
				<th></th>
				<th>ID</th>
				<th>Data Abertura</th>
				<th>Local</th>
				<th>Cliente</th>
				<th>Usuário</th>
				<th>Problema Relatado</th>
				<th>Andamento</th>
				<th>Hora</th>
				<th>Status</th>
				<th>Técnico</th>
				<th>Encerramento</th>
				<th>Hora</th>
				<th>Duração</th>
			</tr>
			</thead>
			<c:forEach var="solicitacao" items="${solicitacoes}">
				<c:if test="${solicitacao.status == 'Aberto'}">
					<tr class="error" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>${solicitacao.id}</td>	
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>	
						</td>
						<td>${solicitacao.onsiteOffsite}</td>				
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto">* ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observação: ${solicitacao.obs}</p>
									</c:if>
								</span>
							</a>
						</td>
						<td>Não Iniciado</td>
						<td>Não Iniciado</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Finalizado'}">
					<tr class="success" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>${solicitacao.id}</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></span></a>
						</td>
						<td>${solicitacao.onsiteOffsite}</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto">* ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.resolucao}">
										<p>- Resolução: ${solicitacao.resolucao}</p>
									</c:if>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observação: ${solicitacao.obs}</p>
									</c:if>
								</span>
							</a>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="dd/MM/yyyy"/>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="HH:mm"/>	
						</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td>
							<f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/>	
						</td>
						<td>
							${solicitacao.tempoDeAndamento}
						</td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Agendado'}">
					<tr class="warning" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>${solicitacao.id}</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
						</td>
						<td>${solicitacao.onsiteOffsite}</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto">* ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observação: ${solicitacao.obs}</p>
									</c:if>
								</span>
							</a>
						</td>
						<td>Não Iniciado</td>
						<td>Não Iniciado</td>
						<td>
							<a class="dcontexto"> ${solicitacao.status}
								<span>
									<p>Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/></p>
									<p>Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></p>
								</span>
							</a>
						</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>		
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Em andamento'}">
					<tr class="info" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>${solicitacao.id}</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
						</td>
						<td>${solicitacao.onsiteOffsite}</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto">* ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.resolucao}">
										<p>- Resolução: ${solicitacao.resolucao}</p>
									</c:if>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observação: ${solicitacao.obs}</p>
									</c:if>
								</span>
							</a>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="dd/MM/yyyy"/>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="HH:mm"/>	
						</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Aguardando usuario'}">
					<tr class="info" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td>${solicitacao.id}</td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
								- Aberto por: ${solicitacao.abriuChamado}</span></a>
						</td>
						<td>${solicitacao.onsiteOffsite}</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto">* ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.resolucao}">
										<p>- Resolução: ${solicitacao.resolucao}</p>
									</c:if>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observação: ${solicitacao.obs}</p>
									</c:if>
								</span>
							</a>
						</td>
						<td>-</td>
						<td>-</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
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
	<script>
		function cont(){
		   var conteudo = document.getElementById('corpo').innerHTML;
		   tela_impressao = window.open('about:blank');
		   tela_impressao.document.write(conteudo);
		   tela_impressao.window.print();
		   tela_impressao.window.close();
		}
	</script>
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