<html>
<head>
	<!-- Custom Fonts -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<div class="navbar-collapse">
					<ul class="nav">
						<li><a href="home"><i class="fa fa-home fa-fw fa-lg"> </i> Home Page</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bar-chart fa-lg"></i> Controle de Solicitação <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li><a href="solicitacaoForm"><i class="fa fa-plus-square"> </i> Nova Solicitação</a></li>
			                    <li><a href="abertos"><i class="fa fa-question-circle"> </i> Abertos</a></li>
			               		<li><a href="agendados"><i class="fa fa-clock-o"> </i> Agendadas</a></li>
			                    <li><a href="andamento"><i class="fa fa-share"> </i> Em Andamento</a></li>
			                    <li><a href="relatorio"><i class="fa fa-pie-chart"> </i> Relatórios</a></li>
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-desktop fa-lg"> </i> Inventário <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li><a href="#">Listar computadores</a></li>
			                  </ul>
						</li>	
					</ul>
					<ul class="nav nav-pills pull-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-lg"> </i> ${clienteLogado.nome}<span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li><a href="atualizarCadastro"><i class="fa fa-cog fa-spin"></i> Atualizar Meus Dados</a></li>
			                    <li><a href="logout"><i class="fa fa-sign-out"></i> Sair</a></li>
			                  </ul>
						</li>
					</ul>
					
				</div>
			</div>
		</div>
	</nav>
</body>
</html>