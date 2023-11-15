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
	<title>ProviderOne | Funcionario Edit</title>
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
		<a href="funcionarioForm"><i class="fa fa-plus fa-2x" aria-hidden="true"></i></a>
		<p class="pull-right">
		<div class="table-responsive">
		<table class="table" id="tabela-clientes">
			<thead>
				<tr>
					<th scope="col">Nome</th>
					<th scope="col">Usuário</th>
					<th scope="col">Ultimo Login</th>
					<th scope="col">Email</th>
					<th scope="col">Função</th>
					<th scope="col">Celular</th>
					<th scope="col">Data de Atualização</th>
					<th scope="col">Status</th>
					<th scope="col">MFA</th>
					<th scope="col">IP</th>
					<th scope="col">Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="funcionario" items="${funcionarios}">
				<c:if test="${funcionario.status== 'Ativo'}">
					<tr class="table-success">
						<td><a href="relatorioPorFuncionario?nomeDoFuncionario=${funcionario.nome}">${funcionario.nome}</a></td>
						<td>${funcionario.usuario}</td>
						<td><f:formatDate value="${funcionario.ultimoLogin.time}" pattern="dd/MM/yyyy"/>
				  			- <f:formatDate value="${funcionario.ultimoLogin.time}" pattern="HH:mm"/>
				  		</td>
						<c:if test="${not empty funcionario.email}">
							<td>${funcionario.email}</td>
						</c:if>
						<c:if test="${empty funcionario.email}">
							<td>Não cadastrado</td>
						</c:if>
						<td>${funcionario.funcao}</td>
						<td>${funcionario.celular}</td>
						<td><f:formatDate value="${funcionario.dataAtualizacao.time}"
								pattern="dd/MM/yyyy" /></td>
						<td>${funcionario.status}</td>
						<td>${funcionario.statusMfa}</td>
						<td>${funcionario.ip}</td>
						<td><a href="funcionarioEdit?id=${funcionario.id}">Editar</a></td>
					</tr>
				</c:if>
				
				<c:if test="${funcionario.status== 'Inativo'}">
					<tr class="table-warning">
						
						<td><a href="relatorioPorFuncionario?nomeDoFuncionario=${funcionario.nome}">${funcionario.nome}</a></td>
						<td>${funcionario.usuario}</td>
						<td><f:formatDate value="${funcionario.ultimoLogin.time}" pattern="dd/MM/yyyy"/>
				  			- <f:formatDate value="${funcionario.ultimoLogin.time}" pattern="HH:mm"/>
				  		</td>
						<c:if test="${not empty funcionario.email}">
							<td>${funcionario.email}</td>
						</c:if>
						<c:if test="${empty funcionario.email}">
							<td>Não cadastrado</td>
						</c:if>
						<td>${funcionario.funcao}</td>
						<td>${funcionario.celular}</td>
						
						<td><f:formatDate value="${funcionario.dataAtualizacao.time}"
								pattern="dd/MM/yyyy" /></td>
						<td>${funcionario.status}</td>
						<td>${funcionario.statusMfa}</td>
						<td>${funcionario.ip}</td>
						<td><a href="funcionarioEdit?id=${funcionario.id}">Editar</a></td>
					</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
		</div>

		<br /><br />
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

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Edição de Funcionário - <span
								id="nomeclientemodal"></span></h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-3">
								<label class="form-label" for="ididmodal">ID</label>
								<input type="text" id="idmodal" class="form-control" style="width: 80px;" readonly>
							</div>
							<div class="col-md-3">
								<label class="form-label" for="idmodalcliente">ID Cliente</label>
								<input type="text" id="idmodalcliente" class="form-control" style="width: 80px;"
									readonly>
							</div>
							<div class="col-md-5">
								<label class="form-label" for="atualizacaomodal">AtualizaÃ§Ã£o</label>
								<p><b><span id="atualizacaomodal" style="font-size: 12" </span></b></p>
							</div>
						</div>

						<label class="form-label mt-2" for="nomemodal">Nome</label>
						<input type="text" id="nomemodal" class="form-control">
						<label class="form-label mt-2" for="conteudomodal">ConteÃºdo</label>
						<input type="text" id="conteudomodal" class="form-control">
						<label class="form-label mt-2" for="senhamodal">Senha</label>

						<div class="row">
							<div class="col-md-8">
								<input type="password" id="senhamodal" class="form-control" minlength="6" maxlength="50"
									onKeyUp="verificaForcaSenha();" style="width: 320px;">
							</div>
							<div class="col-md-2 mt-2">
								<button onclick="changeviewer()" style="border: none; background: none;">
									<img src="./assets/img/olho.png" style="height: 15px;">
								</button>
							</div>
						</div>

						<span id="password-status"></span><br />
						<label class="form-label" for="observacaomodal">ObservaÃ§Ã£o</label>
						<textarea id="observacaomodal" class="form-control"> </textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
						<button type="button" class="btn btn-primary" onclick="atualiza()">Salvar</button>
					</div>
				</div>
			</div>
		</div>

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

		function changeviewer() {
			var tipo = $('#senhamodal').attr("type").toString();
			if (tipo == 'password') {
				$('#senhamodal').attr("type", 'text');
			} else {
				$('#senhamodal').attr("type", 'password');
			}
		}
		function verificaForcaSenha() {
			var numeros = /([0-9])/;
			var alfabeto = /([a-zA-Z])/;
			var chEspeciais = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;

			if ($('#senhamodal').val().length < 8) {
				$('#password-status').html("<span style='color:red'>Fraco, insira no mÃ­nimo 8 caracteres</span>");
			} else {
				if ($('#senhamodal').val().match(numeros) && $('#senhamodal').val().match(alfabeto) && $('#senhamodal').val().match(chEspeciais)) {
					$('#password-status').html("<span style='color:green'><b>Forte</b></span>");
				} else {
					$('#password-status').html("<span style='color:orange'>MÃ©dio, insira um caracter especial</span>");
				}
			}
		}
		function excluir(id) {
			if (confirm("Tem certeza que deseja excluir?") == true) {
				var t = "#linha" + id;
				var remove = $(t).closest('tr');
				$.ajax({
					type: "DELETE",
					contentType: "application/json",
					url: "/techpass/nota/" + id,
					success: function () {
						remove.fadeOut(1500, function () {
							remove.remove();
						});
					},
					error: function (e) {
						alert(e);
					}
				});
			}
		}
		function editar(id) {
			$.ajax({
				type: "GET",
				contentType: "application/json",
				url: "/techpass/nota/" + id,
				success: function (data) {
					$('#senhamodal').attr("type", 'password');
					$('#idmodal').val("");
					$('#nomeclientemodal').text('');
					$('#idmodalcliente').val("");
					$('#nomemodal').val("");
					$('#conteudomodal').val("");
					$('#senhamodal').val("");
					$('#observacaomodal').val("");
					$('#atualizacaomodal').text('');
					$('#password-status').text('');
					$('#idmodal').val(data.id);
					$('#nomeclientemodal').text(data.cliente.nome);
					$('#idmodalcliente').val(data.cliente.id);
					$('#nomemodal').val(data.nome);
					$('#conteudomodal').val(data.conteudo);
					$('#senhamodal').val(data.senha);
					$('#observacaomodal').val(data.observacao);
					$('#atualizacaomodal').append(data.atualizacao);
				},
				error: function (jqXHR, status, error) {
					var err = eval("(" + jqXHR.responseText + ")");
					alert(err.Message);
				}
			});
		}
		function atualiza() {
			var id = $('#idmodal').val();
			var idCliente = $('#idmodalcliente').val();
			var nome = $('#nomemodal').val();
			var conteudo = $('#conteudomodal').val();
			var senha = $('#senhamodal').val();
			var observacao = $('#observacaomodal').val();

			$.ajax({
				type: "PUT",
				contentType: "application/json",
				url: "/techpass/nota",
				data: JSON.stringify(
					{
						"id": id,
						"nome": nome,
						"conteudo": conteudo,
						"senha": senha,
						"observacao": observacao,
						"cliente": {
							"id": idCliente
						}
					}
				),
				success: function (data) {
					var itens =
						'<tr id=linha' + data.id + '>'
						+ '<td>' + data.cliente.nome + '</td>'
						+ '<td>' + data.nome + '</td>'
						+ '<td>'
						+ ' <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick=editar(' + data.id + ')>Editar</button>'
						+ ' <button class="btn btn-danger btn-sm" onclick=excluir(' + data.id + ')>Excluir</button>'
						+ '</td>'
						+ '</tr>';
					$('#linha' + data.id).remove();
					$('#tabela-clientes').append(itens);
					alert("atualizado com sucesso");
				},
				error: function (e) {
					alert(e.responseText);
				}
			});
		}
	</script>
	
</body>

</html>