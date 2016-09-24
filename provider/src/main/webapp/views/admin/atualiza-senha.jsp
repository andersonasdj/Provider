<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Dados</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br /><br />
	<form action="atualizarMinhaSenha" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Atualizar Senha</legend>
			
			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input id="novaSenha" name="novaSenha" type="password"
						class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Confirma senha</label>
				<div class="controls">
					<input id="confirmaSenha" name="confirmaSenha" type="password"
						class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			
			<input type="hidden" id="id" name="id" value="${funcionarioLogado.id}">
			<input type="hidden" id="nome" name="nome" value="${funcionarioLogado.nome}">
			<input type="hidden" id="usuario" name="usuario" value="${funcionarioLogado.usuario}">
			<input type="hidden" id="senha" name="senha" value="${funcionarioLogado.senha}">
			<input type="hidden" id="funcao" name="funcao" value="${funcionarioLogado.funcao}">
			<input type="hidden" id="email" name="email" value="${funcionarioLogado.email}">
			<input type="hidden" id="status" name="status" value="${funcionarioLogado.status}">
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="homePage" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>	
		</fieldset>
	</form>	
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>