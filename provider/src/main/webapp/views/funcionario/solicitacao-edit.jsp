<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
   	<title>ProviderOne | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
	<form action="atualizarSolicitacaoFuncionario" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Edição de Solicitação</legend>
			<div>
				<div>
					<input id="solicitacao" name="id" type="hidden"
						value="${solicitacao.id}">
				</div>
			</div>
			<div>
				<div>
					<input id="cliente" name="cliente.id" type="hidden"
						value="${solicitacao.cliente.id}">
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Data Abertura</label>
				<div class="controls">
					<input id="dataAbertura" name="dataAbertura" type="text" onKeyPress="DataHoraAbertura(event, this)" value="<f:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${solicitacao.dataAbertura.time}" />">
					<i class="fa fa-calendar" aria-hidden="true"></i>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Data Andamento</label>
				<div class="controls">
					<input id="dataAndamento" name="dataAndamento" type="text" onKeyPress="DataHoraAndamento(event, this)" value="<f:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${solicitacao.dataAndamento.time}" />">
					<i class="fa fa-calendar" aria-hidden="true"></i>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Data Fechamento</label>
				<div class="controls">
					<input id="dataFechamento" name="dataFechamento" type="text" onKeyPress="DataHoraFechamento(event, this)" value="<f:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${solicitacao.dataFechamento.time}" />">
					<i class="fa fa-calendar" aria-hidden="true"></i>	
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Tempo de Atendimento</label>
				<div class="controls">
					<input id="tempoDeAndamento" name="tempoDeAndamento" type="text" value="${solicitacao.tempoDeAndamento}" class="input-xlarge" disabled>
					<i class="fa fa-clock-o fa-lg" aria-hidden="true"></i>
				</div>
			</div>
			
			<!-- ######################################################################## -->
			<div class="control-group">
				<label class="control-label">Nome do Cliente</label>
				<div class="controls">
					<input type="text"
						value="${solicitacao.cliente.nome}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Forma de Abertura</label>
				<div class="controls">
					<select class="selectpicker" id="formaAbertura"
						name="formaAbertura">
						<option>${solicitacao.formaAbertura}</option>
						<option>Helpdesk</option>
						<option>E-mail</option>
						<option>Whatsapp</option>
						<option>No local</option>
						<option></option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Solicitante</label>
				<div class="controls">
					<input id="solicitante" name="solicitante" type="text"
						value="${solicitacao.solicitante}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario Afetado</label>
				<div class="controls">
					<input id="usuario" name="usuario" type="text"
						value="${solicitacao.usuario}" class="input-xlarge" required>
					<a href="javascript:func()" id="copy" onclick="copiaSolicitante()"><i class="fa fa-files-o fa-lg" aria-hidden="true"></i></a>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Descrição do problema</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="descricaoProblema" name="descricaoProblema" type="text" 
					placeholder="Descrição do Problema" onkeyup="limite_textarea_prob(this.value)"
						class="input-xlarge">${solicitacao.descricaoProblema}</textarea>
					<span id="contProb">255</span> Restantes <br>
				</div>
			</div>
			
			<!-- 
			<div class="control-group">
				<label class="control-label">Descrição do problema</label>
				<div class="controls">
					<input id="descricaoProblema" name="descricaoProblema" type="text"
						value="${solicitacao.descricaoProblema}" onkeyup="limite_textarea_prob(this.value)" class="input-xlarge" required>
					<span id="contProb">255</span> Restantes <br>
					<p class="help-block">* Campo Obrigatório</p>
					
				</div>
			</div>
			 -->


			<div class="control-group">
				<label class="control-label">Resolução do problema</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="resolucao" name="resolucao" type="text" 
					placeholder="Resolução do Problema" onkeyup="limite_textarea_resolu(this.value)"
						class="input-xlarge">${solicitacao.resolucao}</textarea>
					<span id="contResolu">255</span> Restantes <br>
				</div>
			</div>

			 <div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="obs" name="obs" type="text" 
					placeholder="Observações" onkeyup="limite_textarea_obs(this.value)"
						class="input-xlarge">${solicitacao.obs}</textarea>
					<span id="contObs">255</span> Restantes <br>
				</div>
			</div>
			 
			 <!-- ######################################################################## -->
			 
			 <div class="control-group">
				<label class="control-label">Status E-mail</label>
				<div class="controls">
					<select class="selectpicker" id="statusEmail"
						name="statusEmail">
						<option>${solicitacao.statusEmail}</option>
						<option></option>
					</select>
				</div>
			</div> 
			 
			 <div class="control-group">
				<label class="control-label">Log</label>
					 <div class="controls">
						<div class="col-xs-12 col-md-6">
							<textarea class="form-control" rows="8" style="width: 550px; height: 400px;" disabled="disabled">
								${solicitacao.andamentoDoChamado}
							</textarea>
						</div>
					</div>
			 </div>
			
			<!-- ######################################################################## -->	
			<div class="control-group">
				<label class="control-label">Categoria
					<a class="dcontexto"> (?)
					<span>Hardware - Problema físico no equipamento. <br><br> 
						Software - Problema lógico no equipamento. <br><br> 
						Rede - Problemas de conexão. <br><br>
						Cabeamento - Serviços de cabeamento estruturado
					</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="classificacao"
						name="classificacao">
						<option>${solicitacao.classificacao}</option>
						<option>Hardware</option>
						<option>Software</option>
						<option>Rede</option>
						<option>Cabeamento</option>
						<option>Smartphone</option>
						<option>Projeto</option>
						<option>Backup</option>
						<option>Outros</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Classificação
					<a class="dcontexto"> (?)
					<span>Problema - Algo que é recorrente <br> Incidente - Algo não recorrente <br> Evento - Planejado</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="nivelDeIncidencia" name="nivelDeIncidencia">
						<option>${solicitacao.nivelDeIncidencia}</option>
						<option>Problema</option>
						<option>Incidente</option>
						<option>Solicitação</option>
						<option>Backup</option>
					</select>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Alta - 2 Horas <br> Média - 24 Horas <br> Baixa - 72 Horas <br> Planejada - Evento Plavejado</span>
				</a></label> 
				<div class="controls">
					<select class="selectpicker" id="prioridade" name="prioridade">
						<option>${solicitacao.prioridade}</option>
						<option>Alta</option>
						<option>Media</option>
						<option>Baixa</option>
						<option>Planejada</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Onsite / Offsite
					<a class="dcontexto"> (?)
					<span>Onsite - Atendimento no local <br> Offsite - Atendimento remoto</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="onsiteOffisite"
						name="onsiteOffsite">
						<option>${solicitacao.onsiteOffsite}</option>
						<option>Onsite</option>
						<option>Offsite</option>
					</select>
				</div>
			</div>
			
			<div id="agendamentos">
				<div class="control-group">
					<label class="control-label">Data de Agendamento</label>
					<div class="controls">
						<input id="datepicker" name="agendado" type="text" placeholder="Data de agendamento" maxlength="10"
							value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.agendado.time}" />" /> <i class="fa fa-calendar fa-lg"> </i>
					</div>
				</div>	
				<div class="control-group">
					<label class="control-label">Hora de Agendamento</label>
					<div class="controls">
						<input id="timepicker" name="agendadoHora" type="text" placeholder="Hora de agendamento" maxlength="10"
							value="<f:formatDate pattern="HH:mm" value="${solicitacao.agendadoHora.time}" />" /> <i class="fa fa-clock-o fa-lg"> </i>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Funcionário Responsável</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoFuncionario"
						name="nomeDoFuncionario">
						<option>${solicitacao.funcionario.nome}</option>
						<c:forEach var="funcionario" items="${funcionario}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
						<option></option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status"
						name="status">
						<option>${solicitacao.status}</option>
						
						<c:if test="${solicitacao.status != 'Agendado'}">
							<option>Agendado</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aberto'}">
							<option>Aberto</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Em andamento'}">
							<option>Em andamento</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aguardando usuario'}">
							<option>Aguardando usuario</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aberto'}">
							<option>Finalizar</option>
						</c:if>
					</select>
				</div>
			</div>
			<input type="hidden" id="funcionarioLogado" name="funcionarioLogado" value="${tecnicoLogado.nome}">
			<input type="hidden" id="nomeDoCliente" name="nomeDoCliente" value="${solicitacao.cliente.nome}">
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/calendario.js"></script>
	<script src="assets/js/controla-calendario-agendamento.js"></script>
	<script src="assets/js/controla-campos-texto.js"></script>
	<script src="assets/js/date.js"></script>
	<script src="assets/js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#dataAbertura').datetimepicker({
				showSecond: true,
				timeFormat: 'hh:mm:ss'
			});
		 });
		
		$(function(){
			$('#dataAndamento').datetimepicker({
				showSecond: true,
				timeFormat: 'hh:mm:ss'
			});
		 });
		
		$(function(){
			$('#dataFechamento').datetimepicker({
				showSecond: true,
				timeFormat: 'hh:mm:ss'
			});
		 });
	   
	</script>
	<script>
		/*-----------------------------------------------------------------------
		Máscara para o campo data dd/mm/aaaa hh:mm:ss
		Exemplo: <input maxlength="16" name="datahora" onKeyPress="DataHora(event, this)">
		-----------------------------------------------------------------------*/
		function DataHoraAbertura(evento, objeto){
			var keypress=(window.event)?event.keyCode:evento.which;
			campo = eval (objeto);
			if (campo.value == '00-00-0000 00:00:00')
			{
				campo.value=""
			}
		
			caracteres = '0123456789';
			separacao1 = '-';
			separacao2 = ' ';
			separacao3 = ':';
			conjunto1 = 2;
			conjunto2 = 5;
			conjunto3 = 10;
			conjunto4 = 13;
			conjunto5 = 16;
			if ((caracteres.search(String.fromCharCode (keypress))!=-1) && campo.value.length < (19))
			{
				if (campo.value.length == conjunto1 )
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto2)
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto3)
				campo.value = campo.value + separacao2;
				else if (campo.value.length == conjunto4)
				campo.value = campo.value + separacao3;
				else if (campo.value.length == conjunto5)
				campo.value = campo.value + separacao3;
			}
			else
				event.returnValue = false;
		}
	</script>
	<script>
		/*-----------------------------------------------------------------------
		Máscara para o campo data dd/mm/aaaa hh:mm:ss
		Exemplo: <input maxlength="16" name="datahora" onKeyPress="DataHora(event, this)">
		-----------------------------------------------------------------------*/
		function DataHoraAndamento(evento, objeto){
			var keypress=(window.event)?event.keyCode:evento.which;
			campo = eval (objeto);
			if (campo.value == '00-00-0000 00:00:00')
			{
				campo.value=""
			}
		
			caracteres = '0123456789';
			separacao1 = '-';
			separacao2 = ' ';
			separacao3 = ':';
			conjunto1 = 2;
			conjunto2 = 5;
			conjunto3 = 10;
			conjunto4 = 13;
			conjunto5 = 16;
			if ((caracteres.search(String.fromCharCode (keypress))!=-1) && campo.value.length < (19))
			{
				if (campo.value.length == conjunto1 )
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto2)
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto3)
				campo.value = campo.value + separacao2;
				else if (campo.value.length == conjunto4)
				campo.value = campo.value + separacao3;
				else if (campo.value.length == conjunto5)
				campo.value = campo.value + separacao3;
			}
			else
				event.returnValue = false;
		}
	</script>
	<script>
		/*-----------------------------------------------------------------------
		Máscara para o campo data dd/mm/aaaa hh:mm:ss
		Exemplo: <input maxlength="16" name="datahora" onKeyPress="DataHora(event, this)">
		-----------------------------------------------------------------------*/
		function DataHoraFechamento(evento, objeto){
			var keypress=(window.event)?event.keyCode:evento.which;
			campo = eval (objeto);
			if (campo.value == '00-00-0000 00:00:00')
			{
				campo.value=""
			}
		
			caracteres = '0123456789';
			separacao1 = '-';
			separacao2 = ' ';
			separacao3 = ':';
			conjunto1 = 2;
			conjunto2 = 5;
			conjunto3 = 10;
			conjunto4 = 13;
			conjunto5 = 16;
			if ((caracteres.search(String.fromCharCode (keypress))!=-1) && campo.value.length < (19))
			{
				if (campo.value.length == conjunto1 )
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto2)
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto3)
				campo.value = campo.value + separacao2;
				else if (campo.value.length == conjunto4)
				campo.value = campo.value + separacao3;
				else if (campo.value.length == conjunto5)
				campo.value = campo.value + separacao3;
			}
			else
				event.returnValue = false;
		}
	</script>
	<script>
		function copiaSolicitante(){
			var solicitante = $('#solicitante').val();
			$('#usuario').val(solicitante);
		}
	</script>
</html>