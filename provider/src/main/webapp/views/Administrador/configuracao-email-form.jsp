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
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="salvarConfigEmail" method="post" class="form-horizontal container">
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
				<label class="control-label">Cópia para</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="cc" name="cc" type="text" placeholder="Recebe uma cópia"
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
			<!-- ASSINATURA DE EMAIL  -->
			<div class="control-group">
				<label class="control-label">Nome na Assinatura</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="nomeAssinatura" name="nomeAssinatura" type="text" placeholder="Nome na assinatura"
						class="input-xlarge"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telefone na Assinatura</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="numeroAssinatura" name="numeroAssinatura" type="text" placeholder="Numero na assinatura"
						class="input-xlarge"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">E-mail na Assinatura</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="emailAssinatura" name="emailAssinatura" type="text" placeholder="E-mail na assinatura"
						class="input-xlarge"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Link de Domínio</label>
				<div class="controls">
					<input id="linkDominio" name="linkDominio" type="text" placeholder="Link de Domínio" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<!-- ASSINATURA DE EMAIL  -->
			<div class="control-group">
				<label class="control-label">Função do E-mail</label>
				<div class="controls">
					<select class="selectpicker" id="funcaoDoEmail"
						name="funcaoDoEmail">
						<option>Abertura</option>
						<option>MFA</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="config" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
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