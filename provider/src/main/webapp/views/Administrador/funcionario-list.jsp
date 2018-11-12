<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Funcionários</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<div class="container">
		<legend>Lista de Funcionários</legend>
		<a href="funcionarioForm"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i></a>
		<p class="pull-right">
			<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
		</p><br/><br/>
		<table id="table"
				data-toggle="table"
               data-show-columns="true"
               data-show-toggle="true"
               data-show-pagination-switch="true"
               data-show-refresh="true"
               data-search="true"
               data-pagination="true"
               data-key-events="true">
            <thead>   
				<tr>
					<th>Foto</th>
					<th data-field="nome" data-sortable="true">Nome</th>
					<th>Usuario</th>
					<th data-field="ultimoLogin" data-sortable="true">Ultimo Login</th>
					<th>E-mail</th>
					<th data-field="funcao" data-sortable="true">Função</th>
					<th>Celular</th>
					<th>Data de Atualização</th>
					<th data-field="status" data-sortable="true">Status</th>
					<th>Ações</th>
				</tr>
			</thead>
			<c:forEach var="funcionario" items="${funcionarios}">
				<c:if test="${funcionario.status== 'Ativo'}">
					<tr class="success">
						<td>
							<c:if test="${empty funcionario.caminhoFoto}">
								<img id="imagem" src="assets/img/perfil.png" class="img-responsive img-rounded miniatura">
							</c:if>
							<c:if test="${not empty funcionario.caminhoFoto}">
								<img id="imagem" src='${funcionario.caminhoFoto}' class="img-responsive img-rounded miniatura" >
							</c:if>
						</td>
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
						
						<td><a href="funcionarioEdit?id=${funcionario.id}">Editar</a></td>
					</tr>
				</c:if>
				
				<c:if test="${funcionario.status== 'Inativo'}">
					<tr class="warning">
						<td>
							<c:if test="${empty funcionario.caminhoFoto}">
								<img id="imagem" src="assets/img/perfil.png" class="img-responsive img-rounded miniatura">
							</c:if>
							<c:if test="${not empty funcionario.caminhoFoto}">
								<img id="imagem" src='${funcionario.caminhoFoto}' class="img-responsive img-rounded miniatura" >
							</c:if>
						</td>
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
						<td><a href="funcionarioEdit?id=${funcionario.id}">Editar</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<br/><br/><br/><br/><br/><br/><br/>
	<legend></legend>
	</div>		
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
</html>