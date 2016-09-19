<html>
<head>
<!-- Custom Fonts -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">  -->
    <!-- <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">  -->
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<div class="navbar-collapse">
					<ul class="nav">
						<li><a href="homePage"><i class="fa fa-home fa-fw"> </i> Início</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bar-chart"></i> Controle de Chamado <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                    <li class="dropdown-header">Solicitações</li>
			                    <li><a href="solicitacaoForm"><i class="fa fa-plus-square"> </i> Abrir Solicitação</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Status</li>
			                    <li><a href="solicitacoesAbertas"><i class="fa fa-question-circle"> </i> Abertas</a></li>
			                    <li><a href="solicitacoesAgendadas"><i class="fa fa-clock-o"> </i> Agendadas</a></li>
			                    <li><a href="solicitacoesAndamento"><i class="fa fa-share"> </i> Em Andamento</a></li>
			                    <li><a href="solicitacoesAguardando"><i class="fa fa-thumbs-o-up"> </i> Aguardando usuário</a></li>
			                    <li><a href="relatorioGeral"><i class="fa fa-pie-chart"> </i> Resumo Geral</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Relatórios</li>
			             		<li><a href="relatorioSelect"><i class="fa fa-area-chart"> </i> Relatório por Cliente</a></li>
			             		<li><a href="relatorioSelectTec"><i class="fa fa-area-chart"> </i> Relatório por Tecnico</a></li>
			                 	<li><a href="relatorioFinalizadas"><i class="fa fa-check"> </i> Solicitações Finalizadas</a></li> 
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-users"> </i> Usuários <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  <li class="dropdown-header">Listar</li>
			                    <li><a href="clientesList">Clientes</a></li>
			                    <li><a href="funcionariosList">Funcionarios</a></li>
			                    <li><a href="fornecedorList">Fornecedores</a></li>
			                    <li role="separator" class="divider"></li>
			                  	<li class="dropdown-header">Cadastros</li>
			                    <li><a href="clienteForm">Cadastro de Cliente</a></li>
			                    <li><a href="funcionarioForm">Cadastro de Funcionário</a></li>
			                    <li><a href="fornecedorForm">Cadastro de Fornecedor</a></li>
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-desktop"> </i> Inventários <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li class="dropdown-header">Listar</li>
			                    <li><a href="computadorList">Máquinas</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Cadastro</li>
			                    <li><a href="computadorForm">Máquinas</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Modelos</li>
			                    <li><a href="perifericosList">Tabela de Modelos</a></li>
			                    <li><a href="perifericosForm">Cadastro de Modelos</a></li>
			                  </ul>
						</li>
					</ul>
					<ul class="nav nav-pills pull-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"> </i> ${funcionarioLogado.nome}<span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li><a href="https://terminal.providerone.com.br/svn"><i class="fa fa-cloud-download"></i> SVN</a></li>
			                  	<li><a href="configEmail"><i class="fa fa-wrench"></i> Configurações</a></li>
			                  	<li><a href="assets/apk/ProviderOne.apk"><i class="fa fa-android"></i> APK</a></li>
			                  	<li role="separator" class="divider"></li>
			                    <li><a href="atualizarDados"><i class="fa fa-cog fa-spin"></i> Meus Dados</a></li>
			                    <li><a href="logout"><i class="fa fa-power-off"></i> Sair</a></li>
			                  </ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>