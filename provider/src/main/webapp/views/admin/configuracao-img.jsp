<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Configuração caminho de imagem</title>	
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
	<form action="salvarConfigImg" method="get" class="form-horizontal container">
		<fieldset>
			<legend>Configuração padrão de caminho de imagens</legend>
			<div class="control-group">
				<label class="control-label">Caminho raiz</label>
				<div class="controls">
					<input id="caminho" name="caminho" type="text" placeholder="Caminho raiz" class="input-xlarge" required>
					<small>EX: C:\Users\Sisgold\Documents\Projetos\SisGold\Sisgold\src\main\webapp\assets\img\perfil\</small>
					<p class="help-block">* Campo Obrigatório</p>
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