<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
   	<title>ProviderOne | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/style.css">
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
			<legend>Classificação de solicitação</legend>
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
					<input  type="text" placeholder="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.dataAbertura.time}"  />"
						disabled="disabled">
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
				<label class="control-label">Usuario Afetado</label>
				<div class="controls">
					<input id="usuario" name="usuario" type="text"
						value="${solicitacao.usuario}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Descrição do problema</label>
				<div class="controls">
					<input id="descricaoProblema" name="descricaoProblema" type="text"
						value="${solicitacao.descricaoProblema}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Resolução do problema</label>
				<div class="controls">
					<input id="resolucao" name="resolucao" type="text"
						value="${solicitacao.resolucao}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<input id="obs" name="obs" type="text"
						value="${solicitacao.obs}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações 2</label>
				<div class="controls">
					<input id="obs2" name="obs2" type="text"
						value="${solicitacao.obs2}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
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
						name="classificacao" disabled="disabled">
						<option>${solicitacao.classificacao}</option>
						<option>Hardware</option>
						<option>Software</option>
						<option>Rede</option>
						<option>Cabeamento</option>
						<option>Smartphone</option>
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
					<select class="selectpicker" id="nivelDeIncidencia"
						name="nivelDeIncidencia" disabled="disabled">
						<option>${solicitacao.nivelDeIncidencia}</option>
						<option>Incidente</option>
						<option>Problema</option>
						<option>Evento</option>
					</select>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Alta - 2 Horas <br> Média - 24 Horas <br> Baixa - 72 Horas <br> Planejada - Evento Plavejado</span>
				</a></label> 
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade" disabled="disabled">
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
						name="onsiteOffsite" disabled="disabled">
						<option>${solicitacao.onsiteOffsite}</option>
						<option>Onsite</option>
						<option>Offsite</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data de Agendamento</label>
				<div class="controls">
					<input id="datepicker" name="agendado" type="text" placeholder="Data de agendamento" maxlength="10"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.agendado.time}" />" disabled="disabled"/>
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label">Hora de Agendamento</label>
				<div class="controls">
					<input id="timepicker" name="agendadoHora" type="text" placeholder="Hora de agendamento" maxlength="10"
						value="<f:formatDate pattern="HH:mm" value="${solicitacao.agendadoHora.time}" />" disabled="disabled"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Funcionário Responsável</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoFuncionario"
						name="nomeDoFuncionario" disabled="disabled">
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
						name="status" disabled="disabled">
						<option>${solicitacao.status}</option>
						<option>Finalizar</option>
						<c:if test="${solicitacao.status != 'Agendado'}">
							<option>Agendado</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aberto'}">
							<option>Aberto</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Em andamento'}">
							<option>Em andamento</option>
						</c:if>	
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar</a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>