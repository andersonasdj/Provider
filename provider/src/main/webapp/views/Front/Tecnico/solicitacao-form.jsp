<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="asset/css/stylePersonal.css">
	<!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	
	<title>ProviderOne | Funcionario Edit</title>
</head>

<body>
	<div class="container">
		<br />
		<!-- ################### BARRA DE NAVEGAÇÃO -->
		<nav class="navbar navbar-expand-lg bg-light" >
			<div class="container-fluid">
				<a class="navbar-brand" href="homePage"><img src="asset/img/key.png" style="height: 18px;"> <span style="color: #000080	">ProviderOne</span></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="homePage">Início</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">
								Solicitações
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="solicitacaoForm">Abrir Solicitação</a></li>
								<li><a class="dropdown-item" href="solicitacaoModeloForm">Modelos Solicitações</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="solicitacoesAbertas">Abertas</a></li>
								<li><a class="dropdown-item" href="solicitacoesAgendadas">Agendadas</a></li>
								<li><a class="dropdown-item" href="solicitacoesAndamento">Em Andamento</a></li>
								<li><a class="dropdown-item" href="solicitacoesAguardando">Aguardando usuário</a></li>
								<li><a class="dropdown-item" href="relatorioGeral">Resumo Geral</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="relatorioOp">Relatório</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">
								Clientes
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="clientesList">Listar</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">
								Usuários
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="funcionariosList">Listar</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">
								Backup
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="backupDiario">Listar</a></li>
							</ul>
						</li>
					</ul>
					<ul class="navbar-nav mb-3 mb-lg-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><b>${funcionarioLogado.usuario}</b></a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="config">Configurações</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="atualizarDados">Atualizar Dados</a></li>
							</ul>
						</li>
							<a href="logout">
								 <img src="asset/img/logout.png" style="width: 30px; border: none;" >
							</a>
					</ul>
				</div>
			</div>
		</nav>
		<!-- ################### BARRA DE NAVEGAÇÃO  -->
		
		<hr class="bg-danger border-2 border-top border-danger">
		
		
		<form action="salvarSolicitacao" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Solicitação de Atendimento</legend>
			<p class="pull-right">
				<a href="homePage"><i class="fas fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="form-select" id="nomeDoCliente"
						name="nomeDoCliente" style="width: 250px;">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
					<span id="flag" style="font-size: 20px ;color:red ; font-weight:bold"></span>
					<span id="vip" style="font-size: 18px ;color:#04B404 ; font-weight:bold"></span>
				</div>
			</div><br/>
			<div class="control-group">
				<label class="control-label">Forma de Abertura</label>
				<div class="controls">
					<select class="form-select" id="formaAbertura"
						name="formaAbertura" style="width: 150px;">
						<option></option>
						<option>Helpdesk</option>
						<option>E-mail</option>
						<option>Whatsapp</option>
						<option>No local</option>
						<option>
					</select>
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label class="control-label">Solicitante</label> 
	            <div class="controls">
	                <select class="form-control solicitante" name="solicitante" id="solicitante" style="width: 250px;"></select>
	            	<span id="cargoSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	                <span id="celularSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	            </div>
        	</div>
        	<br/>
        	<div class="form-group">
				<label class="control-label">Usuário Afetado</label>
	            <div class="controls">
	                <select class="form-control usuario" name="usuario" id="usuario" style="width: 250px;"></select>
	                <span id="cargoUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	                <span id="celularUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	                <p class="help-block">* Campo Obrigatório</p>
	            </div>
        	</div>
			<br/>
			<div class="control-group">
				<label class="control-label">Problema Relatado</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="descricaoProblema" name="descricaoProblema" type="text" placeholder="Problema Relatado" 
						onkeyup="limite_textarea_prob(this.value)" style="width: 300px;" class="input-xlarge" required></textarea>
					<span id="contProb">255</span> Restantes <br>
					<p class="help-block">* Campo Obrigatório</p>
					
				</div>
			</div>
			<br/>
			<div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="obs" name="obs" type="text" placeholder="Observações da solicitação"
						value="${solicitacao.obs}" onkeyup="limite_textarea_obs(this.value)" style="width: 300px;class="input-xlarge"></textarea>
						<span id="contObs">255</span> Restantes <br>
				</div>
			</div><br/>
			<div class="control-group">
				<label class="control-label">Categoria
					<a class="dcontexto"> (?)
					<span>Hardware - Problema físico no equipamento. <br><br>
						Software - Problema lógico no equipamento. <br><br>
						Rede - Problemas de conexão. <br><br>
						Cabeamento - Serviços de cabeamento estruturado.
					</span></a>
				</label>
				<div class="controls">
					<select class="form-select" id="classificacao"
						name="classificacao" style="width: 150px;">
						<option></option>
						<option>Hardware</option>
						<option>Software</option>
						<option>Rede</option>
						<option>Cabeamento</option>
						<option>Smartphone</option>
						<option>Projeto</option>
						<option>Backup</option>
						<option>Outros</option>
					</select>
				</div>
			</div><br/>
			<div class="control-group">
				<label class="control-label">Classificação
					<a class="dcontexto"> (?)
					<span>Problema - Algo que é recorrente. <br> Incidente - Algo não recorrente. <br> Solicitação - Planejado.</span></a>
				</label>
				<div class="controls">
					<select class="form-select" id="nivelDeIncidencia"
						name="nivelDeIncidencia" style="width: 150px;">
						<option></option>
						<option>Problema</option>
						<option>Incidente</option>
						<option>Solicitação</option>
						<option>Backup</option>
					</select>
				</div>
			</div> <br/>
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Crítico - 2 Horas. <br> Alta - 4 Horas. <br> Média - 24 Horas. <br> Baixa - 48 Horas. <br> Planejada - Evento Planejado.</span>
				</a></label>
				<div class="controls">
					<select class="form-select" id="prioridade"
						name="prioridade" style="width: 250px;">
						<option></option>
						<option>Crítico</option>
						<option>Alta</option>
						<option>Media</option>
						<option>Baixa</option>
						<option>Planejada</option>
					</select>
				</div>
			</div><br/>
			<div class="control-group">
				<label class="control-label">Onsite / Offsite
					<a class="dcontexto"> (?)
					<span>Onsite - Atendimento no local. <br> Offsite - Atendimento remoto.</span></a>
				</label>
				<div class="controls">
					<select class="form-select" id="onsiteOffisite"
						name="onsiteOffsite" style="width: 150px;">
						<option></option>
						<option>Onsite</option>
						<option>Offsite</option>
					</select>
				</div>
			</div><br/>
			<div class="control-group">
				<label class="control-label">Técnico Responsável</label>
				<div class="controls">
					<select class="form-select" alertaFuncionario" id="nomeDoFuncionario"
						name="nomeDoFuncionario" style="width: 250px;">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div><br/>
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="form-select alertaFuncionario" id="status" name="status" style="width: 150px;">
						<option>Abrir</option>
						<option>Em andamento</option>
						<option>Agendar</option>
					</select>
				</div>
			</div><br/>
			<div id="agendamentos" style="display: none">
				<div class="control-group" id="opAgendamentoData">
					<label class="control-label">Data de Agendamento</label>
					<div class="controls">
						<input id="datepicker" name="agendado" type="text" placeholder="Data de agendamento" maxlength="10"
							value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.agendado.time}" />" /> <i class="fa fa-calendar fa-lg"> </i>
					</div>
				</div><br/>
				<div class="control-group" id="opAgendamentoHora">
					<label class="control-label">Hora de Agendamento</label>
					<div class="controls">
						<input id="timepicker" name="agendadoHora" type="text" placeholder="Hora de agendamento" maxlength="10"
							value="<f:formatDate pattern="HH:mm" value="${solicitacao.agendadoHora.time}" />" /> <i class="fa fa-clock-o fa-lg"> </i>
					</div>
				</div>
			</div><br/>
			<div class="form-check">
			    <label class="form-check-label">
			    	Enviar E-mail na abertura
			      <input id="boxEmail" name="boxEmail" type="checkbox" class="form-check-input">
			    </label>
			    <div class="form-group" id="enviaEmail">
					<label class="control-label">Destinatario</label>
		            <div class="controls">
		                <select class="form-control destinatario" name="destinatario" id="destinatario" style="display: none"></select>
		            </div>
	       		</div>
	       		<br/>
			</div>
			<br/><br/>
			<div class="form-check">
			    <label class="form-check-label">
			    	Associar chamado a
			      <input id="boxIdChamado" name="boxIdChamado" type="checkbox" class="form-check-input">
			    </label>
			    <div class="form-group" id="enviaEmail">
					<label class="control-label">ID do Chamado</label>
		            <div class="controls">
		            	<div id="idChamado" style="display: none">
		             	   	<input class="form-control" name="idChamadoLigacao" id="idChamadoLigacao" />
		                	<a href="javascript:func()" id="buscaId"><i class="fa fa-refresh fa-lg" aria-hidden="true"></i></a>
		                	<span id="statusId" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
		                </div>
		            </div>
        		</div>
        		<br/>
			</div>
			<br/>
			<input type="hidden" name="abriuChamado" id="abriuChamado" value="${funcionarioLogado.nome}">
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
		
		
		
		<br /><br />
		<footer class="text-center text-white">
			<div class="container">
				<!-- Grid container -->
			<div class="p-4 pb-0">
				<!-- Section: Social media -->
				<section id="removetocel" class="mb-4">
					<a class="btn btn-primary btn-floating m-1" style="background-color: rgb(0,191,255);" href="#!"
						role="button"></a>
					<a class="btn btn-primary btn-floating m-1" style="background-color: rgb(30,144,255);" href="#!"
						role="button"></a>
					<a class="btn btn-primary btn-floating m-1" style="background-color: rgb(65,105,225);" href="#!"
						role="button"></a>
					<a class="btn btn-primary btn-floating m-1" style="background-color: rgb(0,0,255);" href="#!"
						role="button"></a>
					<a class="btn btn-primary btn-floating m-1" style="background-color: rgb(0,0,205);" href="#!"
						role="button"></a>
					<a class="btn btn-primary btn-floating m-1" style="background-color: rgb(0,0,128);" href="#!"
						role="button"></a>
				</section>
				<!-- Section: Social media -->
			</div>
			<!-- Grid container -->

			<!-- Copyright -->
			<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
				© 2023 Copyright:
				<a class="text-white" href="#">ProvideOne</a>
			</div>
			<!-- Copyright -->
			</footer>
		</footer>


	</div>
	

	
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">
		</script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
		</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous">
		</script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="asset/js/controle-vip.js"></script>
	<script src="asset/js/calendario.js"></script>
	<script>
		  $( function() {
		    $( "#datepicker" ).datepicker();
		  } );
	 </script>
</body>

</html>