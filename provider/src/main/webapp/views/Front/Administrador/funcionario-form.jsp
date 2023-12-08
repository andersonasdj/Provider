<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<title>ProviderOne | Formulario de Usuário</title>
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
	<form action="gravaFuncionario" method="post">
		<div id="form-usuario">
			<label for="nome" class="form-laber">Nome</label>
			<input type="text" id="nome" name="nome" class="form-control" style="width: 400px;" required>

			<label for="usuario" class="form-laber mt-2">Usuário</label>
			<input type="text" id="usuario" name="usuario" class="form-control" style="width: 250px;" required>

			<label for="senha" class="form-laber mt-2">Senha</label>
			<button onclick="changeviewer()" style="border: none; background: none;">
				<img src="asset/img/olho.png" style="height: 15px;">
			</button>
			<input type="password" id="senha" name="senha" class="form-control mt-2" minlength="6" maxlength="50"
				onKeyUp="verificaForcaSenha();" style="width: 250px;" required>
			<span id="password-status"></span><br />

			<label class="form-label" for="email">Email</label>
			<input type="text" id="email" name="email" class="form-control" style="width: 400px;" required>
			
			<label class="form-label" for="funcao">Função</label>
			<select class="form-select" id="funcao" name="funcao" aria-label="Default select example" style="width: 150px;" required>
					<option>Tecnico</option>
					<option>Administrador</option>
			</select>
			
			<label for="celular" class="form-laber mt-2">Celular</label>
			<input type="text" id="celular" name="celular" class="form-control" style="width: 250px;">
		</div>
		<br />
		<button class="btn btn-success" id="enviar" name="enviar"">Salvar</button>
		<a class="btn btn-primary" href="homePage" role="button">Voltar</a>
	</form>
		<br /><br />
		<footer class="text-center text-white">
			<div class="container ">
				<!-- Grid container -->
			<div class="p-4 pb-0">
				<!-- Section: Social media -->
				<section class="mb-4">
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
	<script>
		function verificaForcaSenha() {
			var numeros = /([0-9])/;
			var alfabeto = /([a-zA-Z])/;
			var chEspeciais = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;

			if ($('#senha').val().length < 8) {
				$('#password-status').html("<span style='color:red'>Fraco, insira no mínimo 8 caracteres</span>");
			} else {
				if ($('#senha').val().match(numeros) && $('#senha').val().match(alfabeto) && $('#senha').val().match(chEspeciais)) {
					$('#password-status').html("<span style='color:green'><b>Forte</b></span>");
				} else {
					$('#password-status').html("<span style='color:orange'>Médio, insira um caracter especial</span>");
				}
			}
		}
	</script>
	<script>
		function changeviewer() {
			var tipo = $('#senha').attr("type").toString();
			if (tipo == 'password' && tipo != '') {
				$('#senha').attr("type", 'text');
			} else {
				$('#senha').attr("type", 'password');
			}
		}
	</script>
</body>

</html>