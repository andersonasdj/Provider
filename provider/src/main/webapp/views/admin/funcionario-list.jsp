<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Funcionários</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<div class="container">
		<legend>Lista de Funcionários</legend>
		<table class="table table-condensed">
			<tr>
				<th>Nome</th>
				<th>Usuario</th>
				<th>Ultimo Login</th>
				<th>E-mail</th>
				<th>Função</th>
				<th>Data de Atualização</th>
				<th>Status</th>
				<th>Ações</th>
			</tr>
			<c:forEach var="funcionario" items="${funcionarios}">
				
				<c:if test="${funcionario.status== 'Ativo'}">
					<tr class="success">
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
						<td><f:formatDate value="${funcionario.dataAtualizacao.time}"
								pattern="dd/MM/yyyy" /></td>
						<td>${funcionario.status}</td>
						
						<td><a href="funcionarioEdit?id=${funcionario.id}">Editar</a> <!-- <a
							href="removeFuncionario?id=${funcionario.id}">Excluir</a> --></td>
					</tr>
				</c:if>
				
				<c:if test="${funcionario.status== 'Inativo'}">
					<tr class="warning">
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
						<td><f:formatDate value="${funcionario.dataAtualizacao.time}"
								pattern="dd/MM/yyyy" /></td>
						<td>${funcionario.status}</td>
						<td><a href="funcionarioEdit?id=${funcionario.id}">Editar</a> <!-- <a
							href="removeFuncionario?id=${funcionario.id}">Excluir</a> --></td>
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
</html>