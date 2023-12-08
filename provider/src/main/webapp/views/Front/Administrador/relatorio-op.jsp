<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<html>

<head>
	<title>ProviderOne - Relatórios</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="asset/css/stylePersonal.css">
</head>

<body>
	<div class="container">
		<br />
		<!-- ################### BARRA DE NAVEGAÇÃO -->
		<nav class="navbar navbar-expand-lg bg-light">
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
								<li><a class="dropdown-item" href="clientes">Listar</a></li>
							</ul>
						</li>
						
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">
								Usuários
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="funcionarios">Listar</a></li>
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
		<spam class="pull-right">
				<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
		</spam>
			<div align="center">
				<div id="">
					<br/><br/>
					<p><a class="btn btn-info" href="relatorioHoje" role="button"> Aberto Hoje ${solicitacoes}</a>
					<a class="btn btn-info" href="finalizadoHoje" role="button"> Finalizados Hoje ${finalizados}</a>
					<a class="btn btn-info" href="atualizadoHoje" role="button"> Atualizados Hoje </a>
					<a class="btn btn-info" href="relatorioPeriodoAbertura" role="button"> Por Período Abertura</a>
					<a class="btn btn-info" href="relatorioPeriodoFechamento" role="button"> Por Período Fechamento</a>
					<a class="btn btn-info" href="relatorioId" role="button"> Por ID</a></P><br/>
					<P><a class="btn btn-info" href="relatorioSelect" role="button">Por Cliente </a>
					<a class="btn btn-info" href="relatorioSelectTec" role="button">Por Tecnico </a>
					<a class="btn btn-info" href="relatorioPalavra" role="button">Por Palavra chave </a>
					<a class="btn btn-info" href="relatorioGeral" role="button"> Não finalizadas</a>
					<a class="btn btn-info" href="solicitacoesExcluidas" role="button"> Solicitações Excluídas</a>
					<a class="btn btn-info" href="relatorioAgendamento" role="button"> Gerar Agendamento</a></p>
				</div>
				<br/>
			</div>

			<table id="table" class="table table-striped"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-search="true"
	               data-key-events="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
				<thead>
				<tr class="" align="center">
					<th data-field="nome" data-sortable="true">Nome</th>
					<th data-field="qtdAberto" data-sortable="true">Quantidade Aberto</th>
					<th data-field="qtdAndamento" data-sortable="true">Quantidade Andamento</th>
					<th data-field="qtdAgendado" data-sortable="true">Quantidade Agendado</th>
					<th data-field="qtdAguardando" data-sortable="true">Quantidade Aguardando</th>
					<th data-field="qtdTotal" data-sortable="true">Total</th>
				</tr>
				</thead>
					<c:forEach var="relatorio" items="${relatorios}">
						<tr class="" align="center">
							<td>${relatorio.nome}</td>
							<td><strong>${relatorio.qtdAberto}</strong></td>	
							<td><strong>${relatorio.qtdAndamento}</strong></td>	
							<td><strong>${relatorio.qtdAgendado}</strong></td>	
							<td><strong>${relatorio.qtdAguardando}</strong></td>	
							<td><strong>${relatorio.qtdTotal}</strong></td>							
						</tr>
					</c:forEach>
			</table>			
		
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<footer class="text-center text-white">
			<div class="container ">
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
	
</body>
</html>