<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Modelo de Solicitacao</title>
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
	<form action="salvarSolicitacaoModelo" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Solicitação de Atendimento</legend>
			<p class="pull-right">
				<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			
			<div class="control-group">
				<label class="control-label">Tipo de Solicitação</label>
				<div class="controls">
					<select class="selectpicker" id="classificacao"
						name="classificacao">
						<option>Entrada de Colaborador</option>
						<option>Saída de Colaborador</option>
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
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
					<span id="flag" style="font-size: 20px ;color:red ; font-weight:bold"></span>
					<span id="vip" style="font-size: 18px ;color:#04B404 ; font-weight:bold"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label">Solicitante</label> 
	            <div class="controls">
	                <select class="form-control solicitante" name="solicitante" id="solicitante"></select>
	            	<span id="cargoSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	                <span id="celularSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	            </div>
        	</div>
        	<br/>
        	<div class="form-group">
				<label class="control-label">Usuário Afetado</label>
	            <div class="controls">
	                <select class="form-control usuario" name="usuario" id="usuario"></select>
	                <span id="cargoUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	                <span id="celularUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	                <p class="help-block">* Campo Obrigatório</p>
	            </div>
        	</div>
			<br/>
			
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Crítico - 2 Horas. <br> Alta - 4 Horas. <br> Média - 24 Horas. <br> Baixa - 48 Horas. <br> Planejada - Evento Planejado.</span>
				</a></label>
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade">
						<option></option>
						<option>Crítico</option>
						<option>Alta</option>
						<option>Media</option>
						<option>Baixa</option>
						<option>Planejada</option>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Técnico Responsável</label>
				<div class="controls">
					<select class="selectpicker alertaFuncionario" id="nomeDoFuncionario"
						name="nomeDoFuncionario">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			
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
	<script src="assets/js/controle-vip.js"></script>
</html>