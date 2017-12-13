<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   	<title>ProviderOne | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
		<div class="container">
		<fieldset>
			<legend>Log de solicitação</legend>
			<div class="container">
				<div class="col-xs-12 col-md-6">
					<textarea class="form-control" rows="30" style="width: 640px; height: 557px;">
						${solicitacao.andamentoDoChamado}
					</textarea>
				</div>
			</div>
			<legend></legend>
		</fieldset>
		</div>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>