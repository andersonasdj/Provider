<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Solicitação de Suporte</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="salvarSolicitacao" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Solicitação de Atendimento</legend>
			<p class="pull-right">
				<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Forma de Abertura</label>
				<div class="controls">
					<select class="selectpicker" id="formaAbertura"
						name="formaAbertura">
						<option></option>
						<option>Helpdesk</option>
						<option>E-mail</option>
						<option>Whatsapp</option>
						<option>No local</option>
						<option>
					</select>
				</div>
			</div> 
			<div class="control-group">	
				<div class="controls">
					<input id="dataAbertura" name="dataAbertura" type="hidden" value="<%= Calendar.getInstance()%>" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Solicitante</label>
				<div class="controls">
					<input id="solicitante" name="solicitante" type="text" placeholder="Quem solicitou" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario Afetado</label>
				<div class="controls">
					<input id="usuario" name="usuario" type="text" placeholder="Usuário" class="input-xlarge" required>
					<a href="javascript:func()" id="copy" onclick="copiaSolicitante()"><i class="fa fa-files-o fa-lg" aria-hidden="true"></i></a>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Problema Relatado</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="descricaoProblema" name="descricaoProblema" type="text" placeholder="Problema Relatado" 
						onkeyup="limite_textarea_prob(this.value)" class="input-xlarge" required></textarea>
					<span id="contProb">255</span> Restantes <br>
					<p class="help-block">* Campo Obrigatório</p>
					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="obs" name="obs" type="text" placeholder="Observações da solicitação"
						value="${solicitacao.obs}" onkeyup="limite_textarea_obs(this.value)" class="input-xlarge"></textarea>
						<span id="contObs">255</span> Restantes <br>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Categoria
					<a class="dcontexto"> (?)
					<span>Hardware - Problema físico no equipamento. <br><br>
						Software - Problema lógico no equipamento. <br><br>
						Rede - Problemas de conexão. <br><br>
						Cabeamento - Serviços de cabeamento estruturado.
					</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="classificacao"
						name="classificacao">
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
				<label class="control-label">Classificação
					<a class="dcontexto"> (?)
					<span>Problema - Algo que é recorrente. <br> Incidente - Algo não recorrente. <br> Solicitação - Planejado.</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="nivelDeIncidencia"
						name="nivelDeIncidencia">
						<option></option>
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
					<span>Alta - 2 Horas. <br> Média - 24 Horas. <br> Baixa - 72 Horas. <br> Planejada - Evento Planejado.</span>
				</a></label>
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade">
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
					<span>Onsite - Atendimento no local. <br> Offsite - Atendimento remoto.</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="onsiteOffisite"
						name="onsiteOffsite">
						<option></option>
						<option>Onsite</option>
						<option>Offsite</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Funcionário Responsável</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoFuncionario"
						name="nomeDoFuncionario">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status"
						name="status">
						<option>Abrir</option>
						<option>Em andamento</option>
						<option>Agendar</option>
					</select>
				</div>
			</div>
			<div id="agendamentos">
				<div class="control-group" id="opAgendamentoData">
					<label class="control-label">Data de Agendamento</label>
					<div class="controls">
						<input id="datepicker" name="agendado" type="text" placeholder="Data de agendamento" maxlength="10"
							value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.agendado.time}" />" /> <i class="fa fa-calendar fa-lg"> </i>
					</div>
				</div>
				<div class="control-group" id="opAgendamentoHora">
					<label class="control-label">Hora de Agendamento</label>
					<div class="controls">
						<input id="timepicker" name="agendadoHora" type="text" placeholder="Hora de agendamento" maxlength="10"
							value="<f:formatDate pattern="HH:mm" value="${solicitacao.agendadoHora.time}" />" /> <i class="fa fa-clock-o fa-lg"> </i>
					</div>
				</div>
			</div>
			<div class="form-check">
			    <label class="form-check-label">
			    	Enviar E-mail na abertura
			      <input id="boxEmail" name="boxEmail" type="checkbox" class="form-check-input">
			    </label>
			    
			    <div id="enviaEmail">
					<input id="destinatario" name="destinatario" type="text" placeholder="E-mail do Cliente" class="input-xlarge" style="display: none">
					<p class="help-block"></p>
				</div>
			</div>
			<br/>
			<input type="hidden" name="abriuChamado" id="abriuChamado" value="${funcionarioLogado.nome}">
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="homePage" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
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
	<script>
		var divStatus = $("#status");
		var status = $("#status").val();
		divStatus.on("change", function(){
			var status = $("#status").val();
			if(status === 'Abrir'){
				//document.getElementById('agendamentos').style.display = 'none';
				//$("#agendamentos").stop().slideToggle(1000);
				document.getElementById('agendamentos').style.display = 'none';
			}else if(status === 'Em andamento'){
				document.getElementById('agendamentos').style.display = 'none';
				//document.getElementById('agendamentos').style.display = 'none';
			}else {
				//document.getElementById('agendamentos').style.display = 'block';
				$("#agendamentos").stop().slideToggle(1000);
			}
		} );
	</script>
	
    <script type="text/javascript">
	    function limite_textarea_prob(valor) {
	        quant = 255;
	        total = valor.length;
	        if(total <= quant) {
	            resto = quant - total;
	            document.getElementById('contProb').innerHTML = resto;
	        } else {
	            document.getElementById('descricaoProblema').value = valor.substr(0,quant);
	        }
	    }
    </script>
    <script type="text/javascript">
	    function limite_textarea_obs(valor) {
	        quant = 255;
	        total = valor.length;
	        if(total <= quant) {
	            resto = quant - total;
	            document.getElementById('contObs').innerHTML = resto;
	        } else {
	            document.getElementById('obs').value = valor.substr(0,quant);
	        }
	    }
    </script>
    <script>
		var divEmail = $("#boxEmail");
		var email = $("#destinatario").val();
		divEmail.on("change", function(){
			var email = $("#destinatario").val();
				$("#destinatario").stop().slideToggle(500);
				document.getElementById('destinatario').style.display = 'block';
		
		} );
	</script>
	<script>
		function copiaSolicitante(){
			var solicitante = $('#solicitante').val();
			$('#usuario').val(solicitante);
		}
	</script>
</html>