<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Dados</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br /><br />
	<form action="atualizar" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Atualizar meus Dados</legend>
			
			<div class"container">
			    <div class="row">
			        <div class="col-md-8">
			        	<a href="upload" >
							<c:if test="${empty funcionarioLogado.caminhoFoto}">
								<img id="imagem" src="assets/img/perfil.png" class="img-polaroid">
							</c:if>
							<c:if test="${not empty funcionarioLogado.caminhoFoto}">
								<img id="imagem" src='${funcionarioLogado.caminhoFoto}' class="img-polaroid">
							</c:if>
						</a>
			        </div>
			       
			        <div class="col-md-4"> 
			        	<div>
							<div>
								<input id="id" name="id" type="hidden"
									value="${funcionarioLogado.id}">
							</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">Nome</label>
						<div class="controls">
							<input id="nome" name="nome" type="text"
								value="${funcionarioLogado.nome}" class="input-xlarge" required>
							<p class="help-block">* Campo Obrigatório</p>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Usuario</label>
						<div class="controls">
							<input id="nome" name="usuario" type="text"
								value="${funcionarioLogado.usuario}" class="input-xlarge" required>
							<p class="help-block">* Campo Obrigatório</p>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Senha</label>
						<div class="controls">
							<a class="btn" href="atualizarSenha" role="button">Alterar</a>
							<input type="hidden" id="senha" name="senha" value="${funcionarioLogado.senha}">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Função </label>
						<div class="controls">
							<select class="selectpicker" id="nome" name="funcao">
								<option>${funcionarioLogado.funcao}</option>
								
								<c:if test="${funcionarioLogado.funcao == 'Administrador'}">
									<option>Tecnico</option>
								</c:if>
								<c:if test="${funcionarioLogado.funcao == 'Tecnico'}">
									<option>Administrador</option>
								</c:if>				
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">E-mail</label>
						<div class="controls">
							<input id="nome" name="email" type="text"
								value="${funcionarioLogado.email}" class="input-xlarge" required>
							<p class="help-block">* Campo Obrigatório</p>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Status </label>
						<div class="controls">
							<select class="selectpicker" id="status" name="status">
								<option>${funcionarioLogado.status}</option>
								<c:if test="${funcionarioLogado.status == 'Ativo'}">
									<option>Inativo</option>
								</c:if>
								<c:if test="${funcionarioLogado.status == 'Inativo'}">
									<option>Ativo</option>
								</c:if>
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
			        
			        </div>
			    </div>
			</div>
		</fieldset>
	</form>	
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>