<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Home Page</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
	<section class="">	
		<aside class="">
			<a href="upload" >
				<c:if test="${empty tecnicoLogado.caminhoFoto}">
					<img id="imagem" src="assets/img/perfil.png" class="img-polaroid">
				</c:if>
				<c:if test="${not empty tecnicoLogado.caminhoFoto}">
					<img id="imagem" src='${tecnicoLogado.caminhoFoto}' class="img-polaroid">
				</c:if>
			</a>
			<div id="perfil">
				<p class="asid-linha">Usuário : ${tecnicoLogado.usuario} /
				 Ultimo Login : <f:formatDate value="${tecnicoLogado.ultimoLogin.time}" pattern="dd/MM/yyyy"/>
				  - <f:formatDate value="${tecnicoLogado.ultimoLogin.time}" pattern="HH:mm"/></p>
				<p class="asid-linha">Email : ${tecnicoLogado.email}</p>
				<p class="asid-linha">Bem vindo, ${tecnicoLogado.nome}</p>
			</div>
		</aside>
	</section>
	<br/><br/>
	<div class="container" id="imagem">
		<p>
		<font size="2" face="Verdana">
		<a href="upload" > Alterar imagem </a>
		</font>
		</p>
	</div>
	<br/><br/><br/><br/>
	<div class="container">
		<legend></legend>
		<c:if test="${qtdAberto == '0'}"></c:if>
		<c:if test="${qtdAberto == '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdAberto} solicitação <a href="solicitacoesTecnico">Aberta! <i class="fa fa-question-circle"></i></a></h4>
		</c:if>	
		<c:if test="${qtdAberto > '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdAberto} solicitações <a href="solicitacoesTecnico">Abertas! <i class="fa fa-hourglass-half"></i></a></h4>
		</c:if><br/>
		<c:if test="${qtdAgendado == '0'}"></c:if>
		<c:if test="${qtdAgendado == '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdAgendado} solicitação <a href="solicitacoesAgendadosTecnico">Agendada! <i class="fa fa-clock-o"></i></a></h4>
		</c:if>
		<c:if test="${qtdAgendado > '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdAgendado} solicitações <a href="solicitacoesAgendadosTecnico">Agendadas! <i class="fa fa-clock-o"></i></a></h4>
		</c:if><br/>
		<c:if test="${qtdEmAndamento == '0'}"></c:if>
		<c:if test="${qtdEmAndamento == '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdEmAndamento} solicitação <a href="solicitacoesAndamentoTecnico">Em andamento! <i class="fa fa-share"></i></a></h4>
		</c:if>
		<c:if test="${qtdEmAndamento > '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdEmAndamento} solicitações <a href="solicitacoesAndamentoTecnico">Em andamento! <i class="fa fa-share"></i></a></h4>
		</c:if><br/>
		<c:if test="${qtdAguardando == '0'}"></c:if>
		<c:if test="${qtdAguardando == '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdAguardando} solicitação <a href="solicitacoesAguardandoTecnico">Aguardando! <i class="fa fa-thumbs-o-up"></i></a></h4>
		</c:if>
		<c:if test="${qtdAguardando > '1'}">
			<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Você tem ${qtdAguardando} solicitações <a href="solicitacoesAguardandoTecnico">Aguardando! <i class="fa fa-thumbs-o-up"></i></a></h4>
		</c:if>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div class="container">
		<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>