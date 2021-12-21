<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | In�cio</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<div class="container">
		<div id="containerPerfil">
				<aside class="">
					<a href="upload" >
						<c:if test="${empty funcionarioLogado.caminhoFoto}">
							<img id="imagem" src="assets/img/perfil.png" class="img-polaroid">
						</c:if>
						<c:if test="${not empty funcionarioLogado.caminhoFoto}">
							<img id="imagem" src='${funcionarioLogado.caminhoFoto}' class="img-polaroid">
						</c:if>
					</a>
					<div id="perfil">
						<p class="asid-linha">Usu�rio : ${funcionarioLogado.usuario} /
						 Ultimo Login : <f:formatDate value="${funcionarioLogado.ultimoLogin.time}" pattern="dd/MM/yyyy"/>
						  - <f:formatDate value="${funcionarioLogado.ultimoLogin.time}" pattern="HH:mm"/></p>
						<p class="asid-linha">IP :<b> ${funcionarioLogado.ip}</b></p>
						<p class="asid-linha">Email : ${funcionarioLogado.email}</p>
						<p class="asid-linha">Bem vindo, ${funcionarioLogado.nome}</p>
					</div>
				</aside>
			<br/><br/>
			<div class="container" id="imagem">
				<p>
				<font size="2" face="Verdana">
				<a href="upload" > Alterar imagem </a>
				</font>
				</p>
			</div>
		</div>
	</div>
	<br/><br/><br/><br/>
	<div class="container">
		<legend></legend>
		<div class="row">
			<div class="col-md-7">
				<c:if test="${qtdAberto == '0'}"></c:if>
				<c:if test="${qtdAberto == '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdAberto} solicita��o <a href="solicitacoesAbertas">Aberta <i class="fa fa-question-circle"></i></a></h4>
				</c:if>	
				<c:if test="${qtdAberto > '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdAberto} solicita��es <a href="solicitacoesAbertas">Abertas <i class="fa fa-question-circle"></i></a></h4>
				</c:if><br/>
				<c:if test="${qtdAgendado == '0'}"></c:if>
				<c:if test="${qtdAgendado == '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdAgendado} solicita��o <a href="solicitacoesAgendadas">Agendada <i class="fa fa-clock-o"></i></a></h4>
				</c:if>	
				<c:if test="${qtdAgendado > '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdAgendado} solicita��es <a href="solicitacoesAgendadas">Agendadas <i class="fa fa-clock-o"></i></a></h4>
				</c:if><br/>
				<c:if test="${qtdEmAndamento == '0'}"></c:if>
				<c:if test="${qtdEmAndamento == '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdEmAndamento} solicita��o <a href="solicitacoesAndamento">Em andamento <i class="fa fa-share"></i></a></h4>
				</c:if>	
				<c:if test="${qtdEmAndamento > '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdEmAndamento} solicita��es <a href="solicitacoesAndamento">Em andamento <i class="fa fa-share"></i></a></h4>
				</c:if><br/>
				
				<c:if test="${qtdAguardando == '0'}"></c:if>
				<c:if test="${qtdAguardando == '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdAguardando} solicita��o <a href="solicitacoesAguardando">Aguardando! <i class="fa fa-thumbs-o-up"></i></a></h4>
				</c:if>
				<c:if test="${qtdAguardando > '1'}">
					<h4><i class="fa fa-circle-o-notch fa-spin"> </i> Voc� tem ${qtdAguardando} solicita��es <a href="solicitacoesAguardando">Aguardando! <i class="fa fa-thumbs-o-up"></i></a></h4>
				</c:if>
			</div>
			<div class="col-md-5">
				<c:if test="${qtdAgendadoHoje >= '1'}">
					<p>
						<h4><a href="agendamentosHoje">
							<span style="color: brue"><i class="fa fa-check" aria-hidden="true"> </i>
							 	Agendamentos para hoje ${qtdAgendadoHoje}
							 </span></a>
						</h4>
					</p><br/>
				</c:if>
				<c:if test="${qtdAgendadoAtrasado >= '1'}">
					<p>
						<h4><a href="agendamentosAtrasados">
							<span style="color: red"><i class="fa fa-exclamation-triangle" aria-hidden="true"> </i> 
								Agendamentos atrasados ${qtdAgendadoAtrasado}
							</span></a> 
						</h4>
					</p>
				</c:if>
			</div>
		</div>
	</div>
	<br/><br/><br/><br/>
	<div class="container">
	<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>