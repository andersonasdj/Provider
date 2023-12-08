<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="asset/css/stylePersonal.css">
	<title>ProviderOne - Home</title>
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
	

		<legend>Versão 1.9.2</legend>
			<ul>
				<li>Alterado o tipo de criptografia	</li>
				<li>Acrescentado 2 dígitos no código MFA </li>
			</ul>
			<legend>Versão 1.9.1</legend>
			<ul>
				<li>Correção de carregamento de Json com unicode windows-1252
					<ul>
						<li>Correção do charset para carregamento de solicitante.</li>
						<li>Correção do charset para carregamento de usuário afetado.</li>
						<li>Correção do charset para carregamento de cardo de usuário</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Versão 1.9</legend>
			<ul>
				<li>Inclusão de Login com MFA
					<ul>
						<li>Incluída opção de adição de configuração de email para envio do código MFA.</li>
						<li>Opção de ativar ou desativar MFA por usuário.</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Versão 1.8</legend>
			<ul>
				<li>Controle de pause e play em solicitações em andamento.
					<ul>
						<li>A solicitação em andamento pode ser pausada, deixando de contabilizar tempo de atendimento.</li>
						<li>Uma solicitação em estado "Aguardando" somente contabiliza ao voltar para "Em andamento", será somado com o tempo gasto antes do "Aguardando".</li>
					</ul>
				</li>
				<li>Opção de exportação de lista de colaboradores de clientes.</li>
			</ul><br/>
			<legend>Versão 1.7</legend>
			<ul>
				<li>Associação de chamado.
					<ul>
						<li>Um chamado associado outro chamado, somente poderár ser iniciado ao finalizar o anterior.</li>
					</ul>
				</li>
				<li>Status de "Aguardando usuário" foi alterado para "Aguardando."</li>
				<li>Inserido nível de prioridade "Crítico" para abertura de chamado.</li>
				<li>Limitações de alterações de status e técino responsável.
					<ul>
						<li>O chamado somente poderá ficar sem técino no status "Aberto" e "Agendado"</li>
					</ul>
				</li>
				<li>Novos ícones na listagem dos chamados.
					<ul>
						<li>Inserido ícone de criticidade na listagem dos chamados.</li>
						<li>Inserido ícone de cliente vip na listagem dos chamados.</li>
						<li>Inserido ícone de RedFlag na listagem dos chamados.</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Versão 1.6</legend>
			<ul>
				<li>Auto preenchimento ao solicitante e usuário afetado ao selecionar o cliente.
					<ul>
						<li>Exibição do cargo do solicitante.</li>
						<li>Exibição do cargo do usuário afetado.</li>
					</ul>
				</li>
				<li>Auto preenchimento da lista de e-mails dos destinatários ao selecionar o cliente.
					<ul>
						<li>Cadastro do cargo do funcionário.</li>
					</ul>
				</li>
				<li>Opção de informar Red Flag e cliente Vip na edição do cliente</li>
				<li>Criação, edição e exclusão de colaboraderes para os clientes.</li>
				<li>Classificação de solicitação pelo cliente após finalização</li>
				<li>Link de acompanhamento de protocolo na pagina de edição de chamado.</li>
			</ul><br/>
			<legend>Versão 1.5</legend>
			<ul>
				<li>Nova opção para copiar uma solicitação.</li>
				<ul>
						<li>Uma nova solicitação é criada a partir do modelo de outra solicitação.</li>
				</ul>
				<li>Chamados excluidos irão para lista de Excluidos, não são deletados do banco.</li>
				<li>Lista de chamados excluídos.</li>
				<li>Lista de chamads atualizados no dia</li>
				<li>Cópia rápida de solicitante para usuário afetado (Função desabilitada).</li>
				<li>Exibição da data de modificação da solicitação.</li>
				<li>Logs de solicitação abrem em nova janela.</li>
				<li>Novas funcionalidades para inclusão de checklists e procedimentos.
					<ul>
						<li>Inclusão de checklists padrões.</li>
						<li>Inclisão de checklists personalizados por cliente.</li>
						<li>Inclusão de procedimentos separados por tarefas.</li>
						<li>Versão impressa de checklist.</li>
					</ul>
				</li>
			</ul>







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