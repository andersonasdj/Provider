<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<title>ProviderOne | Auto Atendimentoes</title>
<link rel="shortcut icon" href="assets/img/ico.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/protocolo.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
<style type="text/css">
.azul {
	color: #0000FF;
}

.amarelo {
	color: #FF8000;
}

.vermelho {
	color: #FF0000;
}

.verde {
	color: #04B404;
}

.estrelas input[type=radio] {
	display: none;
}

.estrelas label i.fa:before {
	content: '\f005';
	color: #FC0;
}

.estrelas input[type=radio]:checked ~ label i.fa:before {
	color: #CCC;
}

#idEstrelaLinha {
	float: left;
}
</style>
</head>
<body class="fundo">
	<br />
	<br />
	<div class="container base">
		<div class="text-center">
			<h1>${funcionario.cliente.nome}</h1>
		</div>
		<form action="avancarSuporte" method="post" class="form-horizontal container">
			<br />
			<div class="text-left fonte-letras">
				<input type="hidden" id="nome" name="nome" value="${funcionario.nome}">
				<input type="hidden" id="email" name="email" value="${funcionario.email}">
				<input type="hidden" id="celular" name="celular" value="${funcionario.celular}">
				<input type="hidden" id="setor" name="setor" value="${setor}">
				<br />
				<ul>
					<li class="espacamento"><b>Nome: </b> ${funcionario.nome}</li>
					<li class="espacamento"><b>Email: </b> ${funcionario.email}</li>
					<li class="espacamento"><b>Celular: </b> ${funcionario.celular}</li>
					<li class="espacamento"><b>Classificação: </b> ${setor}</li>
				</ul>
				<div class="control-group">
					<label class="control-label"><b>E-mail</b></label>
					<div class="controls">
						<input name="classificacao" type="radio" value="Email"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Computador / Notebook</b></label>
					<div class="controls">
						<input name="classificacao" type="radio" value="Computador / Notebook"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Internet / Acesso externo</b></label>
					<div class="controls">
						<input name="classificacao" type="radio" value="Acesso externo"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Cotação</b></label>
					<div class="controls">
						<input name="classificacao" type="radio" value="Cotação"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>SharePoint</b></label>
					<div class="controls">
						<input name="classificacao" type="radio" value="SharePoint"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Certificado Digital</b></label>
					<div class="controls">
						<input name="classificacao" type="radio" value="Certificado Digital"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
					<button id="avancar" name="Avancar" class="btn btn-success">Avancar</button>
				</div>
			</div>
		</form>
	</div>
	<div class="text-center">
		<br /> <img src="assets/img/logo_provider.png" alt="providerone"
			class="img-rounded">
		<p>ProviderOne</p>
		<p>(21) 2262.4275</p>
		<p>
			<a href="#" target="_top">suporte@providerone.com.br</a>
		</p>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">

		<legend></legend>
	</div>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
		
	</script>
</body>
</html>