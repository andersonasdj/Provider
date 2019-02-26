<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
   	<title>ProviderOne | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
	<form action="atualizarSolicitacao" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Classifica��o de solicita��o 
			<a  onClick="history.go(-1)" ><i class="fa fa-reply-all" aria-hidden="true"></i></a>
			<span class="pull-right">
				<h6>
					<a href="http://localhost/provider/protocolo?id=${solicitacao.id}&senha=${solicitacao.senha}">
						Modificado em: <f:formatDate pattern="dd-MM-yyyy HH:mm" value="${solicitacao.dataAtualizacao.time}"  />
					</a>
				</h6>
			</span>
				<c:if test="${solicitacao.status == 'Finalizado'}"> 
					<a class="btn" href="solicitacaoEditFull?id=${solicitacao.id}" role="button"> Edi��o Completa</a>
				</c:if>
			</legend>
			<input id="solicitacao" name="id" type="hidden" value="${solicitacao.id}">
			<input id="cliente" name="cliente.id" type="hidden" value="${solicitacao.cliente.id}">
			<input type="hidden" id="abriuChamado" name="abriuChamado" value="${solicitacao.abriuChamado}"> 
			<input type="hidden" id="funcionarioLogado" name="funcionarioLogado" value="${funcionarioLogado.nome}">
			<div class="control-group">
				<label class="control-label">Data Abertura</label>
				<div class="controls">
					<input  type="text" placeholder="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.dataAbertura.time}"  />"
						disabled="disabled">
					<a class="btn" href="dataEditSolicitacao?id=${solicitacao.id}" role="button"> Editar</a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Hora Abertura</label>
				<div class="controls">
					<input  type="text" placeholder="<f:formatDate pattern="HH:mm" value="${solicitacao.dataAbertura.time}"/>" 
						disabled="disabled" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Cliente</label>
				<div class="controls">
					<input type="text"
						value="${solicitacao.cliente.nome}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input id="senha" name="senha" type="text" value="${solicitacao.senha}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Forma de Abertura</label>
				<div class="controls">
					<select class="selectpicker" id="formaAbertura"
						name="formaAbertura">
						<option>${solicitacao.formaAbertura}</option>
						<option></option>
						<option>Helpdesk</option>
						<option>E-mail</option>
						<option>Whatsapp</option>
						<option>No local</option>
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
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Descri��o do problema</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="descricaoProblema" name="descricaoProblema" type="text" 
					placeholder="Descri��o do Problema" onkeyup="limite_textarea_prob(this.value)"
						class="input-xlarge">${solicitacao.descricaoProblema}</textarea>
					<span id="contProb">255</span> Restantes <br>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Resolu��o do problema</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="resolucao" name="resolucao" type="text" 
					placeholder="Resolu��o do Problema" onkeyup="limite_textarea_resolu(this.value)"
						class="input-xlarge">${solicitacao.resolucao}</textarea>
					<span id="contResolu">255</span> Restantes <br>
				</div>
			</div>
			 <div class="control-group">
				<label class="control-label">Observa��es</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="obs" name="obs" type="text" 
					placeholder="Observa��es" onkeyup="limite_textarea_obs(this.value)"
						class="input-xlarge">${solicitacao.obs}</textarea>
					<span id="contObs">255</span> Restantes <br>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Categoria
					<a class="dcontexto"> (?)
					<span>Hardware - Problema f�sico no equipamento. <br><br> 
						Software - Problema l�gico no equipamento. <br><br> 
						Rede - Problemas de conex�o. <br><br>
						Cabeamento - Servi�os de cabeamento estruturado
					</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="classificacao"
						name="classificacao">
						<option>${solicitacao.classificacao}</option>
						<option></option>
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
				<label class="control-label">Classifica��o
					<a class="dcontexto"> (?)
					<span>Problema - Algo que � recorrente <br> Incidente - Algo n�o recorrente <br> Evento - Planejado</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="nivelDeIncidencia"
						name="nivelDeIncidencia">
						<option>${solicitacao.nivelDeIncidencia}</option>
						<option></option>
						<option>Problema</option>
						<option>Incidente</option>
						<option>Solicita��o</option>
						<option>Backup</option>
					</select>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Alta - 2 Horas <br> M�dia - 24 Horas <br> Baixa - 72 Horas <br> Planejada - Evento Plavejado</span>
				</a></label> 
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade">
						<option>${solicitacao.prioridade}</option>
						<option></option>
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
						<option></option>
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
				<label class="control-label">Funcion�rio Respons�vel</label>
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
	<script>
		function copiaSolicitante(){
			var solicitante = $('#solicitante').val();
			$('#usuario').val(solicitante);
		}
	</script>
</html>