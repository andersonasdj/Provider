<html>
<head>
<!-- Custom Fonts -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<div class="navbar-collapse">
					<ul class="nav">
						<li><a href="homePage"><i class="fa fa-home fa-fw  fa-lg"> </i> Início</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-book fa-fw  fa-lg"> </i> Controle de Chamado <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                    <li class="dropdown-header">Solicitações</li>
			                    <li><a href="solicitacoesTecnico"><i class="fa fa-question-circle"> </i> Abertas</a></li>
			                    <li><a href="solicitacoesAgendadosTecnico"><i class="fa fa-clock-o"> </i> Agendadas</a></li>
			                    <li><a href="solicitacoesAndamentoTecnico"><i class="fa fa-share"> </i> Em Andamento</a></li>
			                    <li><a href="solicitacoesAguardandoTecnico"><i class="fa fa-thumbs-o-up"> </i> Aguardando usuário</a></li><li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Relatório Geral</li>
			                    <li><a href="relatorioTecnico"><i class="fa fa-pie-chart"> </i> Relatório</a></li>
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-desktop  fa-lg"> </i> Inventários <span class="caret"></span></a>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user  fa-lg" > </i> ${tecnicoLogado.nome}<span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li><a href="https://terminal.providerone.com.br/svn"><i class="fa fa-cloud-download"></i> SVN</a></li>
			                  	<li><a href="http://terminal.providerone.com.br/check_mk"><i class="fa fa-wrench"></i> Nagios</a></li>
			                  	<li><a href="assets/apk/ProviderOne.apk"><i class="fa fa-android"></i> APK</a></li>
			                  	<li role="separator" class="divider"></li>
			                    <li><a href="atualizarDados"><i class="fa fa-cog fa-spin"></i>  Meus Dados</a></li>
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