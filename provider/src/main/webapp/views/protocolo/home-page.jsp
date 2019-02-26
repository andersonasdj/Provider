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
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<style type="text/css">
		.azul {color: #0000FF;}
		.amarelo {color: #FF8000;}
		.vermelho {color: #FF0000;}
		.verde {color: #04B404;}
		
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
  					
  					<c:if test="${protocoloValido.status == 'Finalizado'}">
  						<br/><br/>
  						<form action="atualizarSolicitacaoCompleta" method="post" class="form-horizontal container">
	  						
	  						<input id="id" name="id" type="hidden" value="${protocoloValido.id}">
	  						<label class="control-label">Classificação</label>
								<div class="controls">
									<div class="estrelas">
										<input type="radio" id="cm_star-empty" name="estrela" value=""
											<c:if test="${empty solicitacao.estrela}" >
												checked="checked"
											</c:if>/>
										<label id="idEstrelaLinha" for="cm_star-1"><i class="fa fa-2x"> </i></label>
										<input type="radio" id="cm_star-1" name="estrela" value="1"
											<c:if test="${solicitacao.estrela == 1}" >
												checked="checked"
											</c:if>/>
									  	<label id="idEstrelaLinha" for="cm_star-2"><i class="fa fa-2x"> </i></label>
										<input type="radio" id="cm_star-2" name="estrela" value="2" 
											<c:if test="${solicitacao.estrela == 2}" >
												checked="checked"
											</c:if>/>
									  	<label id="idEstrelaLinha" for="cm_star-3"><i class="fa fa-2x"> </i></label>
									  	<input type="radio" id="cm_star-3" name="estrela" value="3"
									  		<c:if test="${solicitacao.estrela == 3}" >
												checked="checked"
											</c:if>/>
									  	<label id="idEstrelaLinha" for="cm_star-4"><i class="fa fa-2x"> </i></label>
									  	<input type="radio" id="cm_star-4" name="estrela" value="4"
									  		<c:if test="${solicitacao.estrela == 4}" >
												checked="checked"
											</c:if>/>
									  	<label id="idEstrelaLinha"for="cm_star-5"><i class="fa fa-2x"> </i></label>
									  	<input type="radio" id="cm_star-5" name="estrela" value="5"
									  		<c:if test="${solicitacao.estrela == 5}" >
												checked="checked"
											</c:if>/>
									</div>
								</div>
								
								<br/><br/>
								<div class="control-group">
									<label class="control-label">Comentários</label>
									<div class="controls">
										<textarea class="form-control" rows="10" cols="" id="comentario" name="comentario" type="text" 
										placeholder="Comentários" onkeyup="limite_textarea_obs(this.value)"
											class="input-xlarge">${solicitacao.comentario}</textarea>
										<span id="contComentario">255</span> Restantes <br>
									</div>
								</div>
								<div class="controls">
									<button id="enviar" name="enviar" class="btn btn-success">Enviar <i class="fa fa-floppy-o fa-lg"></i></button>
								</div>
							</form>
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
	<script>
		function limite_textarea_obs(valor) {
		    quant = 255;
		    total = valor.length;
		    if(total <= quant) {
		        resto = quant - total;
		        document.getElementById('contComentario').innerHTML = resto;
		    } else {
		        document.getElementById('comentario').value = valor.substr(0,quant);
		    }
		}
	</script>
</body>
</html>