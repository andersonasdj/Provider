<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<title>ProviderOne | Auto Atendimento</title>
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
		<form action="atualizarCliente" method="post"
			class="form-horizontal container">
			<br />
			<div class="text-left fonte-letras">
				<br />
				<ul>
					<li class="espacamento"><b>Nome: </b> ${nome}</li>
					<li class="espacamento"><b>Email: </b> ${email}</li>
					<li class="espacamento"><b>Celular: </b> ${celular}</li>
					<li class="espacamento"><b>Opção: </b> ${opcao}</li>
					<li class="espacamento"><b>Classificação: </b> ${opcao2}</li>
				</ul>


				
			</div>
		</form>
		<div class="text-center">
			<br /> <img src="assets/img/logo_provider.png" alt="providerone"
				class="img-rounded">
			<p>ProviderOne</p>
			<p>(21) 2262.4275</p>
			<p>
				<a href="#" target="_top">suporte@providerone.com.br</a>
			</p>
		</div>
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