<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Resumo</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<div id="loader"></div>
	<br/><br/><br/>
	<form class="form-search">
		<div class="input-append">
			<legend align="center">Relatório de Solicitações</legend>
		    <input type="text" class="span2 search-query">
		    <button type="submit" class="btn">Buscar Solicitação</button> 
 		 </div>
	</form>
	<table class="table table-condensed">
		<tr class="error">
			<th>ID</th>
			<th>Data da Solicitação</th>
			<th>Hora da Solicitação</th>
			<th>Cliente</th>
			<th>Usuário</th>
			<th>Problema Relatado</th>
			<th>Data Encerramento</th>
			<th>Hora Encerramento</th>
			<th>Técnico</th>
			<th>Status</th>
			<th>Ações</th>
		</tr>
		<c:forEach var="solicitacao" items="${solicitacoes}">
			<c:if test="${solicitacao.status == 'Aberto'}">
				<tr class="error" align="center">
					<td>${solicitacao.id}</td>
					<td><f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/></td>
					<td><f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></td>
					<td>${solicitacao.cliente.nome}</td>
					<td>${solicitacao.usuario}</td>
					<td>${solicitacao.descricaoProblema}</td>
					<td>Aberto</td>
					<td>Aberto</td>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td>${solicitacao.status}</td>
					<td><a href="solicitacaoEdit?id=${solicitacao.id}">Editar </a></td>
				</tr>
			</c:if>	
			<c:if test="${solicitacao.status == 'Finalizado'}">
				<tr class="success">
					<td>${solicitacao.id}</td>
					<td><f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/></td>
					<td><f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></td>
					<td>${solicitacao.cliente.nome}</td>
					<td>${solicitacao.usuario}</td>
					<td>${solicitacao.descricaoProblema}</td>
					<td><f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/></td>
					<td><f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/></td>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td>${solicitacao.status}</td>
					<td><a href="solicitacaoEdit?id=${solicitacao.id}">Editar</a></td>
				</tr>
			</c:if>
			<c:if test="${solicitacao.status == 'Agendado'}">
				<tr class="warning">
					<td>${solicitacao.id}</td>
					<td><f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/></td>
					<td><f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></td>
					<td>${solicitacao.cliente.nome}</td>
					<td>${solicitacao.usuario}</td>
					<td>${solicitacao.descricaoProblema}</td>
					<td>Aberto</td>
					<td>Aberto</td>
					<c:if test="${empty solicitacao.funcionario.nome}">
						<td><a href="solicitacaoEdit?id=${solicitacao.id}">Não Atribuido</a></td>
					</c:if>
					<c:if test="${not empty solicitacao.funcionario.nome}">
						<td>${solicitacao.funcionario.nome}</td>
					</c:if>
					<td>${solicitacao.status}</td>
					<td><a href="solicitacaoEdit?id=${solicitacao.id}">Editar</a></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<br/><br/>
	<legend></legend>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
        // Este evendo é acionado após o carregamento da página
        jQuery(window).load(function() {
            //Após a leitura da pagina o evento fadeOut do loader é acionado, esta com delay para ser perceptivo em ambiente fora do servidor.
            jQuery("#loader").delay(10).fadeOut("slow");
        });
    </script>
</html>