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
			<legend>Configurações do Sistema</legend>
				<div align="left">
					<div id="">
						<br/><br/>
						<p><span>Configuração de envio de E-mail: </span><a class="btn btn-info" href="configEmail" role="button"> Editar</a></p>
						<p><span>Configuração de caminho raiz de imagem: </span><a class="btn btn-info" href="configImg" role="button"> Editar</a></p>
					</div>
					<br/>
				</div>
			<legend></legend>
	<c:import url="rodape.jsp"></c:import>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>