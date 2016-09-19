<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

    
	<title>ProviderOne | Configuração de Envio de E-mail</title>	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="salvarConfigEmail" method="get" class="form-horizontal container">
		<fieldset>
			<legend>Configuração de envio de E-mail</legend>
			
			
			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="email" name="email" type="text" placeholder="E-mail" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input id="senha" name="senha" type="password" placeholder="Senha" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Servidor SMTP</label>
				<div class="controls">
					<input id="smtp" name="smtp" type="text" placeholder="Servidor SMTP" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Porta SMTP</label>
				<div class="controls">
					<input id="portaSmtp" name="portaSmtp" type="text" placeholder="Porta SMTP" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Requer Autenticação</label>
				<div class="controls">
					<select class="selectpicker" id="autenticacao"
						name="autenticacao">
						<option></option>
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
						<option></option>
						<option>true</option>
						<option>false</option>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Assunto</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="assunto" name="assunto" type="text" placeholder="Assunto do e-Mail"
						class="input-xlarge"></textarea>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Mensagem</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="mensagem" name="mensagem" type="text" placeholder="Mensagem do e-Mail"
						class="input-xlarge"></textarea>
				</div>
			</div>
					
			
			<div class="control-group">
				<label class="control-label">Função do E-mail</label>
				<div class="controls">
					<select class="selectpicker" id="funcaoDoEmail"
						name="funcaoDoEmail">
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
</html>