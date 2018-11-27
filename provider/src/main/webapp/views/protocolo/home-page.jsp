<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Protocolo</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/protocolo.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<style type="text/css">
		.azul {color: #0000FF;}
		.amarelo {color: #FF8000;}
		.vermelho {color: #FF0000;}
		.verde {color: #04B404;}
	</style>
</head>
<body class="fundo">
	<br/><br/>
	<div class="container base">
	<div class="text-center"><h1>${protocoloValido.cliente.nome}</h1></div> 
		<br/>
			<div class="text-left fonte-letras">
				<br/>
				<ul>
					<li class="espacamento"><b>ID: </b> ${protocoloValido.id}</li>
  					<li class="espacamento"><b>Data de Abertura: </b> ${protocoloValido.dataAbertura.time}</li>
  					<li class="espacamento"><b>Aberto Por: </b> ${protocoloValido.abriuChamado}</li>
  					<c:if test="${not empty protocoloValido.solicitante}"><li class="espacamento"><b>Solicitado Por: </b> ${protocoloValido.solicitante}</li></c:if>
  					<li class="espacamento"><b>Usuário afetado: </b> ${protocoloValido.usuario}</li>
  					<li class="espacamento"><b>Descrição do Problema: </b> ${protocoloValido.descricaoProblema}</li>
  					<c:if test="${not empty protocoloValido.obs}"><li class="espacamento"><b>Observação: </b> ${protocoloValido.obs}</li></c:if>
  					<c:if test="${not empty protocoloValido.formaAbertura}"><li class="espacamento"><b>Forma de Abertura: </b> ${protocoloValido.formaAbertura}</li></c:if>
  					<c:if test="${not empty protocoloValido.onsiteOffsite}"><li class="espacamento"><b>Local: </b> ${protocoloValido.onsiteOffsite}</li></c:if>
  					<c:if test="${not empty protocoloValido.nivelDeIncidencia}"><li class="espacamento"><b>Classificação: </b> ${protocoloValido.nivelDeIncidencia}</li></c:if>
  					<c:if test="${not empty protocoloValido.funcionario.nome}"><li class="espacamento"><b>Técnico Resposável: </b> ${protocoloValido.funcionario.nome}</li></c:if>
  					
  					<c:if test="${protocoloValido.status == 'Agendado'}"> 
  						<li class="espacamento"><b>Status: </b> <span class="amarelo">  ${protocoloValido.status}</span>
  							<ul>
  								<li class="espacamento"><b>Data de Agendamento: </b> <f:formatDate value="${protocoloValido.agendado.time}" pattern="dd/MM/yyyy"/></li>
  								<li class="espacamento"><b>Hora de Agendamento: </b> <f:formatDate value="${protocoloValido.agendadoHora.time}" pattern="HH:mm"/></li>
  							</ul>
  						</li>
  					</c:if>
  					
  					<c:if test="${protocoloValido.status == 'Finalizado'}">
  						<li class="espacamento"><b>Status: </b><span class="verde">  ${protocoloValido.status}</span>
  							<ul>
  								<li class="espacamento"><b>Resolução: </b> ${protocoloValido.resolucao} </li>
  								<li class="espacamento"><b>Tempo total de Atendimento: </b> ${protocoloValido.tempoDeAndamento} </li>
  							</ul>
  						</li>
  						
  					</c:if>
  					
  					<c:if test="${protocoloValido.status == 'Aberto'}">
  						<li class="espacamento"><b>Status: </b><span class="vermelho"> ${protocoloValido.status} </span></li>
  					</c:if>
  					
  					<c:if test="${protocoloValido.status == 'Em andamento'}">
  						<li class="espacamento"><b>Status: </b><span class="azul">${protocoloValido.status}</span>
  							<ul>
  								<li class="espacamento"><b>Inicio do atendimento: </b><f:formatDate value="${protocoloValido.dataAndamento.time}" pattern="dd/MM/yyyy HH:mm:ss"/></li>
  							</ul>
  						</li>
  					</c:if>
				</ul>
			</div>

			<div class="text-center">
				<br/>
				<img src="assets/img/logo_provider.png" alt="providerone" class="img-rounded">
				<p>ProviderOne</p> 
				<p>(21) 2262.4275</p>
				<p><a href="#" target="_top">suporte@providerone.com.br</a></p>
			</div> 
	</div>
	<br/><br/><br/><br/><br/><br/>
	<div class="container">
	<legend></legend>
	</div>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>