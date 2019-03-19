<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Solicitações Abertas</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<div class="container">
			<legend></legend>
			<span id="botoes-status"></span>
			<div align="center"><a class="btn btn-danger aberto" href="solicitacoesAbertas" role="button"> ${qtdAberto} Abertas <i class="fa fa-question-circle"></i></a>
			 - <a class="btn btn-info andamento" href="solicitacoesAndamento" role="button">${qtdAndamento} Andamento <i class="fa fa-share"></i></a>
			 - <a class="btn btn-warning agendado" href="solicitacoesAgendadas" role="button">${qtdAgendado} Agendadas <i class="fa fa-clock-o"></i></a>
			 - <a class="btn btn-success aguardando" href="solicitacoesAguardando" role="button"> ${qtdAguardando} Aguardando <i class="fa fa-thumbs-o-up"></i></a>
			 - <a class="btn btn-inverse total" href="relatorioGeral" role="button">Total de ${qtdTotal} solicitações</a></div>
			<br/>
			<legend></legend>
		</div>
		<div id="carrega" style="display: none">
			<h2 align="center">Aguarde, enviando E-mail <i class="fa fa-circle-o-notch fa-spin"> </i></h2>
			<br/><br/>
		</div>
		<h4>Exportar Solicitações</h4>
	        <div id="toolbar">
	            <select class="form-control">
	               	<option value="">Exportação básica</option>
	                <option value="all">Exportar todos</option>
	                <option value="selected">Exportar Selecionados</option>
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
				<th>Anexo</th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th>Solicitante</th>
				<th>Usuário Afetado</th>
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
						<a href="#" onclick="lancarSubmenu(${solicitacao.id})">${solicitacao.id}</a>
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
								<span>
									<p>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></p>
									<p>- Aberto por: ${solicitacao.abriuChamado}</p>
								</span>
						</a>
					</td>
					<td>
						<a class="dcontexto"> ${solicitacao.onsiteOffsite}
							<span>- Nível: ${solicitacao.prioridade} </span></a>
					</td>
					
					<c:if test="${solicitacao.caminhoAnexo != null}">
						<td>
							<a href="downloadAnexoSolicitacao?id=${solicitacao.id}"><i class="fa fa-paperclip fa-lg" aria-hidden="true"></i></a>
							| <a href="deleteAnexoSolicitacao?id=${solicitacao.id}"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
						</td>
					</c:if>
					
					<c:if test="${solicitacao.caminhoAnexo == null}">
						<td><a href="uploadAnexoSolicitacao?id=${solicitacao.id}"><i class="fa fa-cloud-upload" aria-hidden="true"></i></a></td>
					</c:if>
					
					<td>
						<a class="dcontexto"> ${solicitacao.cliente.nome}
							<span>
								<p>- Tel.: ${solicitacao.cliente.telefone1} </p>
								<p>- Endereço: ${solicitacao.cliente.endereco}</p>
							</span>
						</a>
					</td>
					<td>${solicitacao.solicitante}</td>
					<td>${solicitacao.usuario}</td>
					<td>
						<a class="dcontexto" href="#janela1" onclick="mostraJanela('${solicitacao.descricaoProblema}','${solicitacao.obs}','${solicitacao.prioridade}')" rel="modal"> ${solicitacao.descricaoProblema}
							<span>
								<p>- Resolução: ${solicitacao.resolucao} </p>
								<p>- Observação: ${solicitacao.obs} </p>
								<p>- Categoria: ${solicitacao.classificacao}</p>
							</span>
						</a>
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
							<c:if test="${solicitacao.status == 'Aguardando usuario'}">
								<td><a href="clienteEdit?id=${solicitacao.cliente.id}">E-mail não cadastrado</a></td>
							</c:if>
							<c:if test="${solicitacao.status == 'Em andamento'}">
								<td>Não enviado na abertura</td>
							</c:if>
							<c:if test="${solicitacao.status == 'Aberto'}">
								<td><a href="clienteEdit?id=${solicitacao.cliente.id}">E-mail não cadastrado</a></td>
							</c:if>
							<c:if test="${solicitacao.status == 'Excluida'}">
								<td><a href="clienteEdit?id=${solicitacao.cliente.id}">Excluída</a></td>
							</c:if>
						</c:if>
						<c:if test="${not empty solicitacao.cliente.email }">
							<c:if test="${solicitacao.status == 'Agendado'}">
								<td>
									<a href="javascript:func()" onclick="confirmacaoEmail('${solicitacao.id}','${solicitacao.cliente.email}')" class="dcontexto">Enviar E-mail ao cliente
										<span>${solicitacao.cliente.email}</span></a>
								</td>
							</c:if>
							<c:if test="${solicitacao.status == 'Em andamento'}">
								<td>
									<a href="javascript:func()" onclick="confirmacaoEmail('${solicitacao.id}','${solicitacao.cliente.email}')" class="dcontexto">Enviar E-mail ao cliente
										<span>${solicitacao.cliente.email}</span></a>
								</td>
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
							<c:if test="${solicitacao.status == 'Excluida'}">
								<td>Excluída</td>
							</c:if>					
						</c:if>	
					</c:if>
					<c:if test="${not empty solicitacao.statusEmail}">
						<td>E-mail enviado</td>
					</c:if>
					<td>
						<a class="dcontexto"><div id="status-botao"> ${solicitacao.status}</div>
							<c:if test="${solicitacao.status != 'Aberto'}">
								<span>
									<c:if test="${solicitacao.status == 'Em andamento'}">
										<p>- Data: <f:formatDate value="${solicitacao.dataAndamento.time}" pattern="dd/MM/yyyy"/></p>
										<p>- Hora: <f:formatDate value="${solicitacao.dataAndamento.time}" pattern="HH:mm"/></p>
									</c:if>
									<c:if test="${solicitacao.status == 'Agendado'}">
										<p>- Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/></p>
										<p>- Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></p>
									</c:if>
										<c:if test="${solicitacao.status == 'Excluida'}">
										<p>- Data: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/></p>
										<p>- Hora: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/></p>
									</c:if>
								</span>
							</c:if>
						</a>
					</td>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não classificado</a></td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td>
						<a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> |  
						<a href="solicitacaoCopy?id=${solicitacao.id}"><i class="fa fa-copy fa-lg"></i></a>
						<c:if test="${solicitacao.status != 'Excluida'}"> 
							| <a href="javascript:func()" onclick="confirmacao('${solicitacao.id}')"><i class="fa fa-trash-o"></i></a>
						</c:if>					</td>
					</tr>
					<!-- mascara para cobrir o site -->  
					<div id="mascara"></div>
					
					<div class="window" id="janela1">
					    <a href="#" class="fechar">X Fechar</a>
					    <h4 align="center">Detalhes do Chamado</h4>
					    <legend></legend>
					    <p><b>Descrição do chamado: </b><span id="descricao-janela">  </span></p>
					    <p><b>Observação: </b><span id="obs-janela">  </span></p>
					    <p><b>Prioridade: </b><span id="prioridade-janela"> </span></p>
					</div>
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
	<script src="assets/js/botoes-status.js"></script>
	<script> 
		function lancarSubmenu(id){ 
		   window.open("logDeSolicitacao?id="+id,"janela1","width=700,height=650,scrollbars=YES") 
		} 
	</script> 
	<script>
		function mostraJanela(descricao, obs, prioridade){
				$(document).ready(function(){
			    $("a[rel=modal]").click( function(ev){
			        ev.preventDefault();
			 
			        var id = $(this).attr("href");
			 
			        var alturaTela = $(document).height();
			        var larguraTela = $(window).width();
			     
			        //colocando o fundo preto
			        $('#mascara').css({'width':larguraTela,'height':alturaTela});
			        $('#mascara').stop().fadeIn(1000); 
			        $('#mascara').stop().fadeTo("slow",0.8);
			 
			        var left = ($(window).width() /2) - ( $(id).width() / 2 );
			        var top = ($(window).height() / 2) - ( $(id).height() / 2 );
			     
			        $(id).css({'top':top,'left':left});
			        $(id).show();
			        $("#descricao-janela").text(descricao);
			        $("#obs-janela").text(obs);
			        $("#prioridade-janela").text(prioridade);
			    });
			 
			    $("#mascara").click( function(){
			        $(this).hide();
			        $(".window").hide();
			    });
			 
			    $('.fechar').click(function(ev){
			        ev.preventDefault();
			        $("#mascara").hide();
			        $(".window").hide();
			    });
			});
		}
	</script>
	
	<script>
		function confirmacao(id) {
		     var resposta = confirm("Deseja remover esse Chamado de id: " + id + " ?");
		     if (resposta == true) {
		          window.location.href = "removeSolicitacao?id="+id;
		     }
		}
	</script>
	<script>
		function confirmacaoEmail(id, cliente) {
	    	var email=prompt("Destinatário padrão: "+ cliente + "\n\nUtilize vírgula para enviar para mais de um destinatário\n\nPara envio direto ao usuário, digite no campo abaixo:");
		     if (email != null) {
		         setTimeout(function(){ 
		        	 $('#carrega').hide().fadeIn('slow');
		        	 $("table").fadeOut(2000,function(){
			    		 window.location.href = "enviaEmail?id="+id+"&destinatario="+email;
		        	 })
		         }, 1);
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