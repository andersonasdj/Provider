<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Configuração de Envio de E-mail</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="atualizarConfigEmail" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Configuração de envio de E-mail</legend>
			<input type="hidden" id="id" name="id" value="${emailConfig.id}">
			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="email" name="email" type="text" placeholder="E-mail" 
					value="${emailConfig.email}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input id="senha" name="senha" type="password" placeholder="Senha"
					value="${emailConfig.senha}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Servidor SMTP</label>
				<div class="controls">
					<input id="smtp" name="smtp" type="text" placeholder="Servidor SMTP"
					value="${emailConfig.smtp}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Porta SMTP</label>
				<div class="controls">
					<input id="portaSmtp" name="portaSmtp" type="text" placeholder="Porta SMTP"
					value="${emailConfig.portaSmtp}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Requer Autenticação</label>
				<div class="controls">
					<select class="selectpicker" id="autenticacao"
						name="autenticacao">
						<option>${emailConfig.autenticacao}</option>
						<option>true</option>
						<option>false</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">SSL</label>
				<div class="controls">
					<select class="selectpicker" id="sslStatus"
						name="sslStatus">
						<option>${emailConfig.sslStatus}</option>
						<option>true</option>
						<option>false</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Assunto</label>
				<div class="controls">
					<input class="form-control" id="assunto" name="assunto" type="text"
					value="${emailConfig.assunto}" placeholder="Assunto do e-Mail"
						class="input-xlarge"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Cópia Para</label>
				<div class="controls">
					<input class="form-control" id="cc" name="cc" type="text"
					value="${emailConfig.cc}" placeholder="Recebe uma cópia"
						class="input-xlarge"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Mensagem</label>
				<div class="controls">
					<input class="form-control" id="mensagem" name="mensagem" type="text"
					value="${emailConfig.mensagem}" placeholder="Mensagem do e-Mail"
						class="input-xlarge"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Função do E-mail</label>
				<div class="controls">
					<select class="selectpicker" id="funcaoDoEmail"
						name="funcaoDoEmail">
						<option>${emailConfig.funcaoDoEmail}</option>
						<option>Abertura</option>
						<option>Encerramento</option>
						<option>Agendamento</option>
					</select>
				</div>
			</div>
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
	<script src="assets/js/bootstrap.min.js"></script>
</html>