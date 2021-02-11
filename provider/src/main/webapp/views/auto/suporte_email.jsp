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
		<form action="salvarSuporte" method="post"
			class="form-horizontal container">
			<br />
			<div class="text-left fonte-letras">
				<input type="hidden" id="nome" name="nome" value="${funcionario.nome}">
				<input type="hidden" id="email" name="email" value="${funcionario.email}">
				<input type="hidden" id="celular" name="celular" value="${funcionario.celular}">
				<input type="hidden" id="classificacao" name="classificacao" value="${classificacao}">
				<input type="hidden" id="setor" name="setor" value="${setor}">
				<br />
				<ul>
					<li class="espacamento"><b>Nome: </b> ${funcionario.nome}</li>
					<li class="espacamento"><b>Email: </b> ${funcionario.email}</li>
					<li class="espacamento"><b>Celular: </b> ${funcionario.celular}</li>
					<li class="espacamento"><b>Opção: </b> ${setor}</li>
					<li class="espacamento"><b>Classificação: </b> ${classificacao}</li>
				</ul>

				<div class="control-group">
					<label class="control-label"><b>Senha expirada</b></label>
					<div class="controls">
						<input name="classproblema" type="radio" value="Senha expirada"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Erro de sincronização</b></label>
					<div class="controls">
						<input name="classproblema" type="radio" value="Erro de sincronização"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Outlook não abre</b></label>
					<div class="controls">
						<input name="classproblema" type="radio" value="Outlook não abre"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Retorno de erro</b></label>
					<div class="controls">
						<input name="classproblema" type="radio" value="Retorno de erro"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Ajustes de assinatura e padrões do escritório</b></label>
					<div class="controls">
						<input name="classproblema" type="radio" value="Ajustes de assinatura e padrões do escritório"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><b>Configuração ou reconfiguração</b></label>
					<div class="controls">
						<input name="classproblema" type="radio" value="Configuração ou reconfiguração"
							class="form-check-input" class="input-xlarge">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label"><b>Observações</b></label>
					<div class="controls">
						<textarea class="form-control" rows="4" id="obs" name="obs" type="text" placeholder="Observações da solicitação"
							value="${solicitacao.obs}" onkeyup="limite_textarea_obs(this.value)" class="input-xlarge"></textarea>
							<span id="contObs">255</span> Restantes <br>
					</div>
				</div>
				<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
						<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
						<button id="avancar" name="Avancar" class="btn btn-success">Enviar</button>
				</div>
			</div>
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
	
    	function limite_textarea_obs(valor) {
        quant = 255;
        total = valor.length;
        if(total <= quant) {
            resto = quant - total;
            document.getElementById('contObs').innerHTML = resto;
        } else {
            document.getElementById('obs').value = valor.substr(0,quant);
        }
    }
</script>

</body>
</html>