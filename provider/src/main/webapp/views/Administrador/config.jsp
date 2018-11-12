<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Início</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
		<fieldset></fieldset>
		<div class="container">
			<legend>Configurações do Sistema</legend>
			<p class="pull-right">
			<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
					<br/><br/>
					<p><span>Configuração de envio de E-mail SMTP: </span><a class="btn btn-info" href="configEmail" role="button"> Editar</a></p>
					<br/>
					<p><span>Configuração de caminho raiz de imagem: </span><a class="btn btn-info" href="configImg" role="button"> Editar</a></p>
				<br/>
				</div>
			<legend></legend>
		</div>
	<c:import url="rodape.jsp"></c:import>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>